import Foundation

public struct UpdateUserGame: Codable, Equatable, Hashable {
  public var gameID: Game.ID
  public var state: UserGame.State?
  public var platformID: Platform.ID?

  public init(
    gameID: Game.ID,
    playState: UserGame.State?,
    platformID: Platform.ID? = nil
  ) {
    self.gameID = gameID
    self.state = playState
    self.platformID = platformID
  }
}
