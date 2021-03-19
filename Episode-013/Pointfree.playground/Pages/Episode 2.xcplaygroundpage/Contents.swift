
func compute(_ x: Int) -> Int {
    return x * x + 1
}

compute(2)

assertEqual(5, compute(2))
assertEqual(6, compute(2))

func computeWithEffect(_ x: Int) -> Int {
    let computation = x * x + 1
    print(computation)
    return computation
}

computeWithEffect(2)
assertEqual(5, computeWithEffect(2))

__

[2, 10].map(compute).map(compute)
[2, 10].map(compute >>> compute)

[2, 10].map(computeWithEffect).map(computeWithEffect)
__
[2, 10].map(computeWithEffect >>> computeWithEffect)


func computeAndPrint(_ x: Int) -> (Int, [String]) {
    let computation = x * x + 1
    return (computation, ["Computed \(computation)"])
}

computeAndPrint(2)
assertEqual(
    (5, ["Computed 5"]),
    computeAndPrint(2)
)

assertEqual(
    (5, ["Computed 3"]),
    computeAndPrint(2)
)
__
let (computation, logs) = computeAndPrint(2)
logs.forEach { print($0) }


func compose<A, B, C>(_ f: @escaping (A) -> (B, [String]), _ g: @escaping (B) -> (C, [String])) -> (A) -> (C, [String]) {
    return  { a in
        let (b, logs) = f(a)
        let (c, moreLogs) = g(b)
        return (c, logs + moreLogs)
    }
}

2 |> compose(computeAndPrint, computeAndPrint)

2 |> compose(compose(computeAndPrint, computeAndPrint), computeAndPrint)
2 |> compose(computeAndPrint, compose(computeAndPrint, computeAndPrint))

precedencegroup EffectfulComposition {
    associativity: left
    higherThan: ForwardApplication
    lowerThan: ForwardComposition
}
infix operator >=>: EffectfulComposition
func >=> <A, B, C>(
    _ f: @escaping (A) -> (B, [String]),
    _ g: @escaping (B) -> (C, [String])
) -> (A) -> (C, [String]) {
    
    return { a in
        let (b, logs) = f(a)
        let (c, moreLogs) = g(b)
        return (c, logs + moreLogs)
    }
}

computeAndPrint >=> computeAndPrint >=> computeAndPrint

2
    |> computeAndPrint
    >=> computeAndPrint
    >=> computeAndPrint

2
  |> computeAndPrint
  >=> incr
  >>> computeAndPrint
  >=> square
  >>> computeAndPrint

func >=> <A, B, C>(
  _ f: @escaping (A) -> B?,
  _ g: @escaping (B) -> C?
  ) -> ((A) -> C?) {

  return { a in
    if let b = f(a) {
        return g(b)
    }
    return nil
  }
}

String.init(utf8String:) >=> URL.init(string:)

func greetWithEffect(_ name: String) -> String {
  let seconds = Int(Date().timeIntervalSince1970) % 60
  return "Hello \(name)! It's \(seconds) seconds past the minute."
}

greetWithEffect("Blob")

assertEqual(
  "Hello Blob! It's 32 seconds past the minute.",
  greetWithEffect("Blob")
)

func greet(at date: Date = Date(), name: String) -> String {
  let s = Int(date.timeIntervalSince1970) % 60
  return "Hello \(name)! It's \(s) seconds past the minute."
}

greet(name: "Blob")

assertEqual(
  "Hello Blob! It's 39 seconds past the minute.",
  greet(at: Date(timeIntervalSince1970: 39), name: "Blob")
)

func uppercased(_ string: String) -> String {
  return string.uppercased()
}
"Blob" |> uppercased >>> greetWithEffect
"Blob" |> greetWithEffect >>> uppercased

func greet(at date: Date) -> (String) -> String {
  return { name in
    let s = Int(date.timeIntervalSince1970) % 60
    return "Hello \(name)! It's \(s) seconds past the minute."
  }
}

uppercased >>> greet(at: Date())
greet(at: Date()) >>> uppercased

assertEqual(
  "Hello Blob! It's 37 seconds past the minute.",
  "Blob" |> greet(at: Date(timeIntervalSince1970: 37))
)

let formatter = NumberFormatter()

func decimalStyle(_ format: NumberFormatter) {
  format.numberStyle = .decimal
  format.maximumFractionDigits = 2
}

func currencyStyle(_ format: NumberFormatter) {
  format.numberStyle = .currency
  format.roundingMode = .down
}

func wholeStyle(_ format: NumberFormatter) {
  format.maximumFractionDigits = 0
}

decimalStyle(formatter)
wholeStyle(formatter)
formatter.string(for: 1234.6)

currencyStyle(formatter)
formatter.string(for: 1234.6)

decimalStyle(formatter)
wholeStyle(formatter)
formatter.string(for: 1234.6)

struct NumberFormatterConfig {
  var numberStyle: NumberFormatter.Style = .none
  var roundingMode: NumberFormatter.RoundingMode = .up
  var maximumFractionDigits: Int = 0

  var formatter: NumberFormatter {
    let result = NumberFormatter()
    result.numberStyle = self.numberStyle
    result.roundingMode = self.roundingMode
    result.maximumFractionDigits = self.maximumFractionDigits
    return result
  }
}

func decimalStyle(_ format: NumberFormatterConfig) -> NumberFormatterConfig {
  var format = format
  format.numberStyle = .decimal
  format.maximumFractionDigits = 2
  return format
}

func currencyStyle(_ format: NumberFormatterConfig) -> NumberFormatterConfig {
  var format = format
  format.numberStyle = .currency
  format.roundingMode = .down
  return format
}

func wholeStyle(_ format: NumberFormatterConfig) -> NumberFormatterConfig {
  var format = format
  format.maximumFractionDigits = 0
  return format
}

var config = NumberFormatterConfig()

wholeStyle(decimalStyle(config))
  .formatter
  .string(for: 1234.6)

currencyStyle(config)
  .formatter
  .string(for: 1234.6)

wholeStyle(decimalStyle(config))
  .formatter
  .string(for: 1234.6)

func inoutDecimalStyle(_ format: inout NumberFormatterConfig) {
  format.numberStyle = .decimal
  format.maximumFractionDigits = 2
}

func inoutCurrencyStyle(_ format: inout NumberFormatterConfig) {
  format.numberStyle = .currency
  format.roundingMode = .down
}

func inoutWholeStyle(_ format: inout NumberFormatterConfig) {
  format.maximumFractionDigits = 0
}


inoutCurrencyStyle(&config)
config.formatter.string(from: 1234.6)

inoutDecimalStyle(&config)
inoutWholeStyle(&config)
config.formatter.string(from: 1234.6)

precedencegroup SingleTypeComposition {
  associativity: left
  higherThan: ForwardApplication
}
infix operator <>: SingleTypeComposition

func <> <A>(
  f: @escaping (A) -> A,
  g: @escaping (A) -> A)
  -> ((A) -> A) {

  return f >>> g
}

func <> <A>(
  f: @escaping (inout A) -> Void,
  g: @escaping (inout A) -> Void)
  -> ((inout A) -> Void) {

  return { a in
    f(&a)
    g(&a)
  }
}

func |> <A>(a: inout A, f: (inout A) -> Void) -> Void {
  f(&a)
}

config |> decimalStyle <> currencyStyle
config |> inoutDecimalStyle <> inoutCurrencyStyle
