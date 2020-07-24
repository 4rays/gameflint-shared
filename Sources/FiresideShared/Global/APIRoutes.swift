import Foundation

public protocol EndpointFactory {
  static var base: (Endpoint) -> (Endpoint) { get }
}

public extension EndpointFactory {
  static var make: Endpoint { Self.base(.init()) }
}

public struct Endpoint {
  public var components: [String]

  public init(_ components: [String] = []) {
    self.components = components
  }

  public var fullPath: String {
    components.joined(separator: "/")
  }

  static func component(_ path: String) -> (Endpoint) -> Endpoint {
    { endpoint in
      var new = endpoint
      new.components.append(path)
      return new
    }
  }
}

public enum APIRoutes: EndpointFactory {
  public static var base: (Endpoint) -> (Endpoint) {
    Endpoint.component("api")
  }

  public enum V1: EndpointFactory {
    case auth(Auth)

    public static var base: (Endpoint) -> (Endpoint) {
      compose(
        Endpoint.component("v1"),
        APIRoutes.base
      )
    }

    public enum Auth: String, EndpointFactory {
      case signIn = "sign-in"
      case signUp = "sign-up"
      case refreshAccessToken = "refresh-access"

      public static var base: (Endpoint) -> (Endpoint) {
        compose(
          Endpoint.component("auth"),
          V1.base
        )
      }

      public var make: Endpoint {
        compose(
          Endpoint.component(rawValue),
          Self.base
        )(.init())
      }
    }
  }
}
