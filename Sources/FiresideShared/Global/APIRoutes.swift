import Foundation

public enum APIRoutes: PathProviding {
  case v1(V1)

  public static let root = "api"

  public var rawValue: String {
    switch self {
    case .v1(let v1):
      return v1.path
    }
  }

  public enum V1: PathProviding {
    case auth(Auth)

    public static let root = "v1"

    public var rawValue: String {
      switch self {
      case .auth(let auth):
        return auth.path
      }
    }

    public enum Auth: String, PathProviding {
      public static let root = "auth"

      case signIn = "sign-in"
      case signUp = "sign-up"
      case refreshAccessToken = "refresh-access"
    }
  }
}

public protocol PathProviding {
  static var root: String { get }
  var rawValue: String { get }

}

public extension PathProviding {
  var path: String {
    return [Self.root, self.rawValue].joined(separator: "/")
  }
}
