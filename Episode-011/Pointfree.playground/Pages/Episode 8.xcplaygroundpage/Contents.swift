struct User {
  let id: Int
  let email: String
}

let user = User(id: 1, email: "blob@pointfree.co")

user.id
user.email

let f = { (user: User) in user.id } >>> String.init
user[keyPath: \User.id]
user.id

func get<Root, Value>(_ kp: KeyPath<Root, Value>) -> (Root) -> Value {
  return { root in
    root[keyPath: kp]
  }
}

get(\User.id) >>> String.init

extension User {
  var isStaff: Bool {
    return self.email.hasSuffix("@pointfree.co")
  }
}

let users = [
  User(id: 1, email: "blob@pointfree.co"),
  User(id: 2, email: "protocol.me.maybe@appleco.example"),
  User(id: 3, email: "bee@co.domain"),
  User(id: 4, email: "a.morphism@category.theory")
]

users
  .map { $0.email }

//users
//  .map(\User.email)

extension Sequence {
  func map<Value>(_ kp: KeyPath<Element, Value>) -> [Value] {
    return self.map { $0[keyPath: kp] }
  }
}

users
  .map(\.email)

users
  .filter(get(\.isStaff))

users
  .map(get(\.email))
  .map(get(\.count))

users
  .map(get(\.email) >>> get(\.count))


users
  .map(get(\.email.count))

users
  .filter(get(\.isStaff) >>> (!))


users
  .filter((!) <<< \.isStaff)

users
  .sorted(by: { $0.email.count < $1.email.count })
//users.sort(by: <#T##(User, User) throws -> Bool#>)

func their<Root, Value>(_ f: @escaping (Root) -> Value, _ g: @escaping (Value, Value) -> Bool) -> (Root, Root) -> Bool {
    return { a, b in
        g(f(a), f(b))
    }
}

users.sorted(by: their(get(\.email), <))

struct Episode {
  let title: String
  let viewCount: Int
}

let episodes = [
  Episode(title: "Functions", viewCount: 961),
  Episode(title: "Side Effects", viewCount: 841),
  Episode(title: "UIKit Styling with Functions", viewCount: 1089),
  Episode(title: "Algebraic Data Types", viewCount: 729),
]

episodes.reduce(0, { $0 + $1.viewCount})
//episodes.reduce(<#T##initialResult: Result##Result#>, <#T##nextPartialResult: (Result, Episode) throws -> Result##(Result, Episode) throws -> Result#>)
func combining<Root, Value>(_ f: @escaping (Root) -> Value, by g: @escaping (Value, Value) -> Value) -> (Value, Root) -> Value {
    return { value, root in
        g(value, f(root))
    }
}

episodes.reduce(0, combining(get(\Episode.viewCount), by: +))
episodes.reduce(0, combining(\Episode.viewCount, by: +))

prefix operator ^
prefix func ^ <Root, Value>(_ kp: KeyPath<Root, Value>) -> (Root) -> Value {
  return get(kp)
}

^\User.id
users.map(^\.id)
