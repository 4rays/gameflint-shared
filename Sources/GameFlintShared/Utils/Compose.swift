import Foundation

// MARK: - Compose
public func compose<A: Sendable>(
  _ f: @escaping @Sendable (A) -> A,
  _ g: @escaping @Sendable (A) -> A
) -> (A) -> A {
  { (a: A) -> A in
    f(g(a))
  }
}

public func compose<A: Sendable>(
  _ f: @escaping @Sendable (A) -> A,
  _ g: @escaping @Sendable (A) -> A,
  _ h: @escaping @Sendable (A) -> A
) -> (A) -> A {
  { (a: A) -> A in
    f(g(h(a)))
  }
}

public func compose<A: Sendable>(
  _ f: @escaping @Sendable (A) -> A,
  _ g: @escaping @Sendable (A) -> A,
  _ h: @escaping @Sendable (A) -> A,
  _ i: @escaping @Sendable (A) -> A
) -> (A) -> A {
  { (a: A) -> A in
    f(g(h(i(a))))
  }
}

public func compose<A: Sendable>(
  _ f: @escaping @Sendable (A) throws -> A,
  _ g: @escaping @Sendable (A) throws -> A
) -> (A) throws -> A {
  { (a: A) throws -> A in
    try f(g(a))
  }
}

public func compose<A: Sendable>(
  _ f: @escaping @Sendable (A) throws -> A,
  _ g: @escaping @Sendable (A) throws -> A,
  _ h: @escaping @Sendable (A) throws -> A
) -> (A) throws -> A {
  { (a: A) throws -> A in
    try f(g(h(a)))
  }
}

public func compose<A: Sendable>(
  _ f: @escaping @Sendable (A) throws -> A,
  _ g: @escaping @Sendable (A) throws -> A,
  _ h: @escaping @Sendable (A) throws -> A,
  _ i: @escaping @Sendable (A) throws -> A
) -> (A) throws -> A {
  { (a: A) throws -> A in
    try f(g(h(i(a))))
  }
}

// MARK: - Pipe
public func pipe<A: Sendable>(
  _ f: @escaping @Sendable (A) -> A,
  _ g: @escaping @Sendable (A) -> A
) -> (A) -> A {
  { (a: A) -> A in
    g(f(a))
  }
}

public func pipe<A: Sendable>(
  _ f: @escaping @Sendable (A) -> A,
  _ g: @escaping @Sendable (A) -> A,
  _ h: @escaping @Sendable (A) -> A
) -> (A) -> A {
  { (a: A) -> A in
    h(g(f(a)))
  }
}

public func pipe<A: Sendable>(
  _ f: @escaping @Sendable (A) -> A,
  _ g: @escaping @Sendable (A) -> A,
  _ h: @escaping @Sendable (A) -> A,
  _ i: @escaping @Sendable (A) -> A
) -> (A) -> A {
  { (a: A) -> A in
    i(h(g(f(a))))
  }
}

public func pipe<A: Sendable>(
  _ f: @escaping @Sendable (A) throws -> A,
  _ g: @escaping @Sendable (A) throws -> A
) -> (A) throws -> A {
  { (a: A) throws -> A in
    try g(f(a))
  }
}

public func pipe<A: Sendable>(
  _ f: @escaping @Sendable (A) throws -> A,
  _ g: @escaping @Sendable (A) throws -> A,
  _ h: @escaping @Sendable (A) throws -> A
) -> (A) throws -> A {
  { (a: A) throws -> A in
    try h(g(f(a)))
  }
}

public func pipe<A: Sendable>(
  _ f: @escaping @Sendable (A) throws -> A,
  _ g: @escaping @Sendable (A) throws -> A,
  _ h: @escaping @Sendable (A) throws -> A,
  _ i: @escaping @Sendable (A) throws -> A
) -> (A) throws -> A {
  { (a: A) throws -> A in
    try i(h(g(f(a))))
  }
}
