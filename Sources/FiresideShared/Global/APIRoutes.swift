import Foundation

public typealias EndpointFactory = (Endpoint) -> Endpoint


public struct Endpoint {
  public var components: [String]

  public init(_ components: [String] = []) {
    self.components = components
  }

  public var fullPath: String {
    components.joined(separator: "/")
  }

  public func last(_ n: Int) -> ArraySlice<String> {
    guard n > 0 else { return [] }
    return components[(components.endIndex - n)..<components.endIndex]
  }
}

public enum APIRoutes {
  public enum V1 {
    public enum Auth {
      case signIn
      case signUp
      case refreshAccessToken
      case verifyEmail
      case resetPassword
      case verifyPasswordToken
      case changePassword

      public var endpoint: Endpoint {
        switch self {
        case .signIn:
          return APIRoutes.signIn(.init())
        case .signUp:
          return APIRoutes.signUp(.init())
        case .refreshAccessToken:
          return APIRoutes.refreshAccessToken(.init())
        case .verifyEmail:
          return APIRoutes.verifyEmail(.init())
        case .resetPassword:
          return APIRoutes.resetPassword(.init())
        case .verifyPasswordToken:
          return APIRoutes.verifyPasswordToken(.init())
        case .changePassword:
          return APIRoutes.changePassword(.init())
        }
      }
    }

    public enum Account {
      case userGames
      case resendVerification

      public var endpoint: Endpoint {
        switch self {
        case .userGames:
          return APIRoutes.userGames(.init())
        case .resendVerification:
          return APIRoutes.resendVerification(.init())
        }
      }
    }

    public enum Admin {
      case games
      case importGames

      public var endpoint: Endpoint {
        switch self {
        case .games:
          return APIRoutes.adminGames(.init())
        case .importGames:
          return APIRoutes.importGames(.init())
        }
      }
    }

    public enum Hearth {
      case games
      case upcomingGames
      case gameSearch

      public var endpoint: Endpoint {
        switch self {
        case .games:
          return APIRoutes.hearthGames(.init())
        case .upcomingGames:
          return APIRoutes.upcomingGames(.init())
        case .gameSearch:
          return APIRoutes.gameSearch(.init())
        }
      }
    }
  }
}

public extension APIRoutes {
  static func component(_ path: String) -> EndpointFactory {
    { endpoint in
      var new = endpoint
      new.components.append(path)
      return new
    }
  }

  static var api: EndpointFactory {
    component("api")
  }

  static var v1: EndpointFactory {
    compose(component("v1"), api)
  }

  static var games: EndpointFactory {
    component("games")
  }
}

// MARK: - Auth
public extension APIRoutes {
  static var auth: EndpointFactory {
    compose(component("auth"), v1)
  }

  static var signIn: EndpointFactory {
    compose(component("sign-in"), auth)
  }

  static var signUp: EndpointFactory {
    compose(component("sign-up"), auth)
  }

  static var refreshAccessToken: EndpointFactory {
    compose(component("refresh-access"), auth)
  }

  static var verifyEmail: EndpointFactory {
    compose(component("verify-email"), auth)
  }

  static var resetPassword: EndpointFactory {
    compose(component("reset-password"), auth)
  }

  static var verifyPasswordToken: EndpointFactory {
    compose(component("verify"), resetPassword)
  }

  static var changePassword: EndpointFactory {
    compose(component("change-password"), auth)
  }
}

// MARK: - Account
public extension APIRoutes {
  static var account: EndpointFactory {
    compose(component("account"), v1)
  }

  static var userGames: EndpointFactory {
    compose(games, account)
  }

  static var resendVerification: EndpointFactory {
    compose(component("resend-verification"), account)
  }
}

// MARK: - Admin
public extension APIRoutes {
  static var admin: EndpointFactory {
    compose(component("admin"), v1)
  }

  static var adminGames: EndpointFactory {
    compose(games, admin)
  }

  static var importGames: EndpointFactory {
    compose(component("import"), adminGames)
  }
}

// MARK: - Hearth
public extension APIRoutes {
  static var hearthGames: EndpointFactory {
    compose(games, v1)
  }

  static var upcomingGames: EndpointFactory {
    compose(component("upcoming"), hearthGames)
  }

  static var gameSearch: EndpointFactory {
    compose(component("search"), hearthGames)
  }
}
