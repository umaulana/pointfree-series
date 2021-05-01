
1 + (2 + 3)
(1 + 2) + 3

enum Expr: Equatable {
    case int(Int)
    indirect case add(Expr, Expr)
    indirect case mul(Expr, Expr)
    case `var`
}

extension Expr: ExpressibleByIntegerLiteral {
    init(integerLiteral value: IntegerLiteralType) {
        self = .int(value)
    }
    
}

Expr.int(1)
Expr.add(2, 3)
Expr.add(1, .add(2, 3))

func eval(_ expr: Expr, with value: Int = 0) -> Int {
    switch expr {
    case let .int(value):
        return value
    case let .add(lhs, rhs):
        return eval(lhs, with: value) + eval(rhs, with: value)
    case let .mul(lhs, rhs):
        return eval(lhs, with: value) * eval(rhs, with: value)
    case .var:
        return value
    }
}

eval(Expr.add(1, .add(2, 3)))
eval(Expr.mul(1, .add(2, 3)))
eval(Expr.mul(.var, .add(2, 3)), with: 1)

func print(_ expr: Expr) -> String {
    switch expr {
    case let .int(value):
        return "\(value)"
    case let .add(lhs, rhs):
        return "(\(print(lhs)) + \(print(rhs)))"
    case let .mul(lhs, rhs):
        return "(\(print(lhs)) * \(print(rhs)))"
    case .var:
        return "x"
    }
}

print(Expr.add(1, .add(2, 3)))
print(Expr.mul(1, .add(2, 3)))
print(Expr.mul(1, .add(.var, 3)))

func swap(_ expr: Expr) -> Expr {
    switch expr {
    case .int:
        return expr
    case let .add(lhs, rhs):
        return .mul(swap(lhs), swap(rhs))
    case let .mul(lhs, rhs):
        return .add(swap(lhs), swap(rhs))
    case .var:
        return expr
    }
}

print(swap(Expr.mul(1, .add(2, 3))))
print(swap(Expr.mul(1, .add(2, .var))))

func simplify(_ expr: Expr) -> Expr {
    switch expr {
    case .int:
        return expr
    case let .add(.mul(a, b), .mul(c, d)) where a == c:
        return .mul(a, .add(b, d))
    case let .add(.mul(a, b), .mul(c, d)) where b == d:
        return .mul(b, .add(a, c))
    case .add:
        return expr
    case .mul(_, _):
        return expr
    case .var:
        return expr
    }
}

print(simplify(Expr.add(.mul(2, 3), .mul(2, 4))))
print(simplify(Expr.add(.mul(2, 3), .mul(4, 3))))
print(simplify(Expr.add(.mul(2, .var), .mul(4, .var))))
