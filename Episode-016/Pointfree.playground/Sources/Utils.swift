// NB: `@_exported` will make foundation available in our playgrounds
@_exported import Foundation
import XCTest
@_exported import UIKit


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

public func |> <A>(_ x: A, f: (inout A) -> Void) -> Void {
    var a = x
    return f(&a)
}

precedencegroup ForwardComposition {
    associativity: left
    higherThan: EffectfulComposition
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

public func curry<A, B, C>(_ f: @escaping (A, B) -> C) -> (A) -> (B) -> C {
    return { a in
        { b in
            return f(a, b)
        }
    }
}

public func flip<A, B, C>(_ f: @escaping (A) -> (B) -> C) -> (B) -> (A) -> C {

  return { b in { a in f(a)(b) } }
}

public func flip<A, C>(_ f: @escaping (A) -> () -> C) -> () -> (A) -> C {

  return { { a in f(a)() } }
}

public func zurry<A>(_ f: () -> A) -> A {
  return f()
}

precedencegroup BackwardsComposition {
    associativity: left
}
infix operator <<<: BackwardsComposition
public func <<< <A, B, C>(_ f: @escaping (B) -> C, _ g: @escaping (A) -> B) -> (A) -> C {
    return { f(g($0)) }
}

public func first<A, B, C>(_ f: @escaping (A) -> C) -> ((A, B)) -> (C, B) {
    return { pair in
        (f(pair.0), pair.1)
    }
}

public func second<A, B, C>(_ f: @escaping (B) -> C) -> ((A, B)) -> (A, C) {
    return { pair in
        (pair.0, f(pair.1))
    }
}

public func map<A, B>(_ f: @escaping (A) -> B) -> ([A]) -> [B] {
    return { xs in xs.map(f) }
}

public func pow(_ a: Int, _ b: Int) -> Int {
  return Int(pow(Double(a), Double(b)))
}

public enum Either<A, B> {
    case left(A)
    case right(B)
}

public enum Result<Value, Error> {
  case success(Value)
  case failure(Error)
}

precedencegroup EffectfulComposition {
    associativity: left
    higherThan: ForwardApplication
}
infix operator >=>: EffectfulComposition
public func >=> <A, B, C>(
    _ f: @escaping (A) -> (B, [String]),
    _ g: @escaping (B) -> (C, [String])
) -> (A) -> (C, [String]) {
    
    return { a in
        let (b, logs) = f(a)
        let (c, moreLogs) = g(b)
        return (c, logs + moreLogs)
    }
}

prefix operator ^

public prefix func ^ <Root, Value>(kp: KeyPath<Root, Value>) -> (Root) -> Value {
  return { $0[keyPath: kp] }
}
