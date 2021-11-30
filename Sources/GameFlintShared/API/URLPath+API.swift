import Foundation

extension URLPath {
  public static var authRoot: Self = .init(.auth)
  public static var signIn: Self = authRoot / .signIn
  public static var signUp: Self = authRoot / .signUp
  public static var refreshAccessToken: Self = authRoot / .refreshAccessToken
  public static var verifyEmail: Self = authRoot / .verifyEmail
  public static var resetPassword: Self = authRoot / .resetPassword
  public static var verifyPasswordToken: Self = authRoot / .resetPassword / .verify
  public static var changePassword: Self = authRoot / .changePassword
  public static var siwa: Self = authRoot / .siwa

  // MARK: - User Account
  public static var accountRoot: Self = .init(.account)
  public static var userGames: Self = accountRoot / .games
  public static var userGamesPaged: Self = userGames / .page
  public static var userGamesByPlaythrough: Self = userGames / .filters / .playthroughs

  public static var playSessions: Self = accountRoot / .playSessions
  public static var playSessionsPaged: Self = playSessions / .page
  public static var resendVerification: Self = accountRoot / .resendVerification
  public static var profile: Self = accountRoot / .profile

  // MARK: - Admin
  public static var adminRoot: Self = .init(.admin)
  public static var adminGames: Self = adminRoot / .games
  public static var importGames: Self = adminGames / .importPath
  public static var adminPlatforms: Self = adminRoot / .platforms
  public static var adminTags: Self = adminRoot / .tags
  public static var adminGenres: Self = adminRoot / .genres
  public static var adminCompanies: Self = adminRoot / .companies

  public static func adminReleases(for id: Game.ID) -> Self {
    adminGames / id / .releases
  }

  public static func deletRelease(with id: Release.ID, gameID: Game.ID) -> Self {
    adminGames / gameID / .releases / id
  }

  // MARK: - Games
  public static var gamesRoot: Self = .init(.games)
  public static var gameSearch: Self = gamesRoot / .search
  public static var upcomingGames: Self = gamesRoot / .upcoming
  public static func pagedGames(page: Int) -> Self { gamesRoot / .page / page }
  public static func findGame(with id: Game.ID) -> Self { gamesRoot / id }
  public static func fireside(with id: Game.ID) -> Self { gamesRoot / id / .fireside }
  public static func flareUp(with id: Game.ID) -> Self { gamesRoot / id / .flare }

  // MARK: - Companies
  public static var companiesRoot: Self = .init(.companies)
  public static var companySearch: Self = companiesRoot / .search
  public static func findCompany(with id: Company.ID) -> Self { companiesRoot / id }
  public static func pagedCompanies(page: Int) -> Self { companiesRoot / .page / page }

  // MARK: - Tags
  public static var tagsRoot: Self = .init(.tags)
  public static var tagSearch: Self = tagsRoot / .search
  public static func pagedTags(page: Int) -> Self { tagsRoot / .page / page }
  public static func findTag(with id: Tag.ID) -> Self { tagsRoot / id }

  // MARK: - Genres
  public static var genresRoot: Self = .init(.genres)
  public static var genreSearch: Self = genresRoot / .search
  public static func pagedGenres(page: Int) -> Self { genresRoot / .page / page }
  public static func findGenre(with id: Genre.ID) -> Self { genresRoot / id }

  // MARK: - Platform
  public static var platformsRoot: Self = .init(.platforms)
  public static var platformSearch: Self = platformsRoot / .search
  public static func pagedPlatforms(page: Int) -> Self { platformsRoot / page }
  public static func findPlatform(with id: Platform.ID) -> Self { platformsRoot / id }

  public func apiVersion(_ version: APIVersion) -> Self {
    let api = .init(.api) / .v(version)
    return api / self.fragments
  }
}
