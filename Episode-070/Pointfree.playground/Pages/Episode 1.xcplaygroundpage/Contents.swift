
func incr(_ x: Int) -> Int {
    return x + 1
}

incr(2)

func square(_ x: Int) -> Int {
    return x * x
}

square(incr(2))

extension Int {
    func incr() -> Int {
        return self + 1
    }
    
    func square() -> Int {
        return self * self
    }
}

2.incr().square()

precedencegroup ForwardApplication {
    associativity: left
}

infix operator |>: ForwardApplication

func |> <A,B>(a: A, f: (A) -> B) -> B {
    return f(a)
}

2 |> incr
2 |> incr |> square

precedencegroup ForwardComposition {
    associativity: left
    higherThan: ForwardApplication
}

infix operator >>>: ForwardComposition

func >>><A,B,C>(f: @escaping (A) -> B, g: @escaping (B) -> C) -> (A) -> C {
    return { a in
        g(f(a))
    }
}

square >>> incr
2 |> square >>> incr

[1,2,3]
    // $0 is point
    .map { ($0 + 1) * ($0 + 1)}

[1,2,3]
    // point free
    .map(incr)
    .map(square)
[1,2,3].map( incr >>> square )
