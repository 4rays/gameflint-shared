import Foundation
import HTTPRequestBuilder

extension Path {
  public static var auth: Self = .init(String.auth)
  public static var signIn: Self = auth / String.signIn
  public static var signUp: Self = auth / String.signUp
  public static var refreshAccessToken: Self = auth / String.refreshAccessToken
  public static var verifyEmail: Self = auth / String.verifyEmail
  public static var resetPassword: Self = auth / String.resetPassword
  public static var verifyPasswordToken: Self = auth / String.resetPassword / String.verify
  public static var changePassword: Self = auth / String.changePassword
  public static var siwa: Self = auth / String.siwa

  // MARK: - User Account
  public static var account: Self = .init(String.account)
  public static var userGames: Self = account / String.games
  public static var userGamesPaginated: Self = userGames / String.page
  public static var userGamesByPlaythrough: Self = userGames / String.filters / String.playthroughs

  public static var playSessions: Self = account / String.playSessions
  public static func playSession(id: PlaySession.ID) -> Self { playSessions / id }
  public static func playSessions(page: Int) -> Self { playSessions / String.page / page }

  public static var playSessionsPaginated: Self = playSessions / String.page
  public static var resendVerification: Self = account / String.resendVerification
  public static var profile: Self = account / String.profile

  // MARK: - Admin
  public static var admin: Self = .init(String.admin)
  public static var adminGames: Self = admin / String.games
  public static var importGames: Self = adminGames / String.importPath
  public static var adminPlatforms: Self = admin / String.platforms
  public static var adminTags: Self = admin / String.tags
  public static var adminGenres: Self = admin / String.genres
  public static var adminCompanies: Self = admin / String.companies

  public static func adminReleases(for id: Game.ID) -> Self {
    adminGames / id / String.releases
  }

  public static func deleteRelease(with id: Release.ID, gameID: Game.ID) -> Self {
    adminGames / gameID / String.releases / id
  }

  // MARK: - Games
  public static var games: Self = .init(String.games)
  public static var gameSearch: Self = games / String.search
  public static var upcomingGames: Self = games / String.upcoming
  public static func gamesPaginated(page: Int) -> Self { games / String.page / page }
  public static func game(with id: Game.ID) -> Self { games / id }
  public static func fireside(with id: Game.ID) -> Self { game(with: id) / String.fireside }
  public static func flare(with id: Game.ID) -> Self { fireside(with: id) / String.flare }

  // MARK: - Companies
  public static var companiesPath: Self = .init(String.companies)
  public static var companySearch: Self = companiesPath / String.search
  public static func findCompany(with id: Company.ID) -> Self { companiesPath / id }
  public static func companiesPaginated(page: Int) -> Self { companiesPath / String.page / page }

  // MARK: - Tags
  public static var tagsPath: Self = .init(String.tags)
  public static var tagSearch: Self = tagsPath / String.search
  public static func tagsPaginated(page: Int) -> Self { tagsPath / String.page / page }
  public static func findTag(with id: Tag.ID) -> Self { tagsPath / id }

  // MARK: - Genres
  public static var genres: Self = .init(String.genres)
  public static var genreSearch: Self = genres / String.search
  public static func genresPaginated(page: Int) -> Self { genres / String.page / page }
  public static func findGenre(with id: Genre.ID) -> Self { genres / id }

  // MARK: - Platform
  public static var platforms: Self = .init(String.platforms)
  public static var platformSearch: Self = platforms / String.search
  public static func platformsPaginated(page: Int) -> Self { platforms / String.page / page }
  public static func findPlatform(with id: Platform.ID) -> Self { platforms / id }

  public func apiVersion(_ version: APIVersion) -> Self {
    .init(String.v(version)) / fragments
  }
}
