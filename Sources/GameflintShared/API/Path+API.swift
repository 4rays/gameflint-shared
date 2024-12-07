import Foundation
import HTTPRequestBuilder

extension Path {
  public static let auth = Self(String.auth)
  public static let signIn = auth / String.signIn
  public static let signUp = auth / String.signUp
  public static let refreshAccessToken = auth / String.refreshAccessToken
  public static let verifyEmail = auth / String.verifyEmail
  public static let resetPassword = auth / String.resetPassword
  public static let verifyPasswordToken = auth / String.resetPassword / String.verify
  public static let changePassword = auth / String.changePassword
  public static let siwa = auth / String.siwa

  // MARK: - User Account
  public static let account = Self(String.account)
  public static let userGames = account / String.games
  public static let userGamesPaginated = userGames / String.page
  public static let userGamesByPlaythrough = userGames / String.filters / String.playthroughs

  public static let playSessions = account / String.playSessions
  public static func playSession(id: PlaySession.ID) -> Self { playSessions / id }
  public static func playSessions(page: Int) -> Self { playSessions / String.page / page }

  public static let playSessionsPaginated = playSessions / String.page
  public static let resendVerification = account / String.resendVerification
  public static let profile = account / String.profile

  // MARK: - Admin
  public static let admin = Self(String.admin)
  public static let adminGames = admin / String.games
  public static let importGames = adminGames / String.importPath
  public static let adminPlatforms = admin / String.platforms
  public static let adminTags = admin / String.tags
  public static let adminGenres = admin / String.genres
  public static let adminCompanies = admin / String.companies

  public static func adminReleases(for id: Game.ID) -> Self { adminGames / id / String.releases }
  public static func deleteRelease(with id: Release.ID, gameID: Game.ID) -> Self {
    adminGames / gameID / String.releases / id
  }

  // MARK: - Games
  public static let games = Self(String.games)
  public static let gameSearch = games / String.search
  public static let upcomingGames = games / String.upcoming
  public static func gamesPaginated(page: Int) -> Self { games / String.page / page }
  public static func game(with id: Game.ID) -> Self { games / id }
  public static func fireside(with id: Game.ID) -> Self { game(with: id) / String.fireside }
  public static func flare(with id: Game.ID) -> Self { fireside(with: id) / String.flare }

  // MARK: - Companies
  public static let companiesPath = Self(String.companies)
  public static let companySearch = companiesPath / String.search
  public static func findCompany(with id: Company.ID) -> Self { companiesPath / id }
  public static func companiesPaginated(page: Int) -> Self { companiesPath / String.page / page }

  // MARK: - Tags
  public static let tagsPath = Self(String.tags)
  public static let tagSearch = tagsPath / String.search
  public static func tagsPaginated(page: Int) -> Self { tagsPath / String.page / page }
  public static func findTag(with id: Tag.ID) -> Self { tagsPath / id }

  // MARK: - Genres
  public static let genres = Self(String.genres)
  public static let genreSearch = genres / String.search
  public static func genresPaginated(page: Int) -> Self { genres / String.page / page }
  public static func findGenre(with id: Genre.ID) -> Self { genres / id }

  // MARK: - Platform
  public static let platforms = Self(String.platforms)
  public static let platformSearch = platforms / String.search
  public static func platformsPaginated(page: Int) -> Self { platforms / String.page / page }
  public static func findPlatform(with id: Platform.ID) -> Self { platforms / id }

  public func apiVersion(_ version: APIVersion) -> Self {
    .init(String.v(version)) / fragments
  }
}
