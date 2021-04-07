
enum Node {
  indirect case el(String, [(String, String)], [Node])
  case text(String)
}

extension Node: ExpressibleByStringLiteral {
  init(stringLiteral value: String) {
    self = .text(value)
  }
}
func header(_ children: [Node]) -> Node {
  return .el("header", [], children)
}
func h1(_ children: [Node]) -> Node {
  return .el("h1", [], children)
}
func ul(_ children: [Node]) -> Node {
  return .el("ul", [], children)
}
func li(_ children: [Node]) -> Node {
  return .el("li", [], children)
}
func p(_ attrs: [(String, String)], _ children: [Node]) -> Node {
  return .el("p", attrs, children)
}
func a(_ attrs: [(String, String)], _ children: [Node]) -> Node {
  return .el("a", attrs, children)
}
func img(_ attrs: [(String, String)]) -> Node {
  return .el("img", attrs, [])
}

func id(_ value: String) -> (String, String) {
  return ("id", value)
}
func href(_ value: String) -> (String, String) {
  return ("href", value)
}
func src(_ value: String) -> (String, String) {
  return ("src", value)
}
func width(_ value: Int) -> (String, String) {
  return ("width", "\(value)")
}
func height(_ value: Int) -> (String, String) {
  return ("height", "\(value)")
}

func render(_ node: Node) -> String {
  switch node {
  case let .el(tag, attrs, children):
    let formattedAttrs = attrs
      .map { key, value in "\(key)=\"\(value)\"" }
      .joined(separator: " ")
    let formattedChildren = children.map(render).joined()
    return "<\(tag) \(formattedAttrs)>\(formattedChildren)</\(tag)>"
  case let .text(string):
    return string
  }
}


func greet(name: String) -> Node {
  return header([
    h1([.text(name.uppercased())])
    ])
}

print(render(greet(name: "Blob")))

struct User {
  let name: String
  let isAdmin: Bool
}

func adminDetail(user: User) -> [Node] {
  guard user.isAdmin else { return [] }
  return [
    header([
      h1([.text("Welcome admin: \(user.name)")])
      ])
  ]
}

func render(_ nodes: [Node]) -> String {
  return nodes.map(render).joined()
}

print(render(adminDetail(user: User(name: "Blob Jr.", isAdmin: false))))

print(render(adminDetail(user: User(name: "Blob Sr.", isAdmin: true))))

func users(_ names: [String]) -> Node {
  return ul(names.map(userItem))
}

func userItem(_ name: String) -> Node {
  return li([.text(name)])
}

print(render(users(["Blob", "Blob Jr."])))

func redacted(_ node: Node) -> Node {
  switch node {
  case let .el("img", attrs, children):
    return .el(
      "img",
      attrs.filter { attrName, _ in attrName != "src" }
        + [("style", "background: black")],
      children
    )
  case let .el(tag, attrs, children):
    return .el(tag, attrs, children.map(redacted))
  case let .text(string):
    return .text(
      string
        .split(separator: " ")
        .map { String.init(repeating: "█", count: $0.count )}
        .joined(separator: " ")
    )
  }
}


import WebKit
import PlaygroundSupport

let doc = header([
  h1(["Point-Free"]),
  p([id("blurb")], [
    "Functional programming in Swift. ",
    a([href("/about")], ["Learn more"]),
    "!"
    ]),
  img([src("https://pbs.twimg.com/profile_images/907799692339269634/wQEf0_2N_400x400.jpg"), width(64), height(64)])
  ])

let webView = WKWebView(frame: .init(x: 0, y: 0, width: 360, height: 480))
webView.loadHTMLString(render(redacted(doc)), baseURL: nil)
PlaygroundPage.current.liveView = webView


print(render(redacted(doc)))
