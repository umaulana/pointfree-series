

func greet(at date: Date, name: String) -> String {
    let seconds = Int(date.timeIntervalSince1970) % 60
    return "Hello \(name)! It's \(seconds) seconds past the minute."
}

func greet(at date: Date) -> (String) -> String {
    return { name in
        let seconds = Int(date.timeIntervalSince1970) % 60
        return "Hello \(name)! It's \(seconds) seconds past the minute."
    }
}

func curry<A, B, C>(_ f: @escaping (A, B) -> C) -> (A) -> (B) -> C {
    return { a in
        { b in
            return f(a, b)
        }
    }
}

greet(at:name:)
curry(greet(at:name:))
greet(at:)

curry(String.init(data:encoding:)) >>> { $0(.utf8) }

func flip<A, B, C>(_ f: @escaping (A) -> (B) -> C) -> (B) -> (A) -> C {
    return { b in
        return { a in
            f(a)(b)
        }
    }
}

flip(curry(String.init(data:encoding:)))
let stringWithEncoding = flip(curry(String.init(data:encoding:)))
let uft8String = stringWithEncoding(.utf8)

String.uppercased(with:)("Hello")(Locale.init(identifier: "en"))

let uppercasedWithLocale = flip(String.uppercased(with:))
let uppercasedWithEn = uppercasedWithLocale(Locale.init(identifier: "en"))

"Hello" |> uppercasedWithEn

flip(String.uppercased)
//flip(String.uppercased)()
//"Hello" |> flip(String.uppercased)()

func zurry<A>(_ f: () -> A) -> A {
  return f()
}

//"Hello" |> zurry(flip(String.uppercased))

func map<A, B>(_ f: @escaping (A) -> B) -> ([A]) -> [B] {
    return { a in
        a.map(f)
    }
}

map(incr)
map(square)
map(incr >>> square >>> String.init)

Array(1...10)
  .filter { $0 > 5 }

func filter<A>(_ p: @escaping (A) -> Bool) -> ([A]) -> [A] {
  return { $0.filter(p) }
}

Array(1...10)
  |> filter { $0 > 5 }
  >>> map(incr >>> square)
