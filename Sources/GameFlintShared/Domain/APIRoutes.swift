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

  public func auth(_ endpoint: Auth) -> EndpointTransform {
    versioned(endpoint.path)
  }

  public func account(_ endpoint: Account) -> EndpointTransform {
    versioned(endpoint.path)
  }

  public func admin(_ endpoint: Admin) -> EndpointTransform {
    versioned(endpoint.path)
  }

  public func catalog(_ endpoint: Catalog) -> EndpointTransform {
    versioned(endpoint.path)
  }
}

extension APIRoutes {
  func versioned(
    _ endpoint: EndpointPath
  ) -> EndpointTransform {
    path / endpoint.transform
  }

  public func versioned(
    transform: @escaping EndpointTransform
  ) -> EndpointTransform {
    path / transform
  }

  public func versioned<T>(
    transform: @escaping (T) -> EndpointTransform
  ) -> (T) -> EndpointTransform {
    { path / transform($0) }
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
      case allPaged
      case filterByPlaythrough
      case update
      case delete

      public var path: EndpointPath {
        switch self {
        case .filterByPlaythrough: return .userGamesByPlaythrough
        case .allPaged: return .userGamesPaged
        default: return .userGames
        }
      }
    }

    public enum PlaySessions: EndpointCollection {
      case all
      case allPaged
      case create
      case delete

      public var path: EndpointPath {
        switch self {
        case .allPaged: return .playSessionsPaged
        default: return .playSessions
        }
      }
    }

    public enum Profile: EndpointCollection {
      case get
      case update

      public var path: EndpointPath { .profile }
    }

    public enum Games: EndpointCollection {
      case flareUp(UUID)

      public var path: EndpointPath {
        switch self {
        case .flareUp(let id): return .flareUp(id)
        }
      }
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
      case `import`
      case create
      case update
      case delete

      public var path: EndpointPath {
        switch self {
        case .import: return .importGames
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

  public enum Catalog: EndpointCollection {
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
      case find(UUID)
      case upcoming
      case search
      case fireside(UUID)

      public var path: EndpointPath {
        switch self {
        case .all: return .games
        case .find(let id): return .findGame(id)
        case .fireside(let id): return .fireside(id)
        case .upcoming: return .upcomingGames
        case .search: return .gameSearch
        }
      }
    }

    public enum Companies: EndpointCollection {
      case all
      case allPaged(Int)
      case find
      case search

      public var path: EndpointPath {
        switch self {
        case .all, .find: return .companies
        case .allPaged(let page): return .pagedCompanies(page)
        case .search: return .companySearch
        }
      }
    }

    public enum Platforms: EndpointCollection {
      case all
      case allPaged(Int)
      case find
      case search

      public var path: EndpointPath {
        switch self {
        case .all, .find: return .platforms
        case .allPaged(let page): return .pagedPlatforms(page)
        case .search: return .platformSearch
        }
      }
    }

    public enum Genres: EndpointCollection {
      case all
      case allPaged(Int)
      case find
      case search

      public var path: EndpointPath {
        switch self {
        case .all, .find: return .genres
        case .allPaged(let page): return .pagedGenres(page)
        case .search: return .genreSearch
        }
      }
    }

    public enum Tags: EndpointCollection {
      case all
      case allPaged(Int)
      case find
      case search

      public var path: EndpointPath {
        switch self {
        case .all, .find: return .tags
        case .allPaged(let page): return .pagedTags(page)
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
  case userGamesPaged
  case userGamesByPlaythrough
  case playSessions
  case playSessionsPaged
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

  // MARK: - Catalog
  case games
  case gameSearch
  case upcomingGames
  case findGame(UUID)
  case fireside(UUID)
  case flareUp(UUID)

  case companies
  case pagedCompanies(Int)
  case companySearch
  case findCompany(UUID)

  case tags
  case pagedTags(Int)
  case tagSearch
  case findTag(UUID)

  case genres
  case pagedGenres(Int)
  case genreSearch
  case findGenre(UUID)

  case platforms
  case pagedPlatforms(Int)
  case platformSearch
  case findPlatform(UUID)

  public var games: EndpointTransform { String.games.asPath }
  public var companies: EndpointTransform { String.companies.asPath }
  public var platforms: EndpointTransform { String.platforms.asPath }
  public var genres: EndpointTransform { String.genres.asPath }
  public var tags: EndpointTransform { String.tags.asPath }

  public var auth: EndpointTransform { String.auth.asPath }
  public var account: EndpointTransform { String.account.asPath }
  public var admin: EndpointTransform { String.admin.asPath }

  public var transform: EndpointTransform {
    switch self {
    case .auth                    : return auth
    case .signIn                  : return auth / .signIn
    case .signUp                  : return auth / .signUp
    case .refreshAccessToken      : return auth / .refreshAccessToken
    case .verifyEmail             : return auth / .verifyEmail
    case .resetPassword           : return auth / .resetPassword
    case .verifyPasswordToken     : return auth / .resetPassword / .verify
    case .changePassword          : return auth / .changePassword
    case .siwa                    : return auth / .siwa

    case .account                 : return account
    case .userGames               : return account / .games
    case .userGamesPaged          : return account / .games / .page
    case .userGamesByPlaythrough  : return account / .games / .filters / .playthroughs
    case .playSessions            : return account / .playSessions
    case .playSessionsPaged       : return account / .playSessions / .page
    case .resendVerification      : return account / .resendVerification
    case .profile                 : return account / .profile

    case .admin                   : return admin
    case .adminGames              : return admin / .games
    case .importGames             : return admin / .games / .import
    case .adminPlatforms          : return admin / .platforms
    case .adminTags               : return admin / .tags
    case .adminGenres             : return admin / .genres
    case .adminCompanies          : return admin / .companies

    case .games                   : return games
    case .gameSearch              : return games / .search
    case .upcomingGames           : return games / .upcoming
    case .findGame(let id)        : return games / id.uuidString
    case .fireside(let id)        : return games / id.uuidString / .fireside
    case .flareUp(let id)         : return games / id.uuidString / .flare

    case .companies               : return companies
    case .pagedCompanies(let page): return companies / .page / String(page)
    case .companySearch           : return companies / .search
    case .findCompany(let id)     : return companies / id.uuidString

    case .tags                    : return tags
    case .tagSearch               : return tags / .search
    case .pagedTags(let page)     : return tags / .page / String(page)
    case .findTag(let id)         : return tags / id.uuidString

    case .genres                  : return genres
    case .pagedGenres(let page)   : return genres / .page / String(page)
    case .genreSearch             : return genres / .search
    case .findGenre(let id)       : return genres / id.uuidString

    case .platforms               : return platforms
    case .pagedPlatforms(let page): return platforms / .page / String(page)
    case .platformSearch          : return platforms / .search
    case .findPlatform(let id)    : return platforms / id.uuidString
    }
  }
}

// Operators
func /(
  lhs: @escaping EndpointTransform,
  rhs: @escaping EndpointTransform
) -> EndpointTransform {
  compose(rhs, lhs)
}

public func /(
  lhs: String,
  rhs: String
) -> EndpointTransform {
  compose(rhs.asPath, lhs.asPath)
}

public func /(
  lhs: String,
  rhs: @escaping EndpointTransform
) -> EndpointTransform {
  compose(rhs, lhs.asPath)
}

public func /(
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
  static let flare = "flare"
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
