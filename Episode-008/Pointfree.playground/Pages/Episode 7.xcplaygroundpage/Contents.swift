import Foundation
struct Food {
    var name: String
}

struct Location {
    var name: String
}

struct User {
    var favoriteFoods: [Food]
    var location: Location
    var name: String
}

let user = User(
    favoriteFoods: [Food(name: "Tacos"), Food(name: "Nachos")],
    location: Location(name: "Brooklyn"),
    name: "Blob"
)

User(
    favoriteFoods: user.favoriteFoods,
    location: Location(name: "Los Angeles"),
    name: user.name
)

func userLocationName(_ f: @escaping (String) -> String) -> (User) -> User {
    return { user in
        User(
            favoriteFoods: user.favoriteFoods,
            location: Location(name: f(user.location.name)),
            name: user.name
        )
    }
}

user
    |> userLocationName { _ in "Los Angeles" }

userLocationName({ $0 + "!"})(user)

\User.name
user.name
user[keyPath: \User.name]

func prop<Root, Value>(_ kp: WritableKeyPath<Root, Value>)
-> (@escaping (Value) -> Value)
-> (Root)
-> Root {
    return { update in
        { root in
            var copy = root
            copy[keyPath: kp] = update(copy[keyPath: kp])
            return copy
        }
    }
}

(prop(\User.name)) ( { $0.uppercased() }) (user)

prop(\User.location) // ((Location) -> Location) -> (User) -> User
<<<
prop(\Location.name) // ((String) -> String) -> (Location) -> Location

user
  |> (prop(\.name)) { $0.uppercased() }
  |> (prop(\.location.name)) { _ in "Los Angeles" }

(42, user)
  |> (second <<< prop(\.name)) { $0.uppercased() }
  |> first(incr)

print(user)

user.favoriteFoods
  .map { Food(name: $0.name + " & Salad") }

let healthier = (prop(\User.favoriteFoods) <<< map <<< prop(\.name)) {
  $0 + " & Salad"
}

second(healthier)
  <> second(healthier)
  <> (second <<< prop(\.location.name)) { _ in "Miami" }
  <> (second <<< prop(\.name)) { "Healthy " + $0 }
  <> first(incr)

second(
  healthier
    <> healthier
    <> (prop(\.location.name)) { _ in "Miami" }
    <> (prop(\.name)) { "Healthy " + $0 }
  )
  <> first(incr)


public func map<A, B>(_ f: @escaping (A) -> B) -> (A?) -> B? {
  return { $0.map(f) }
}
