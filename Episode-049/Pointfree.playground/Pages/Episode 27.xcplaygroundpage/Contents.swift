
enum Expr: Equatable {
    case int(Int)
    indirect case add(Expr, Expr)
    indirect case mul(Expr, Expr)
    case `var`(String)
    indirect case bind(String, to: Expr, in: Expr)
}

extension Expr: ExpressibleByIntegerLiteral {
    init(integerLiteral value: IntegerLiteralType) {
        self = .int(value)
    }
    
}

extension Expr: ExpressibleByStringLiteral {
    init(stringLiteral value: StringLiteralType) {
        self = .var(value)
    }
}

func eval(_ expr: Expr, with env: [String: Int]) -> Int {
    switch expr {
    case let .int(value):
        return value
    case let .add(lhs, rhs):
        return eval(lhs, with: env) + eval(rhs, with: env)
    case let .mul(lhs, rhs):
        return eval(lhs, with: env) * eval(rhs, with: env)
    case let .var(id):
        guard let value = env[id] else { fatalError("Couldn't find \(id) in \(env)") }
        return value
    case let .bind(id, boundExpr, scopedExpr):
        let boundValue = eval(boundExpr, with: env)
        let newEnv = env.merging([id: boundValue], uniquingKeysWith: { $1 })
        return eval(scopedExpr, with: newEnv)
    }
}

func print(_ expr: Expr) -> String {
    switch expr {
    case let .int(value):
        return "\(value)"
    case let .add(lhs, rhs):
        return "(\(print(lhs)) + \(print(rhs)))"
    case let .mul(lhs, rhs):
        return "(\(print(lhs)) * \(print(rhs)))"
    case let .var(id):
        return id
    case let .bind(id, boundExpr, scopedExpr):
      return "(let \(id) = \(print(boundExpr)) in \(print(scopedExpr)))"
    }
}

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
    case .bind:
        return expr
    }
}

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
    case .bind:
        return expr
    }
}

let expr = Expr.add(.mul("x", "y"), .mul("x", 6))

eval(expr, with: ["x": 2, "y": 3])
print(expr)
print(simplify(expr))

let expr1 = Expr.mul(3, .bind("z", to: .add("x", 2), in: .mul("z", "z")))

print(expr1)
eval(expr1, with: ["x": 2])
