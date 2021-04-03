
// NSObject > UIResponder > UIView > UIControl > UIButton

func wrapView(padding: UIEdgeInsets) -> (UIView) -> UIView {
  return { subview in
    let wrapper = UIView()
    subview.translatesAutoresizingMaskIntoConstraints = false
    wrapper.addSubview(subview)
    NSLayoutConstraint.activate([
      subview.leadingAnchor.constraint(
        equalTo: wrapper.leadingAnchor, constant: padding.left
      ),
      subview.rightAnchor.constraint(
        equalTo: wrapper.rightAnchor, constant: -padding.right
      ),
      subview.topAnchor.constraint(
        equalTo: wrapper.topAnchor, constant: padding.top
      ),
      subview.bottomAnchor.constraint(
        equalTo: wrapper.bottomAnchor, constant: -padding.bottom
      ),
      ])
    return wrapper
  }
}

let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
view.backgroundColor = .darkGray

let padding = UIEdgeInsets(top: 10, left: 20, bottom: 30, right: 40)

let wrapper = wrapView(padding: padding)(view)
wrapper.frame.size = CGSize(width: 300, height: 300)
wrapper.backgroundColor = .lightGray
wrapper

wrapView(padding: padding) as (UIView) -> UIView
wrapView(padding: padding) as (UIButton) -> UIView
wrapView(padding: padding) as (UISwitch) -> UIView
wrapView(padding: padding) as (UIStackView) -> UIView

//wrapView(padding: padding) as (UIResponder) -> UIView

//wrapView(padding: padding) as (UIView) -> UIButton
wrapView(padding: padding) as (UIView) -> UIResponder
wrapView(padding: padding) as (UIView) -> NSObject
wrapView(padding: padding) as (UIView) -> AnyObject

/*

 If A < B

 then (B -> C) < (A -> C)

 then (C -> A) < (C -> B)

 -------------------------

 If A < B

 then B -> C
        <              contravariant
      A -> C

 then      C -> A
             <         covariant
           C -> B
 */

func map<A, B>(_ f: (A) -> B) -> ([A]) -> [B] {
  fatalError("Unimplemented")
}


struct Func<A, B> {
  let apply: (A) -> B
}


func map<A, B, C>(_ f: @escaping (B) -> C)
  -> ((Func<A, B>) -> Func<A, C>) {
  return { g in
    Func(apply: g.apply >>> f)
  }
}


Func<Int, String>(apply: { String($0) }) |> map { a in Int(a) }


//func map<A, B, C>(_ f: @escaping (A) -> B)
//  -> ((Func<A, C>) -> Func<B, C>) {
//    return { g in
//      f // (A) -> B
//      g.apply // (A) -> C
//    }
//}

func contramap<A, B, C>(_ f: @escaping (B) -> A)
  -> ((Func<A, C>) -> Func<B, C>) {
    return { g in
//      f // (B) -> A
//      g.apply // (A) -> C
//      Func(apply: f >>> g.apply)
      Func(apply: g.apply <<< f)
    }
}

Func<Int, String>(apply: { String($0) }) |> map { a in Int(a) }

struct PredicateSet<A> {
  let contains: (A) -> Bool

  func contramap<B>(_ f: @escaping (B) -> A) -> PredicateSet<B> {
    return PredicateSet<B>(contains: f >>> self.contains)
  }
}

let ys = PredicateSet { [1, 2, 3, 4].contains($0) }

let evens = PredicateSet { $0 % 2 == 0 }
let odds = evens.contramap { $0 + 1 }
evens.contains(1)
odds.contains(1)
