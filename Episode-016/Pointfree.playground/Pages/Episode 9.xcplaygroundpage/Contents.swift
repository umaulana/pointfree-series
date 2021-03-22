
let a = 2
let b = 3
let c = 4
pow(pow(a, b), c) == pow(a, b * c)
// (a <- b) <- c = a <- (b * c)
// c -> (b -> a) = (b * c) -> a

// (C) -> (B) -> A = (B, C) -> A

func uncurry<A, B, C>(_ f: @escaping (A) -> (B) -> C) -> (A, B) -> C {
    return { a, b in
        f(a)(b)
    }
}

String.init(data:encoding:)
curry(String.init(data:encoding:))
uncurry(curry(String.init(data:encoding:)))

// a^1 = a
pow(a, 1) == a
pow(b, 1) == b
pow(c, 1) == c

// a^1 = a
// a <- 1 = a
// 1 -> a = a

// (Void) -> A = A

func zurry<A>(_ f: () -> A) -> A {
  return f()
}

func unzurry<A>(_ a: A) -> () -> A {
  return { a }
}

// a^0 = 1
pow(a, 0) == 1
pow(b, 0) == 1
pow(c, 0) == 1
pow(0, 0) == 1

// a^0 = 1
// a <- 0 = 1
// 0 -> a = 1

// Never -> A = Void

func to<A>(_ f: (Never) -> A) -> Void {
  return ()
}

func from<A>(_ void: Void) -> (Never) -> A {
    return { never in
        switch never {

        }
    }
}

func absurd<A>(_ never: Never) -> A {
    switch never {
    
    }
}

public enum Result<Value, Error> {
  case success(Value)
  case failure(Error)
}

extension Result {
  func fold<A>(ifSuccess: (Value) -> A, ifFailure: (Error) -> A) -> A {
    switch self {
    case let .success(value):
      return ifSuccess(value)
    case let .failure(error):
      return ifFailure(error)
    }
  }
}

let result: Result<Int, String> = .success(2)
result
  .fold(ifSuccess: { _ in "Ok" }, ifFailure: { _ in "Something went wrong" })

let infallibleResult: Result<Int, Never> = .success(2)
infallibleResult
  .fold(ifSuccess: { _ in "Ok" }, ifFailure: absurd)

Data.init(from:)

// (A) throws -> B == (A) -> Result<B, Error>

func unthrow<A, B>(_ f: @escaping (A) throws -> B) -> (A) -> Result<B, Error> {
  return { a in
    do {
      return .success(try f(a))
    } catch {
      return .failure(error)
    }
  }
}

func throwing<A, B>(_ f: @escaping (A) -> Result<B, Error>) -> (A) throws -> B {
  return { a in
    switch f(a) {
    case let .success(value):
      return value
    case let .failure(error):
      throw error
    }
  }
}

Data.init(from:)
unthrow(Data.init(from:))
throwing(unthrow(Data.init(from:)))

// a^(b + c) = a^b * a^c
pow(a, b + c) == pow(a, b) * pow(a, c)

// a^(b + c) = a^b * a^c
// a <- (b + c) = (a <- b) * (a <- c)
// (b + c) -> a = (b -> a) * (c -> a)

// Either<B, C> -> A = (B -> A, C -> A)

func to<A, B, C>(_ f: @escaping (Either<B, C>) -> A) -> ((B) -> A, (C) -> A) {
    let first: (B) -> A = { b in
        let eitherB: Either<B, C> = .left(b)
        return f(eitherB)
    }
    let second: (C) -> A = { c in
        let eitherC: Either<B, C> = .right(c)
        return f(eitherC)
    }
    return (first, second)
}

func from<A, B, C>(_ f: ((B) -> A, (C) -> A)) -> (Either<B, C>) -> A {
    return { eitherBC in
        switch eitherBC {
            case let .left(b):
                return f.0(b)
            case let .right(c):
                return f.1(c)
        }
    }
}

// (a * b)^c = a^c * b^c
pow(a * b, c) == pow(a, c) * pow(b, c)

// (a * b)^c = a^c * b^c
// (a * b) <- c = (a <- c) * (b <- c)
// c -> (a * b) = (c -> a) * (c -> b)

// (C) -> (A, B) = ((C) -> A, (C) -> B)

func to<A, B, C>(_ f: @escaping (C) -> (A, B)) -> ((C) -> A, (C) -> B) {
    let first: (C) -> A = { c in
        return f(c).0
    }
    let second: (C)  -> B = { c in
        return f(c).1
    }
    return (first, second)
}

func from<A, B, C>(_ f: ((C) -> A, (C) -> B)) -> (C) -> (A, B) {
    return { c in
        let a = f.0(c)
        let b = f.1(c)
        return (a, b)
    }
}
