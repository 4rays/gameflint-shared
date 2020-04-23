import Foundation

public struct UpdateUserGame: Codable, Equatable, Hashable {
  public var gameID: UUID
  public var state: UserGame.State?

  public init(
    gameID: UUID,
    playState: UserGame.State?
  ) {
    self.gameID = gameID
    self.state = playState
  }
}
