import Foundation

let usersJson = """
[
{
"id": 1,
"name": "Brandon",
"email": "brandon@pointfree.co",
"subscriptionId": 1
},
{
"id": 2,
"name": "Stephen",
"email": "stephen@pointfree.co",
"subscriptionId": null
},
{
"id": 3,
"name": "Blob",
"email": "blob@pointfree.co",
"subscriptionId": 1
}
]
"""

//struct Email: Decodable, RawRepresentable {
//    let rawValue: String
////    init?(rawValue: String) {
////        self.email = rawValue
////    }
////
////    var rawValue: String {
////        return self.email
////    }
////
////    typealias RawValue = String
////
////    let email: String
//
////    init(from decoder: Decoder) throws {
////        let container = try decoder.singleValueContainer()
////        self.email = try container.decode(String.self)
////    }
//}

enum EmailTag {}
typealias Email = Tagged<EmailTag, String>

struct User: Decodable {
    typealias Id = Tagged<User, Int>
    
    let id: Id
    let name: String
    //  let email: String
    let email: Email
    let subscriptionId: Subscription.Id?
}

let decoder = JSONDecoder()
let users = try! decoder.decode([User].self, from: Data(usersJson.utf8))
let user = users[0]

let subscriptionsJson = """
[
{
"id": 1,
"ownerId": 1
}
]
"""

struct Tagged<Tag, RawValue> {
    let rawValue: RawValue
}

extension Tagged: Decodable where RawValue: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.init(rawValue: try container.decode(RawValue.self))
    }
}

extension Tagged: Equatable where RawValue: Equatable {
    //    static func == (lhs: Tagged<Tag, RawValue>, rhs: Tagged<Tag, RawValue>) -> Bool {
    //      return lhs.rawValue == rhs.rawValue
    //    }
}

extension Tagged: ExpressibleByIntegerLiteral where RawValue: ExpressibleByIntegerLiteral {
    init(integerLiteral value: RawValue.IntegerLiteralType) {
        rawValue = RawValue(integerLiteral: value)
    }
    
    typealias IntegerLiteralType = RawValue.IntegerLiteralType
    
}

extension Tagged: ExpressibleByUnicodeScalarLiteral where RawValue: ExpressibleByUnicodeScalarLiteral {
    init(unicodeScalarLiteral value: RawValue.UnicodeScalarLiteralType) {
        self.rawValue = RawValue(unicodeScalarLiteral: value)
    }
    
    typealias UnicodeScalarLiteralType = RawValue.UnicodeScalarLiteralType
    
}

extension Tagged: ExpressibleByExtendedGraphemeClusterLiteral where RawValue: ExpressibleByExtendedGraphemeClusterLiteral {
    init(extendedGraphemeClusterLiteral value: RawValue.ExtendedGraphemeClusterLiteralType) {
        self.rawValue = RawValue(extendedGraphemeClusterLiteral: value)
    }
    
    typealias ExtendedGraphemeClusterLiteralType = RawValue.ExtendedGraphemeClusterLiteralType
}

extension Tagged: ExpressibleByStringLiteral where RawValue: ExpressibleByStringLiteral {
    init(stringLiteral value: RawValue.StringLiteralType) {
        self.rawValue = RawValue(stringLiteral: value)
    }
    
    typealias StringLiteralType = RawValue.StringLiteralType
    
    
}

struct Subscription: Decodable {
    //    struct Id: Decodable, RawRepresentable, Equatable {
    //        let rawValue: Int
    //    }
    typealias Id = Tagged<Subscription, Int>
    let id: Id
    let ownerId: User.Id
}

let subscriptions = try! decoder.decode([Subscription].self, from: Data(subscriptionsJson.utf8))

subscriptions
    .first { $0.id == user.subscriptionId }

let asdf = User(id: .init(rawValue: 1),
                name: "name",
                email: .init(rawValue: "email"),
                subscriptionId: .init(rawValue: 10))

let asdf2 = User(id: 1,
                name: "name",
                email: "email",
                subscriptionId: 10)
