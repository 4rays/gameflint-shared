import Foundation

public struct URLPath {
  public var fragments: [String]
}

extension URLPath {
  public init(_ fragments: [String] = []) {
    self.fragments = fragments
  }

  public var fullPath: String {
    fragments.joined(separator: "/")
  }

  public static func root(_ string: String) -> Self {
    .init([string])
  }

  public func parameter(_ value: String) -> Self {
    self / .segment(value)
  }

  public func parameter(_ value: CustomStringConvertible) -> Self {
    parameter(value.description)
  }
}

// MARK: - Custom Operator
public func /(
  lhs: String,
  rhs: String
) -> URLPath {
  .init([lhs, rhs])
}

public func /(
  lhs: URLPath,
  rhs: String
) -> URLPath {
  var new = lhs
  new.fragments.append(rhs)
  return new
}

public func /(
  lhs: URLPath,
  rhs: [String]
) -> URLPath {
  var new = lhs
  new.fragments.append(contentsOf: rhs)
  return new
}

public func /(
  lhs: URLPath,
  rhs: CustomStringConvertible
) -> URLPath {
  var new = lhs
  new.fragments.append(rhs.description)
  return new
}
