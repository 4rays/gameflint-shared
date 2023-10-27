import Foundation

extension URLPath {
  public static var authPath: Self = .init(.auth)
  public static var signIn: Self = authPath / .signIn
  public static var signUp: Self = authPath / .signUp
  public static var refreshAccessToken: Self = authPath / .refreshAccessToken
  public static var verifyEmail: Self = authPath / .verifyEmail
  public static var resetPassword: Self = authPath / .resetPassword
  public static var verifyPasswordToken: Self = authPath / .resetPassword / .verify
  public static var changePassword: Self = authPath / .changePassword
  public static var siwa: Self = authPath / .siwa

  // MARK: - User Account
  public static var accountPath: Self = .init(.account)
  public static var userGames: Self = accountPath / .games
  public static var userGamesPaginated: Self = userGames / .page
  public static var userGamesByPlaythrough: Self = userGames / .filters / .playthroughs

  public static var playSessions: Self = accountPath / .playSessions
  public static func playSession(id: PlaySession.ID) -> Self { playSessions / id }
  public static func playSessions(page: Int) -> Self { playSessions / .page / page }

  public static var playSessionsPaginated: Self = playSessions / .page
  public static var resendVerification: Self = accountPath / .resendVerification
  public static var profile: Self = accountPath / .profile

  // MARK: - Admin
  public static var adminPath: Self = .init(.admin)
  public static var adminGames: Self = adminPath / .games
  public static var importGames: Self = adminGames / .importPath
  public static var adminPlatforms: Self = adminPath / .platforms
  public static var adminTags: Self = adminPath / .tags
  public static var adminGenres: Self = adminPath / .genres
  public static var adminCompanies: Self = adminPath / .companies

  public static func adminReleases(for id: Game.ID) -> Self {
    adminGames / id / .releases
  }

  public static func deleteRelease(with id: Release.ID, gameID: Game.ID) -> Self {
    adminGames / gameID / .releases / id
  }

  // MARK: - Games
  public static var gamesPath: Self = .init(.games)
  public static var gameSearch: Self = gamesPath / .search
  public static var upcomingGames: Self = gamesPath / .upcoming
  public static func gamesPaginated(page: Int) -> Self { gamesPath / .page / page }
  public static func game(with id: Game.ID) -> Self { gamesPath / id }
  public static func fireside(with id: Game.ID) -> Self { game(with: id) / .fireside }
  public static func flare(with id: Game.ID) -> Self { fireside(with: id) / .flare }

  // MARK: - Companies
  public static var companiesPath: Self = .init(.companies)
  public static var companySearch: Self = companiesPath / .search
  public static func findCompany(with id: Company.ID) -> Self { companiesPath / id }
  public static func companiesPaginated(page: Int) -> Self { companiesPath / .page / page }

  // MARK: - Tags
  public static var tagsPath: Self = .init(.tags)
  public static var tagSearch: Self = tagsPath / .search
  public static func tagsPaginated(page: Int) -> Self { tagsPath / .page / page }
  public static func findTag(with id: Tag.ID) -> Self { tagsPath / id }

  // MARK: - Genres
  public static var genresPath: Self = .init(.genres)
  public static var genreSearch: Self = genresPath / .search
  public static func genresPaginated(page: Int) -> Self { genresPath / .page / page }
  public static func findGenre(with id: Genre.ID) -> Self { genresPath / id }

  // MARK: - Platform
  public static var platformsPath: Self = .init(.platforms)
  public static var platformSearch: Self = platformsPath / .search
  public static func platformsPaginated(page: Int) -> Self { platformsPath / .page / page }
  public static func findPlatform(with id: Platform.ID) -> Self { platformsPath / id }

  public func apiVersion(_ version: APIVersion) -> Self {
    .init(.v(version)) / fragments
  }
}
