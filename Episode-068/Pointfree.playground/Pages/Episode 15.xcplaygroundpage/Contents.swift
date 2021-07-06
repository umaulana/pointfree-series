

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

var user = User(
  favoriteFoods: [Food(name: "Tacos"), Food(name: "Nachos")],
  location: Location(name: "Brooklyn"),
  name: "Blob"
)

func prop<Root, Value>(_ kp: WritableKeyPath<Root, Value>)
  -> (@escaping (Value) -> Value)
  -> (Root) -> Root {

    return { update in
      { root in
        var copy = root
        copy[keyPath: kp] = update(copy[keyPath: kp])
        return copy
      }
    }
}


user
  |> prop(\.name)({ $0.uppercased() })
  <> prop(\.location.name)({ _ in "Los Angeles" })

func prop<Root, Value>(
  _ kp: WritableKeyPath<Root, Value>,
  _ f: @escaping (Value) -> Value
  )
  -> (Root) -> Root {

    return prop(kp)(f)
}
func prop<Root, Value>(
  _ kp: WritableKeyPath<Root, Value>,
  _ value: Value
  )
  -> (Root) -> Root {

    return prop(kp, { _ in value })
}

let addCourtesyTitle = { $0 + ", Esq." }
let healthierOption = { $0 + " & Salad" }

user
  |> prop(\.name, addCourtesyTitle)
  <> prop(\.name) { $0.uppercased() }
//  <> prop(\.location.name) { _ in "Los Angeles" }
  <> prop(\.location.name, "Los Angeles")
//  <> (prop(\.favoriteFoods) <<< map <<< prop(\.name)) { $0 + " & Salad" }
  <> (prop(\.favoriteFoods) <<< map <<< prop(\.name))(healthierOption)

typealias Setter<S, T, A, B> = (@escaping (A) -> B) -> (S) -> T

// ((A) -> B) -> ([A]) -> [B]
// ((A) -> B) -> (A?) -> B?
// ((A) -> B) -> (A, C) -> (B, C)

func over<S, T, A, B>(
  _ setter: Setter<S, T, A, B>,
  _ f: @escaping (A) -> B
  ) -> (S) -> T {

  return setter(f)
}

func set<S, T, A, B>(
  _ setter: Setter<S, T, A, B>,
  _ value: B
  ) -> (S) -> T {

  return over(setter, { _ in value })
}

user
  |> over(prop(\.name), addCourtesyTitle)
  <> over(prop(\.name)) { $0.uppercased() }
  //  <> prop(\.location.name) { _ in "Los Angeles" }
  <> set(prop(\.location.name), "Los Angeles")
  //  <> (prop(\.favoriteFoods) <<< map <<< prop(\.name)) { $0 + " & Salad" }
  <> over(prop(\.favoriteFoods) <<< map <<< prop(\.name), healthierOption)

prefix func ^ <Root, Value>(_ kp: WritableKeyPath<Root, Value>)
  -> (@escaping (Value) -> Value)
  -> (Root) -> Root {

    return prop(kp)
}

user
  |> over(^\.name, addCourtesyTitle)
  <> over(^\.name) { $0.uppercased() }
  <> set(^\.location.name, "Los Angeles")
  <> over(^\.favoriteFoods <<< map <<< ^\.name, healthierOption)

("Hello, world", 42)
  |> set(first, [1, 2, 3])
  |> over(second, String.init)

typealias MutableSettter<S, A> = (@escaping (inout A) -> Void) -> (inout S) -> Void

func mver<S, A> (
    _ setter: MutableSettter<S, A>,
    _ f: @escaping (inout A) -> Void
) -> (inout S) -> Void {
    return setter(f)
}

func mut<S, A> (
    _ setter: MutableSettter<S, A>,
    _ value: A
) -> (inout S) -> Void {
    return mver(setter, { $0 = value })
}

prefix func ^ <Root, Value>(
  _ kp: WritableKeyPath<Root, Value>
  )
  -> (@escaping (inout Value) -> Void)
  -> (inout Root) -> Void {

    return { update in
      return { root in
        update(&root[keyPath: kp])
      }
    }
}



func mutEach<A>(_ f: @escaping (inout A) -> Void) -> (inout [A]) -> Void {
  return {
    for i in $0.indices {
      f(&$0[i])
    }
  }
}


user
    |> mver(^\.name) { $0 = $0.uppercased() }
//    <> mut(^\.location.name, "Los Angeles")
print(user)
// <> mver(^\.favoriteFoods <<< mutEach <<< ^\.name) { $0 += " & Salad" }
