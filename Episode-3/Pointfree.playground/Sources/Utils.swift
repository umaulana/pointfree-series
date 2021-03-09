// NB: `@_exported` will make foundation available in our playgrounds
@_exported import Foundation
import XCTest


@discardableResult
public func assertEqual<A: Equatable>(_ lhs: A, _ rhs: A) -> String {
    return lhs == rhs ? "✅" : "❌"
}

@discardableResult
public func assertEqual<A: Equatable, B: Equatable>(_ lhs: (A, B), _ rhs: (A, B)) -> String {
    return lhs == rhs ? "✅" : "❌"
}

public var __: Void {
    return print("--")
}

precedencegroup ForwardApplication {
    associativity: left
}
infix operator |>: ForwardApplication
public func |> <A, B>(_ x: A, f: (A) -> B) -> B {
    return f(x)
}

precedencegroup ForwardComposition {
    associativity: left
    higherThan: ForwardApplication
}

infix operator >>>: ForwardComposition
public func >>> <A, B, C>(_ f: @escaping  (A) -> B, g: @escaping  (B) -> C) -> (A) -> C {
    return { a in
        g(f(a))
    }
}

public func incr(_ x: Int) -> Int {
    return x + 1
}

public func square(_ x: Int) -> Int {
    return x * x
}

precedencegroup SingleTypeComposition {
  associativity: right
  higherThan: ForwardApplication
}
infix operator <>: SingleTypeComposition
public func <> <A>(f: @escaping (A) -> A, g: @escaping (A) -> A) -> (A) -> A {
  return f >>> g
}
public func <> <A>(f: @escaping (inout A) -> Void, g: @escaping (inout A) -> Void) -> (inout A) -> Void {
  return { a in
    f(&a)
    g(&a)
  }
}
