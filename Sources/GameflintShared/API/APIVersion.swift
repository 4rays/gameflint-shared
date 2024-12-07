public struct APIVersion: Sendable, Hashable {
  let major: Int
  let minor: Int?
  let patch: Int?

  public init(
    major: Int = 1,
    minor: Int? = nil,
    patch: Int? = nil
  ) {
    self.major = major
    self.minor = minor
    self.patch = patch
  }
}

extension APIVersion {
  public static let v1 = Self(major: 1)

  public var description: String {
    var path = "v\(major)"

    if let minor = minor {
      path.append(".\(minor)")
    }

    if let patch = patch {
      path.append(".\(patch)")
    }

    return path
  }
}
