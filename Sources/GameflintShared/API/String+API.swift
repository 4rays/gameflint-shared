import Foundation

// Paths
public extension String {
  static func v(_ version: APIVersion) -> String {
    version.description
  }

  static func segment(_ value: String) -> String {
    return value
  }

  static let account = "account"
  static let admin = "admin"
  static let api = "api"
  static let auth = "auth"
  static let changePassword = "change-password"
  static let companies = "companies"
  static let importPath = "import"
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
  static let releases = "releases"
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
