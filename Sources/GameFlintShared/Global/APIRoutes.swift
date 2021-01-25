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

public protocol EndpointFactoryGroup {
  var make: EndpointFactory { get }
}

public extension EndpointFactoryGroup {
  var endpoint: Endpoint {
    make(.init())
  }
}

public enum APIRoutes {
  public enum V1 {
    public enum Auth: EndpointFactoryGroup {
      case signIn
      case signUp
      case refreshAccessToken
      case verifyEmail
      case resetPassword
      case verifyPasswordToken
      case changePassword
      case siwa

      public var make: EndpointFactory {
        switch self {
        case .signIn:
          return APIRoutes.signIn
        case .signUp:
          return APIRoutes.signUp
        case .refreshAccessToken:
          return APIRoutes.refreshAccessToken
        case .verifyEmail:
          return APIRoutes.verifyEmail
        case .resetPassword:
          return APIRoutes.resetPassword
        case .verifyPasswordToken:
          return APIRoutes.verifyPasswordToken
        case .changePassword:
          return APIRoutes.changePassword
        case .siwa:
          return APIRoutes.siwa
        }
      }
    }

    public enum Account: EndpointFactoryGroup {
      case userGames(UserGames)
      case games(Games)
      case sessions(PlaySessions)
      case profile(Profile)
      case resendVerification

      public var make: EndpointFactory {
        switch self {
        case .userGames(let userGames):
          return userGames.make
        case .games(let games):
          return games.make
        case .sessions(let sessions):
          return sessions.make
        case .profile(let profile):
          return profile.make
        case .resendVerification:
          return APIRoutes.resendVerification
        }
      }

      public enum UserGames: EndpointFactoryGroup {
        case all
        case filterByPlaythrough
        case update
        case delete

        public var make: EndpointFactory {
          switch self {
          case .filterByPlaythrough:
            return APIRoutes.userGamesByPlaythrough
          default:
            return APIRoutes.userGames
          }
        }
      }

      public enum PlaySessions: EndpointFactoryGroup {
        case all
        case create
        case delete

        public var make: EndpointFactory {
          APIRoutes.playSessions
        }
      }

      public enum Profile: EndpointFactoryGroup {
        case get
        case update

        public var make: EndpointFactory {
          APIRoutes.profile
        }
      }

      public enum Games: EndpointFactoryGroup {
        case flint

        public var make: EndpointFactory {
          APIRoutes.games
        }
      }
    }

    public enum Admin: EndpointFactoryGroup {
      case games(Games)

      public var make: EndpointFactory {
        switch self {
        case .games(let games):
          return games.make
        }
      }

      public enum Games: EndpointFactoryGroup {
        case batchImport
        case create
        case update
        case delete

        public var make: EndpointFactory {
          switch self {
          case .batchImport:
            return APIRoutes.importGames
          case .create, .update, .delete:
            return APIRoutes.adminGames
          }
        }
      }
    }

    public enum Hearth: EndpointFactoryGroup {
      case games(Games)

      public var make: EndpointFactory {
        switch self {
        case .games(let games):
          return games.make
        }
      }

      public enum Games: EndpointFactoryGroup {
        case all
        case find
        case upcoming
        case search
        case fireside

        public var make: EndpointFactory {
          switch self {
          case .all, .find, .fireside:
            return APIRoutes.games
          case .upcoming:
            return APIRoutes.upcomingGames
          case .search:
            return APIRoutes.gameSearch
          }
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

  static var gamesPath: EndpointFactory {
    component("games")
  }

  static var filters: EndpointFactory {
    component("filters")
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

  static var siwa: EndpointFactory {
    compose(component("siwa"), auth)
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

  static var userGamesByPlaythrough: EndpointFactory {
    compose(component("playthroughs"), filters, userGames)
  }

  static var playSessions: EndpointFactory {
    compose(component("play-sessions"), account)
  }

  static var resendVerification: EndpointFactory {
    compose(component("resend-verification"), account)
  }

  static var profile: EndpointFactory {
    compose(component("profile"), account)
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
  static var games: EndpointFactory {
    compose(gamesPath, v1)
  }

  static var upcomingGames: EndpointFactory {
    compose(component("upcoming"), games)
  }

  static var gameSearch: EndpointFactory {
    compose(component("search"), games)
  }

  static var firesidePath: EndpointFactory {
    component("fireside")
  }

  static func fireside(for id: UUID) -> EndpointFactory {
    compose(firesidePath, component(id.uuidString), games)
  }

  static var flintPath: EndpointFactory {
    component("flint")
  }
}
