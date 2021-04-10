
/// Curries a function of two arguments.
///
/// - Parameter function: A function of two arguments.
/// - Returns: A curried function.
public func curry <A1, A2, R> (_ function: @escaping (A1, A2) -> R) -> (A1) -> (A2) -> R {
   return { (a1: A1) -> (A2) -> R in { (a2: A2) -> R in function(a1, a2) } }
}

/// Curries a throwing function of two arguments.
///
/// - Parameter function: A throwing function of two arguments.
/// - Returns: A curried, final-throwing function.
public func curry <A1, A2, R> (_ function: @escaping (A1, A2) throws -> R) -> (A1) -> (A2) throws -> R {
   return { (a1: A1) -> (A2) throws -> R in { (a2: A2) throws -> R in try function(a1, a2) } }
}

public func curry <A1, A2, A3, R> (_ function: @escaping (A1, A2, A3) -> R) -> (A1) -> (A2) -> (A3) -> R {
   return { (a1: A1) -> (A2) -> (A3) -> R in { (a2: A2) -> (A3) -> R in { (a3: A3) -> R in function(a1, a2, a3) } } }
}

public func curry <A1, A2, A3, R> (_ function: @escaping (A1, A2, A3) throws -> R) -> (A1) -> (A2) -> (A3) throws -> R {
   return { (a1: A1) -> (A2) -> (A3) throws -> R in { (a2: A2) -> (A3) throws -> R in { (a3: A3) throws -> R in try function(a1, a2, a3) } } }
}

public func curry <A1, A2, A3, A4, R> (_ function: @escaping (A1, A2, A3, A4) -> R) -> (A1) -> (A2) -> (A3) -> (A4) -> R {
   return { (a1: A1) -> (A2) -> (A3) -> (A4) -> R in { (a2: A2) -> (A3) -> (A4) -> R in { (a3: A3) -> (A4) -> R in { (a4: A4) -> R in function(a1, a2, a3, a4) } } } }
}

public func curry <A1, A2, A3, A4, R> (_ function: @escaping (A1, A2, A3, A4) throws -> R) -> (A1) -> (A2) -> (A3) -> (A4) throws -> R {
   return { (a1: A1) -> (A2) -> (A3) -> (A4) throws -> R in { (a2: A2) -> (A3) -> (A4) throws -> R in { (a3: A3) -> (A4) throws -> R in { (a4: A4) throws -> R in try function(a1, a2, a3, a4) } } } }
}

public func curry <A1, A2, A3, A4, A5, R> (_ function: @escaping (A1, A2, A3, A4, A5) -> R) -> (A1) -> (A2) -> (A3) -> (A4) -> (A5) -> R {
   return { (a1: A1) -> (A2) -> (A3) -> (A4) -> (A5) -> R in { (a2: A2) -> (A3) -> (A4) -> (A5) -> R in { (a3: A3) -> (A4) -> (A5) -> R in { (a4: A4) -> (A5) -> R in { (a5: A5) -> R in function(a1, a2, a3, a4, a5) } } } } }
}

public func curry <A1, A2, A3, A4, A5, R> (_ function: @escaping (A1, A2, A3, A4, A5) throws -> R) -> (A1) -> (A2) -> (A3) -> (A4) -> (A5) throws -> R {
   return { (a1: A1) -> (A2) -> (A3) -> (A4) -> (A5) throws -> R in { (a2: A2) -> (A3) -> (A4) -> (A5) throws -> R in { (a3: A3) -> (A4) -> (A5) throws -> R in { (a4: A4) -> (A5) throws -> R in { (a5: A5) throws -> R in try function(a1, a2, a3, a4, a5) } } } } }
}

public func curry <A1, A2, A3, A4, A5, A6, R> (_ function: @escaping (A1, A2, A3, A4, A5, A6) -> R) -> (A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> R {
   return { (a1: A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> R in { (a2: A2) -> (A3) -> (A4) -> (A5) -> (A6) -> R in { (a3: A3) -> (A4) -> (A5) -> (A6) -> R in { (a4: A4) -> (A5) -> (A6) -> R in { (a5: A5) -> (A6) -> R in { (a6: A6) -> R in function(a1, a2, a3, a4, a5, a6) } } } } } }
}

public func curry <A1, A2, A3, A4, A5, A6, R> (_ function: @escaping (A1, A2, A3, A4, A5, A6) throws -> R) -> (A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) throws -> R {
   return { (a1: A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) throws -> R in { (a2: A2) -> (A3) -> (A4) -> (A5) -> (A6) throws -> R in { (a3: A3) -> (A4) -> (A5) -> (A6) throws -> R in { (a4: A4) -> (A5) -> (A6) throws -> R in { (a5: A5) -> (A6) throws -> R in { (a6: A6) throws -> R in try function(a1, a2, a3, a4, a5, a6) } } } } } }
}

public func curry <A1, A2, A3, A4, A5, A6, A7, R> (_ function: @escaping (A1, A2, A3, A4, A5, A6, A7) -> R) -> (A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> R {
   return { (a1: A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> R in { (a2: A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> R in { (a3: A3) -> (A4) -> (A5) -> (A6) -> (A7) -> R in { (a4: A4) -> (A5) -> (A6) -> (A7) -> R in { (a5: A5) -> (A6) -> (A7) -> R in { (a6: A6) -> (A7) -> R in { (a7: A7) -> R in function(a1, a2, a3, a4, a5, a6, a7) } } } } } } }
}

public func curry <A1, A2, A3, A4, A5, A6, A7, R> (_ function: @escaping (A1, A2, A3, A4, A5, A6, A7) throws -> R) -> (A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) throws -> R {
   return { (a1: A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) throws -> R in { (a2: A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) throws -> R in { (a3: A3) -> (A4) -> (A5) -> (A6) -> (A7) throws -> R in { (a4: A4) -> (A5) -> (A6) -> (A7) throws -> R in { (a5: A5) -> (A6) -> (A7) throws -> R in { (a6: A6) -> (A7) throws -> R in { (a7: A7) throws -> R in try function(a1, a2, a3, a4, a5, a6, a7) } } } } } } }
}

public func curry <A1, A2, A3, A4, A5, A6, A7, A8, R> (_ function: @escaping (A1, A2, A3, A4, A5, A6, A7, A8) -> R) -> (A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> R {
   return { (a1: A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> R in { (a2: A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> R in { (a3: A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> R in { (a4: A4) -> (A5) -> (A6) -> (A7) -> (A8) -> R in { (a5: A5) -> (A6) -> (A7) -> (A8) -> R in { (a6: A6) -> (A7) -> (A8) -> R in { (a7: A7) -> (A8) -> R in { (a8: A8) -> R in function(a1, a2, a3, a4, a5, a6, a7, a8) } } } } } } } }
}

public func curry <A1, A2, A3, A4, A5, A6, A7, A8, R> (_ function: @escaping (A1, A2, A3, A4, A5, A6, A7, A8) throws -> R) -> (A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) throws -> R {
   return { (a1: A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) throws -> R in { (a2: A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) throws -> R in { (a3: A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) throws -> R in { (a4: A4) -> (A5) -> (A6) -> (A7) -> (A8) throws -> R in { (a5: A5) -> (A6) -> (A7) -> (A8) throws -> R in { (a6: A6) -> (A7) -> (A8) throws -> R in { (a7: A7) -> (A8) throws -> R in { (a8: A8) throws -> R in try function(a1, a2, a3, a4, a5, a6, a7, a8) } } } } } } } }
}

public func curry <A1, A2, A3, A4, A5, A6, A7, A8, A9, R> (_ function: @escaping (A1, A2, A3, A4, A5, A6, A7, A8, A9) -> R) -> (A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> R {
   return { (a1: A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> R in { (a2: A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> R in { (a3: A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> R in { (a4: A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> R in { (a5: A5) -> (A6) -> (A7) -> (A8) -> (A9) -> R in { (a6: A6) -> (A7) -> (A8) -> (A9) -> R in { (a7: A7) -> (A8) -> (A9) -> R in { (a8: A8) -> (A9) -> R in { (a9: A9) -> R in function(a1, a2, a3, a4, a5, a6, a7, a8, a9) } } } } } } } } }
}

public func curry <A1, A2, A3, A4, A5, A6, A7, A8, A9, R> (_ function: @escaping (A1, A2, A3, A4, A5, A6, A7, A8, A9) throws -> R) -> (A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) throws -> R {
   return { (a1: A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) throws -> R in { (a2: A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) throws -> R in { (a3: A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) throws -> R in { (a4: A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) throws -> R in { (a5: A5) -> (A6) -> (A7) -> (A8) -> (A9) throws -> R in { (a6: A6) -> (A7) -> (A8) -> (A9) throws -> R in { (a7: A7) -> (A8) -> (A9) throws -> R in { (a8: A8) -> (A9) throws -> R in { (a9: A9) throws -> R in try function(a1, a2, a3, a4, a5, a6, a7, a8, a9) } } } } } } } } }
}

public func curry <A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, R> (_ function: @escaping (A1, A2, A3, A4, A5, A6, A7, A8, A9, A10) -> R) -> (A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> R {
   return { (a1: A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> R in { (a2: A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> R in { (a3: A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> R in { (a4: A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> R in { (a5: A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> R in { (a6: A6) -> (A7) -> (A8) -> (A9) -> (A10) -> R in { (a7: A7) -> (A8) -> (A9) -> (A10) -> R in { (a8: A8) -> (A9) -> (A10) -> R in { (a9: A9) -> (A10) -> R in { (a10: A10) -> R in function(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10) } } } } } } } } } }
}

public func curry <A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, R> (_ function: @escaping (A1, A2, A3, A4, A5, A6, A7, A8, A9, A10) throws -> R) -> (A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) throws -> R {
   return { (a1: A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) throws -> R in { (a2: A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) throws -> R in { (a3: A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) throws -> R in { (a4: A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) throws -> R in { (a5: A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) throws -> R in { (a6: A6) -> (A7) -> (A8) -> (A9) -> (A10) throws -> R in { (a7: A7) -> (A8) -> (A9) -> (A10) throws -> R in { (a8: A8) -> (A9) -> (A10) throws -> R in { (a9: A9) -> (A10) throws -> R in { (a10: A10) throws -> R in try function(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10) } } } } } } } } } }
}

public func curry <A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, R> (_ function: @escaping (A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11) -> R) -> (A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> R {
   return { (a1: A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> R in { (a2: A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> R in { (a3: A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> R in { (a4: A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> R in { (a5: A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> R in { (a6: A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> R in { (a7: A7) -> (A8) -> (A9) -> (A10) -> (A11) -> R in { (a8: A8) -> (A9) -> (A10) -> (A11) -> R in { (a9: A9) -> (A10) -> (A11) -> R in { (a10: A10) -> (A11) -> R in { (a11: A11) -> R in function(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11) } } } } } } } } } } }
}

public func curry <A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, R> (_ function: @escaping (A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11) throws -> R) -> (A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) throws -> R {
   return { (a1: A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) throws -> R in { (a2: A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) throws -> R in { (a3: A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) throws -> R in { (a4: A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) throws -> R in { (a5: A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) throws -> R in { (a6: A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) throws -> R in { (a7: A7) -> (A8) -> (A9) -> (A10) -> (A11) throws -> R in { (a8: A8) -> (A9) -> (A10) -> (A11) throws -> R in { (a9: A9) -> (A10) -> (A11) throws -> R in { (a10: A10) -> (A11) throws -> R in { (a11: A11) throws -> R in try function(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11) } } } } } } } } } } }
}

public func curry <A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, R> (_ function: @escaping (A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12) -> R) -> (A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> R {
   return { (a1: A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> R in { (a2: A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> R in { (a3: A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> R in { (a4: A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> R in { (a5: A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> R in { (a6: A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> R in { (a7: A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> R in { (a8: A8) -> (A9) -> (A10) -> (A11) -> (A12) -> R in { (a9: A9) -> (A10) -> (A11) -> (A12) -> R in { (a10: A10) -> (A11) -> (A12) -> R in { (a11: A11) -> (A12) -> R in { (a12: A12) -> R in function(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12) } } } } } } } } } } } }
}

public func curry <A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, R> (_ function: @escaping (A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12) throws -> R) -> (A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) throws -> R {
   return { (a1: A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) throws -> R in { (a2: A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) throws -> R in { (a3: A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) throws -> R in { (a4: A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) throws -> R in { (a5: A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) throws -> R in { (a6: A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) throws -> R in { (a7: A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) throws -> R in { (a8: A8) -> (A9) -> (A10) -> (A11) -> (A12) throws -> R in { (a9: A9) -> (A10) -> (A11) -> (A12) throws -> R in { (a10: A10) -> (A11) -> (A12) throws -> R in { (a11: A11) -> (A12) throws -> R in { (a12: A12) throws -> R in try function(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12) } } } } } } } } } } } }
}

public func curry <A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, R> (_ function: @escaping (A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13) -> R) -> (A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> R {
   return { (a1: A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> R in { (a2: A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> R in { (a3: A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> R in { (a4: A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> R in { (a5: A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> R in { (a6: A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> R in { (a7: A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> R in { (a8: A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> R in { (a9: A9) -> (A10) -> (A11) -> (A12) -> (A13) -> R in { (a10: A10) -> (A11) -> (A12) -> (A13) -> R in { (a11: A11) -> (A12) -> (A13) -> R in { (a12: A12) -> (A13) -> R in { (a13: A13) -> R in function(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13) } } } } } } } } } } } } }
}

public func curry <A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, R> (_ function: @escaping (A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13) throws -> R) -> (A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) throws -> R {
   return { (a1: A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) throws -> R in { (a2: A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) throws -> R in { (a3: A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) throws -> R in { (a4: A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) throws -> R in { (a5: A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) throws -> R in { (a6: A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) throws -> R in { (a7: A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) throws -> R in { (a8: A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) throws -> R in { (a9: A9) -> (A10) -> (A11) -> (A12) -> (A13) throws -> R in { (a10: A10) -> (A11) -> (A12) -> (A13) throws -> R in { (a11: A11) -> (A12) -> (A13) throws -> R in { (a12: A12) -> (A13) throws -> R in { (a13: A13) throws -> R in try function(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13) } } } } } } } } } } } } }
}

public func curry <A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, R> (_ function: @escaping (A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14) -> R) -> (A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> R {
   return { (a1: A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> R in { (a2: A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> R in { (a3: A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> R in { (a4: A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> R in { (a5: A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> R in { (a6: A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> R in { (a7: A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> R in { (a8: A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> R in { (a9: A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> R in { (a10: A10) -> (A11) -> (A12) -> (A13) -> (A14) -> R in { (a11: A11) -> (A12) -> (A13) -> (A14) -> R in { (a12: A12) -> (A13) -> (A14) -> R in { (a13: A13) -> (A14) -> R in { (a14: A14) -> R in function(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14) } } } } } } } } } } } } } }
}

public func curry <A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, R> (_ function: @escaping (A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14) throws -> R) -> (A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) throws -> R {
   return { (a1: A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) throws -> R in { (a2: A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) throws -> R in { (a3: A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) throws -> R in { (a4: A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) throws -> R in { (a5: A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) throws -> R in { (a6: A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) throws -> R in { (a7: A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) throws -> R in { (a8: A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) throws -> R in { (a9: A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) throws -> R in { (a10: A10) -> (A11) -> (A12) -> (A13) -> (A14) throws -> R in { (a11: A11) -> (A12) -> (A13) -> (A14) throws -> R in { (a12: A12) -> (A13) -> (A14) throws -> R in { (a13: A13) -> (A14) throws -> R in { (a14: A14) throws -> R in try function(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14) } } } } } } } } } } } } } }
}

public func curry <A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, R> (_ function: @escaping (A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15) -> R) -> (A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> R {
   return { (a1: A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> R in { (a2: A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> R in { (a3: A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> R in { (a4: A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> R in { (a5: A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> R in { (a6: A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> R in { (a7: A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> R in { (a8: A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> R in { (a9: A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> R in { (a10: A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> R in { (a11: A11) -> (A12) -> (A13) -> (A14) -> (A15) -> R in { (a12: A12) -> (A13) -> (A14) -> (A15) -> R in { (a13: A13) -> (A14) -> (A15) -> R in { (a14: A14) -> (A15) -> R in { (a15: A15) -> R in function(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15) } } } } } } } } } } } } } } }
}

public func curry <A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, R> (_ function: @escaping (A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15) throws -> R) -> (A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) throws -> R {
   return { (a1: A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) throws -> R in { (a2: A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) throws -> R in { (a3: A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) throws -> R in { (a4: A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) throws -> R in { (a5: A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) throws -> R in { (a6: A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) throws -> R in { (a7: A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) throws -> R in { (a8: A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) throws -> R in { (a9: A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) throws -> R in { (a10: A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) throws -> R in { (a11: A11) -> (A12) -> (A13) -> (A14) -> (A15) throws -> R in { (a12: A12) -> (A13) -> (A14) -> (A15) throws -> R in { (a13: A13) -> (A14) -> (A15) throws -> R in { (a14: A14) -> (A15) throws -> R in { (a15: A15) throws -> R in try function(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15) } } } } } } } } } } } } } } }
}

public func curry <A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, R> (_ function: @escaping (A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16) -> R) -> (A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> R {
   return { (a1: A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> R in { (a2: A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> R in { (a3: A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> R in { (a4: A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> R in { (a5: A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> R in { (a6: A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> R in { (a7: A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> R in { (a8: A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> R in { (a9: A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> R in { (a10: A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> R in { (a11: A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> R in { (a12: A12) -> (A13) -> (A14) -> (A15) -> (A16) -> R in { (a13: A13) -> (A14) -> (A15) -> (A16) -> R in { (a14: A14) -> (A15) -> (A16) -> R in { (a15: A15) -> (A16) -> R in { (a16: A16) -> R in function(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16) } } } } } } } } } } } } } } } }
}

public func curry <A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, R> (_ function: @escaping (A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16) throws -> R) -> (A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) throws -> R {
   return { (a1: A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) throws -> R in { (a2: A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) throws -> R in { (a3: A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) throws -> R in { (a4: A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) throws -> R in { (a5: A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) throws -> R in { (a6: A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) throws -> R in { (a7: A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) throws -> R in { (a8: A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) throws -> R in { (a9: A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) throws -> R in { (a10: A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) throws -> R in { (a11: A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) throws -> R in { (a12: A12) -> (A13) -> (A14) -> (A15) -> (A16) throws -> R in { (a13: A13) -> (A14) -> (A15) -> (A16) throws -> R in { (a14: A14) -> (A15) -> (A16) throws -> R in { (a15: A15) -> (A16) throws -> R in { (a16: A16) throws -> R in try function(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16) } } } } } } } } } } } } } } } }
}

public func curry <A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, R> (_ function: @escaping (A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17) -> R) -> (A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) -> R {
   return { (a1: A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) -> R in { (a2: A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) -> R in { (a3: A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) -> R in { (a4: A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) -> R in { (a5: A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) -> R in { (a6: A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) -> R in { (a7: A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) -> R in { (a8: A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) -> R in { (a9: A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) -> R in { (a10: A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) -> R in { (a11: A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) -> R in { (a12: A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) -> R in { (a13: A13) -> (A14) -> (A15) -> (A16) -> (A17) -> R in { (a14: A14) -> (A15) -> (A16) -> (A17) -> R in { (a15: A15) -> (A16) -> (A17) -> R in { (a16: A16) -> (A17) -> R in { (a17: A17) -> R in function(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17) } } } } } } } } } } } } } } } } }
}

public func curry <A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, R> (_ function: @escaping (A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17) throws -> R) -> (A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) throws -> R {
   return { (a1: A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) throws -> R in { (a2: A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) throws -> R in { (a3: A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) throws -> R in { (a4: A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) throws -> R in { (a5: A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) throws -> R in { (a6: A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) throws -> R in { (a7: A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) throws -> R in { (a8: A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) throws -> R in { (a9: A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) throws -> R in { (a10: A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) throws -> R in { (a11: A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) throws -> R in { (a12: A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) throws -> R in { (a13: A13) -> (A14) -> (A15) -> (A16) -> (A17) throws -> R in { (a14: A14) -> (A15) -> (A16) -> (A17) throws -> R in { (a15: A15) -> (A16) -> (A17) throws -> R in { (a16: A16) -> (A17) throws -> R in { (a17: A17) throws -> R in try function(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17) } } } } } } } } } } } } } } } } }
}

public func curry <A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, R> (_ function: @escaping (A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18) -> R) -> (A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) -> (A18) -> R {
   return { (a1: A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) -> (A18) -> R in { (a2: A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) -> (A18) -> R in { (a3: A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) -> (A18) -> R in { (a4: A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) -> (A18) -> R in { (a5: A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) -> (A18) -> R in { (a6: A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) -> (A18) -> R in { (a7: A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) -> (A18) -> R in { (a8: A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) -> (A18) -> R in { (a9: A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) -> (A18) -> R in { (a10: A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) -> (A18) -> R in { (a11: A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) -> (A18) -> R in { (a12: A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) -> (A18) -> R in { (a13: A13) -> (A14) -> (A15) -> (A16) -> (A17) -> (A18) -> R in { (a14: A14) -> (A15) -> (A16) -> (A17) -> (A18) -> R in { (a15: A15) -> (A16) -> (A17) -> (A18) -> R in { (a16: A16) -> (A17) -> (A18) -> R in { (a17: A17) -> (A18) -> R in { (a18: A18) -> R in function(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18) } } } } } } } } } } } } } } } } } }
}

public func curry <A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, R> (_ function: @escaping (A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18) throws -> R) -> (A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) -> (A18) throws -> R {
   return { (a1: A1) -> (A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) -> (A18) throws -> R in { (a2: A2) -> (A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) -> (A18) throws -> R in { (a3: A3) -> (A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) -> (A18) throws -> R in { (a4: A4) -> (A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) -> (A18) throws -> R in { (a5: A5) -> (A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) -> (A18) throws -> R in { (a6: A6) -> (A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) -> (A18) throws -> R in { (a7: A7) -> (A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) -> (A18) throws -> R in { (a8: A8) -> (A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) -> (A18) throws -> R in { (a9: A9) -> (A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) -> (A18) throws -> R in { (a10: A10) -> (A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) -> (A18) throws -> R in { (a11: A11) -> (A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) -> (A18) throws -> R in { (a12: A12) -> (A13) -> (A14) -> (A15) -> (A16) -> (A17) -> (A18) throws -> R in { (a13: A13) -> (A14) -> (A15) -> (A16) -> (A17) -> (A18) throws -> R in { (a14: A14) -> (A15) -> (A16) -> (A17) -> (A18) throws -> R in { (a15: A15) -> (A16) -> (A17) -> (A18) throws -> R in { (a16: A16) -> (A17) -> (A18) throws -> R in { (a17: A17) -> (A18) throws -> R in { (a18: A18) throws -> R in try function(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18) } } } } } } } } } } } } } } } } } }
}