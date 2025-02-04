import Foundation
import HTTPRequestBuilder

extension Path {
  public static let auth = Self(String.auth)
  public static let signIn = auth.appending(.signIn)
  public static let signUp = auth.appending(.signUp)
  public static let refreshAccessToken = auth.appending(.refreshAccessToken)
  public static let verifyEmail = auth.appending(.verifyEmail)
  public static let resetPassword = auth.appending(.resetPassword)
  public static let verifyPasswordToken = auth.appending(.resetPassword).appending(.verify)
  public static let changePassword = auth.appending(.changePassword)
  public static let siwa = auth.appending(.siwa)

  // MARK: - User Account
  public static let account = Self(String.account)
  public static let userGames = account.appending(.games)
  public static let userGamesPaginated = userGames.appending(.page)
  public static let userGamesByPlaythrough = userGames.appending(.filters).appending(.playthroughs)

  public static let playSessions = account.appending(.playSessions)
  public static func playSession(id: PlaySession.ID) -> Self { playSessions.appending(id) }
  public static func playSessions(page: Int) -> Self {
    playSessions.appending(.page).appending(page)
  }

  public static let playSessionsPaginated = playSessions.appending(.page)
  public static let resendVerification = account.appending(.resendVerification)
  public static let profile = account.appending(.profile)

  // MARK: - Admin
  public static let admin = Self(String.admin)
  public static let adminGames = admin.appending(.games)
  public static let importGames = adminGames.appending(.importPath)
  public static let adminPlatforms = admin.appending(.platforms)
  public static let adminTags = admin.appending(.tags)
  public static let adminGenres = admin.appending(.genres)
  public static let adminCompanies = admin.appending(.companies)

  public static func adminReleases(for id: Game.ID) -> Self {
    adminGames.appending(id).appending(.releases)
  }
  public static func deleteRelease(with id: Release.ID, gameID: Game.ID) -> Self {
    adminGames.appending(gameID).appending(.releases).appending(id)
  }

  // MARK: - Games
  public static let games = Self(String.games)
  public static let gameSearch = games.appending(.search)
  public static let upcomingGames = games.appending(.upcoming)
  public static func gamesPaginated(page: Int) -> Self { games.appending(.page).appending(page) }
  public static func game(with id: Game.ID) -> Self { games.appending(id) }
  public static func fireside(with id: Game.ID) -> Self { game(with: id).appending(.fireside) }
  public static func flare(with id: Game.ID) -> Self { fireside(with: id).appending(.flare) }

  // MARK: - Companies
  public static let companiesPath = Self(String.companies)
  public static let companySearch = companiesPath.appending(.search)
  public static func findCompany(with id: Company.ID) -> Self { companiesPath.appending(id) }
  public static func companiesPaginated(page: Int) -> Self {
    companiesPath.appending(.page).appending(page)
  }

  // MARK: - Tags
  public static let tagsPath = Self(String.tags)
  public static let tagSearch = tagsPath.appending(.search)
  public static func tagsPaginated(page: Int) -> Self { tagsPath.appending(.page).appending(page) }
  public static func findTag(with id: Tag.ID) -> Self { tagsPath.appending(id) }

  // MARK: - Genres
  public static let genres = Self(String.genres)
  public static let genreSearch = genres.appending(.search)
  public static func genresPaginated(page: Int) -> Self { genres.appending(.page).appending(page) }
  public static func findGenre(with id: Genre.ID) -> Self { genres.appending(id) }

  // MARK: - Platform
  public static let platforms = Self(String.platforms)
  public static let platformSearch = platforms.appending(.search)
  public static func platformsPaginated(page: Int) -> Self {
    platforms.appending(.page).appending(page)
  }
  public static func findPlatform(with id: Platform.ID) -> Self { platforms.appending(id) }

  public func apiVersion(_ version: APIVersion) -> Self {
    .init(String.v(version)).appending(fragments)
  }
}
