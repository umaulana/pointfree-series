import Foundation

struct Pair<A, B> {
  let first: A
  let second: B
}

Pair<Bool, Bool>(first: true, second: true)
Pair<Bool, Bool>(first: true, second: false)
Pair<Bool, Bool>(first: false, second: true)
Pair<Bool, Bool>(first: false, second: false)

enum Three {
  case one
  case two
  case three
}

Pair<Bool, Three>(first: true, second: .one)
Pair<Bool, Three>(first: true, second: .two)
Pair<Bool, Three>(first: true, second: .three)
Pair<Bool, Three>(first: false, second: .one)
Pair<Bool, Three>(first: false, second: .two)
Pair<Bool, Three>(first: false, second: .three)

let _: Void = Void()
let _: Void = ()
let _: () = ()

func foo(_ x: Int) /* -> Void */ {
   return ()
}

Pair<Bool, Void>(first: true, second: ())
Pair<Bool, Void>(first: false, second: ())

Pair<Void, Void>(first: (), second: ())

enum Never {}

enum Either<A, B> {
  case left(A)
  case right(B)
}

struct Unit {}
let unit = Unit()

func sum(_ xs: [Int]) -> Int {
  var result: Int = 0
  for x in xs {
    result += x
  }
  return result
}

func product(_ xs: [Int]) -> Int {
  var result: Int = 1
  for x in xs {
    result *= x
  }
  return result
}

sum([1, 2]) + sum([3]) == sum([1, 2] + [3])
product([1, 2]) * product([3]) == product([1, 2] + [3])

sum([]) == 0
product([]) == 1

// Void = 1
// A * 1 = A = 1 * A

// Never = 0
// A * 0 = 0 = 0 * A

// A + 0 = A = 0 + A
// A + 1 = 1 + A = A?

enum Optional<A> {
  case none
  case some(A)
}

// Either<Pair<A, B>, Pair<A, C>>
// A * B + A * C
// A * (B + C)
//Pair<A, Either<B, C>>
// Pair<Either<A, B>, Either<A, C>>
// (A + B) * (A + C)
// A * A + A * C + B * A + B * C

//URLSession.shared.dataTask(with: <#T##URLRequest#>, completionHandler: <#T##(Data?, URLResponse?, Error?) -> Void#>)

// (Data + 1) * (URLResponse + 1) * (Error + 1)
