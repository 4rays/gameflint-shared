import Foundation

public typealias EndpointTransform = (Endpoint) -> Endpoint

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

public protocol EndpointCollection {
  var path: EndpointPath { get }
}

public extension EndpointCollection {
  var endpoint: Endpoint {
    path.transform(.init())
  }
}

public struct APIRoutes {
  public static var v1 = Self(version: .init(major: 1))
  let version: Version

  public init(version: APIRoutes.Version = .init()) {
    self.version = version
  }

  public var path: EndpointTransform {
    .api / version.path
  }
}

extension APIRoutes {
  public struct Version {
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

    public var path: String {
      .v(self)
    }
  }

  public enum Auth: EndpointCollection {
    case signIn
    case signUp
    case refreshAccessToken
    case verifyEmail
    case resetPassword
    case verifyPasswordToken
    case changePassword
    case siwa

    public var path: EndpointPath {
      switch self {
      case .signIn: return .signIn
      case .signUp: return .signUp
      case .refreshAccessToken: return .refreshAccessToken
      case .verifyEmail: return .verifyEmail
      case .resetPassword: return .resetPassword
      case .verifyPasswordToken: return .verifyPasswordToken
      case .changePassword: return .changePassword
      case .siwa: return .siwa
      }
    }
  }

  public enum Account: EndpointCollection {
    case userGames(UserGames)
    case games(Games)
    case sessions(PlaySessions)
    case profile(Profile)
    case resendVerification

    public var path: EndpointPath {
      switch self {
      case .userGames(let userGames): return userGames.path
      case .games(let games): return games.path
      case .sessions(let sessions): return sessions.path
      case .profile(let profile): return profile.path
      case .resendVerification: return .resendVerification
      }
    }

    public enum UserGames: EndpointCollection {
      case all
      case filterByPlaythrough
      case update
      case delete

      public var path: EndpointPath {
        switch self {
        case .filterByPlaythrough: return .userGamesByPlaythrough
        default: return .userGames
        }
      }
    }

    public enum PlaySessions: EndpointCollection {
      case all
      case create
      case delete

      public var path: EndpointPath { .playSessions }
    }

    public enum Profile: EndpointCollection {
      case get
      case update

      public var path: EndpointPath { .profile }
    }

    public enum Games: EndpointCollection {
      case flareUp

      public var path: EndpointPath { .games }
    }
  }

  public enum Admin: EndpointCollection {
    case games(Games)
    case platforms(Platforms)
    case genres(Genres)
    case tags(Tags)

    public var path: EndpointPath {
      switch self {
      case .games(let games): return games.path
      case .platforms(let platforms): return platforms.path
      case .genres(let genres): return genres.path
      case .tags(let tags): return tags.path
      }
    }

    public enum Games: EndpointCollection {
      case batchImport
      case create
      case update
      case delete

      public var path: EndpointPath {
        switch self {
        case .batchImport: return .importGames
        case .create, .update, .delete: return .adminGames
        }
      }
    }

    public enum Platforms: EndpointCollection {
      case create
      case update
      case delete

      public var path: EndpointPath  { .adminPlatforms }
    }

    public enum Tags: EndpointCollection {
      case create
      case update
      case delete

      public var path: EndpointPath { .adminTags }
    }

    public enum Genres: EndpointCollection {
      case create
      case update
      case delete

      public var path: EndpointPath { .adminGenres }
    }
  }

  public enum Public: EndpointCollection {
    case games(Games)
    case companies(Companies)
    case platforms(Platforms)
    case genres(Genres)
    case tags(Tags)

    public var path: EndpointPath {
      switch self {
      case .games(let games): return games.path
      case .companies(let companies): return companies.path
      case .platforms(let platforms): return platforms.path
      case .genres(let genres): return genres.path
      case .tags(let tags): return tags.path
      }
    }

    public enum Games: EndpointCollection {
      case all
      case find
      case upcoming
      case search
      case fireside

      public var path: EndpointPath {
        switch self {
        case .all, .find, .fireside: return .games
        case .upcoming: return .upcomingGames
        case .search: return .gameSearch
        }
      }
    }

    public enum Companies: EndpointCollection {
      case all
      case find
      case search

      public var path: EndpointPath {
        switch self {
        case .all, .find: return .companies
        case .search: return .companySearch
        }
      }
    }

    public enum Platforms: EndpointCollection {
      case all
      case find
      case search

      public var path: EndpointPath {
        switch self {
        case .all, .find: return .platforms
        case .search: return .platformSearch
        }
      }
    }

    public enum Genres: EndpointCollection {
      case all
      case find
      case search

      public var path: EndpointPath {
        switch self {
        case .all, .find: return .genres
        case .search: return .genreSearch
        }
      }
    }

    public enum Tags: EndpointCollection {
      case all
      case find
      case search

      public var path: EndpointPath {
        switch self {
        case .all, .find: return .tags
        case .search: return .tagSearch
        }
      }
    }
  }
}

public enum EndpointPath {
  // MARK: - Auth
  case auth
  case signIn
  case signUp
  case refreshAccessToken
  case verifyEmail
  case resetPassword
  case verifyPasswordToken
  case changePassword
  case siwa

  // MARK: - Account
  case account
  case userGames
  case userGamesByPlaythrough
  case playSessions
  case resendVerification
  case profile

  // MARK: - Admin
  case admin
  case adminGames
  case importGames
  case adminPlatforms
  case adminTags
  case adminGenres
  case adminCompanies

  // MARK: - Public
  case games
  case companies
  case tags
  case genres
  case platforms

  case pagedCompanies
  case pagedTags
  case pagedGenres
  case pagedPlatforms

  case companySearch
  case platformSearch
  case genreSearch
  case tagSearch
  case gameSearch
  case upcomingGames

  case fireside(UUID)
  case flareUp(UUID)

  public var transform: EndpointTransform {
    switch self {
    case .auth                   : return String.auth.asPath
    case .signIn                 : return .auth / .signIn
    case .signUp                 : return .auth / .signUp
    case .refreshAccessToken     : return .auth / .refreshAccessToken
    case .verifyEmail            : return .auth / .verifyEmail
    case .resetPassword          : return .auth / .resetPassword
    case .verifyPasswordToken    : return .auth / .resetPassword / .verify
    case .changePassword         : return .auth / .changePassword
    case .siwa                   : return .auth / .siwa

    case .account                : return String.account.asPath
    case .userGames              : return .account / .games
    case .userGamesByPlaythrough : return .account / .games / .filters / .playthroughs
    case .playSessions           : return .account / .playSessions
    case .resendVerification     : return .account / .resendVerification
    case .profile                : return .account / .profile

    case .admin                  : return String.admin.asPath
    case .adminGames             : return .admin / .games
    case .importGames            : return .admin / .games / .import
    case .adminPlatforms         : return .admin / .platforms
    case .adminTags              : return .admin / .tags
    case .adminGenres            : return .admin / .genres
    case .adminCompanies         : return .admin / .companies

    case .games                  : return String.games.asPath
    case .companies              : return String.companies.asPath
    case .tags                   : return String.tags.asPath
    case .genres                 : return String.genres.asPath
    case .platforms              : return String.platforms.asPath

    case .pagedCompanies         : return .companies / .page
    case .pagedTags              : return .tags / .page
    case .pagedGenres            : return .genres / .page
    case .pagedPlatforms         : return .platforms / .page

    case .companySearch          : return .companies / .search
    case .platformSearch         : return .platforms / .search
    case .genreSearch            : return .genres / .search
    case .tagSearch              : return .tags / .search
    case .gameSearch             : return .games / .search
    case .upcomingGames          : return .games / .upcoming

    case let .fireside(id)       : return String.games.asPath / id.uuidString / .fireside
    case let .flareUp(id)        : return String.games.asPath / id.uuidString / .flame
    }
  }
}

public extension APIRoutes {

  func versioned(
    _ endpoint: EndpointPath
  ) -> EndpointTransform {
    path / endpoint.transform
  }

  func versioned(
    transform: @escaping EndpointTransform
  ) -> EndpointTransform {
    path / transform
  }

  func versioned<T>(
    transform: @escaping (T) -> EndpointTransform
  ) -> (T) -> EndpointTransform {
    { path / transform($0) }
  }
}

// Operators
func /(
  lhs: @escaping EndpointTransform,
  rhs: @escaping EndpointTransform
) -> EndpointTransform {
  compose(rhs, lhs)
}

private func /(
  lhs: String,
  rhs: String
) -> EndpointTransform {
  compose(rhs.asPath, lhs.asPath)
}

private func /(
  lhs: String,
  rhs: @escaping EndpointTransform
) -> EndpointTransform {
  compose(rhs, lhs.asPath)
}

private func /(
  lhs: @escaping EndpointTransform,
  rhs: String
) -> EndpointTransform {
  compose(rhs.asPath, lhs)
}

// Paths
public extension String {
  var asPath: EndpointTransform {
    { endpoint in
      var new = endpoint
      new.components.append(self)
      return new
    }
  }

  static func v(_ version: APIRoutes.Version) -> String {
    var path = "v\(version.major)"

    if let minor = version.minor {
      path.append(".\(minor)")
    }

    if let patch = version.patch {
      path.append(".\(patch)")
    }

    return path
  }

  static let account = "account"
  static let admin = "admin"
  static let api = "api"
  static let auth = "auth"
  static let changePassword = "change-password"
  static let companies = "companies"
  static let `import` = "import"
  static let filters = "filters"
  static let fireside = "fireside"
  static let flame = "flame"
  static let games = "games"
  static let genres = "genres"
  static let page = "page"
  static let profile = "profile"
  static let platforms = "platforms"
  static let playSessions = "play-sessions"
  static let playthroughs = "playthroughs"
  static let refreshAccessToken = "refresh-access"
  static let resendVerification = "resend-verification"
  static let resetPassword = "reset-password"
  static let search = "search"
  static let signIn = "sign-in"
  static let signUp = "sign-up"
  static let siwa = "siwa"
  static let tags = "tags"
  static let upcoming = "upcoming"
  static let verify = "verify"
  static let verifyEmail = "verify-email"
}
