
// |>
func with<A, B>(_ x: A, _ f: @escaping (A) -> B) -> B {
    return f(x)
}

with(2, incr)
//with(2, incr, square)
with(with(2, incr), square)

2 |> incr |> square
2 |> incr >>> square
with(2, incr >>> square)

// >>>
func pipe<A, B, C>(_ f: @escaping (A) -> B, _ g: @escaping (B) -> C) -> (A) -> C {
    return { g(f($0)) }
}

with(2, pipe(incr, square))

incr >>> square >>> String.init

func pipe<A, B, C, D>(
  _ f: @escaping (A) -> B,
  _ g: @escaping (B) -> C,
  _ h: @escaping (C) -> D
  ) -> (A) -> D {
  return { h(g(f($0))) }
}

with(2, pipe(incr, square, String.init))

func computeAndPrint(_ x: Int) -> (Int, [String]) {
  let computation = x * x + 1
  return (computation, ["Computed \(computation)"])
}

2 |> computeAndPrint
2 |> computeAndPrint >=> computeAndPrint

// >=>
func chain<A, B, C>(_ f: @escaping (A) -> (B, [String]), _ g: @escaping (B) -> (C, [String]) ) -> (A) -> (C, [String]) {
    return { a in
        let (b, logs) = f(a)
        let (c, moreLogs) = g(b)
        return (c, logs + moreLogs)
    }
}

with(2, chain(computeAndPrint, computeAndPrint))

with(2, chain(computeAndPrint, chain(computeAndPrint, computeAndPrint)))

2
  |> computeAndPrint
  >=> incr
  >>> computeAndPrint
  >=> square
  >>> computeAndPrint

with(
  2,
  chain(
    computeAndPrint,
    pipe(
      incr,
      chain(
        computeAndPrint,
        pipe(
          square,
          computeAndPrint
        )
      )
    )
  )
)

func chain<A, B, C, D>(
  _ f: @escaping (A) -> (B, [String]),
  _ g: @escaping (B) -> (C, [String]),
  _ h: @escaping (C) -> (D, [String])
  ) -> ((A) -> (D, [String])) {

  return { a in
    let (b, logs) = f(a)
    let (c, moreLogs) = g(b)
    let (d, evenMoreLogs) = h(c)
    return (d, logs + moreLogs + evenMoreLogs)
  }
}

with(
  2,
  chain(
    computeAndPrint,
    pipe(incr, computeAndPrint),
    pipe(square, computeAndPrint)
  )
)

func roundedStyle(_ view: UIView) {
  view.clipsToBounds = true
  view.layer.cornerRadius = 6
}

let baseButtonStyle: (UIButton) -> Void = {
  $0.contentEdgeInsets = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
  $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
}

// <>
func concat<A: AnyObject>(
    _ f: @escaping (A) -> Void,
    _ g: @escaping (A) -> Void,
    _ fs: ((A) -> Void)...
) -> (A) -> Void {
    return { a in
        f(a)
        g(a)
        fs.forEach { (f) in
            f(a)
        }
    }
}

let filledButtonStyle = concat(
  baseButtonStyle,
  roundedStyle, {
    $0.backgroundColor = .black
    $0.tintColor = .white
})
