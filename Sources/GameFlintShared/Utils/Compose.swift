import Foundation

// MARK: - Compose
public func compose<A>(
  _ f: @escaping (A) -> A,
  _ g: @escaping (A) -> A
) -> (A) -> A {
  { (a: A) -> A in
    f(g(a))
  }
}

public func compose<A>(
  _ f: @escaping (A) -> A,
  _ g: @escaping (A) -> A,
  _ h: @escaping (A) -> A
) -> (A) -> A {
  { (a: A) -> A in
    f(g(h(a)))
  }
}

public func compose<A>(
  _ f: @escaping (A) -> A,
  _ g: @escaping (A) -> A,
  _ h: @escaping (A) -> A,
  _ i: @escaping (A) -> A
) -> (A) -> A {
  { (a: A) -> A in
    f(g(h(i(a))))
  }
}

public func compose<A>(
  _ f: @escaping (A) throws -> A,
  _ g: @escaping (A) throws -> A
) -> (A) throws -> A {
  { (a: A) throws -> A in
    try f(g(a))
  }
}

public func compose<A>(
  _ f: @escaping (A) throws -> A,
  _ g: @escaping (A) throws -> A,
  _ h: @escaping (A) throws -> A
) -> (A) throws -> A {
  { (a: A) throws -> A in
    try f(g(h(a)))
  }
}

public func compose<A>(
  _ f: @escaping (A) throws -> A,
  _ g: @escaping (A) throws -> A,
  _ h: @escaping (A) throws -> A,
  _ i: @escaping (A) throws -> A
) -> (A) throws -> A {
  { (a: A) throws -> A in
    try f(g(h(i(a))))
  }
}

// MARK: - Pipe
public func pipe<A>(
  _ f: @escaping (A) -> A,
  _ g: @escaping (A) -> A
) -> (A) -> A {
  { (a: A) -> A in
    g(f(a))
  }
}

public func pipe<A>(
  _ f: @escaping (A) -> A,
  _ g: @escaping (A) -> A,
  _ h: @escaping (A) -> A
) -> (A) -> A {
  { (a: A) -> A in
    h(g(f(a)))
  }
}

public func pipe<A>(
  _ f: @escaping (A) -> A,
  _ g: @escaping (A) -> A,
  _ h: @escaping (A) -> A,
  _ i: @escaping (A) -> A
) -> (A) -> A {
  { (a: A) -> A in
    i(h(g(f(a))))
  }
}

public func pipe<A>(
  _ f: @escaping (A) throws -> A,
  _ g: @escaping (A) throws -> A
) -> (A) throws -> A {
  { (a: A) throws -> A in
    try g(f(a))
  }
}

public func pipe<A>(
  _ f: @escaping (A) throws -> A,
  _ g: @escaping (A) throws -> A,
  _ h: @escaping (A) throws -> A
) -> (A) throws -> A {
  { (a: A) throws -> A in
    try h(g(f(a)))
  }
}

public func pipe<A>(
  _ f: @escaping (A) throws -> A,
  _ g: @escaping (A) throws -> A,
  _ h: @escaping (A) throws -> A,
  _ i: @escaping (A) throws -> A
) -> (A) throws -> A {
  { (a: A) throws -> A in
    try i(h(g(f(a))))
  }
}
