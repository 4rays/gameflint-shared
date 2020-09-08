import Foundation

public struct CreatePlaySessionRequest: Codable, Equatable {
  public init(
    userGameID: UUID,
    playthroughID: UUID?,
    session: PlaySession
  ) {
    self.userGameID = userGameID
    self.playthroughID = playthroughID
    self.session = session
  }

  public let userGameID: UUID
  public let playthroughID: UUID?
  public let session: PlaySession
}
