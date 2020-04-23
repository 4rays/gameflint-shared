import Foundation

public struct UpdateUserGame: Codable, Equatable, Hashable {
  public var gameID: UUID
  public var playState: PlayState?

  public init(
    gameID: UUID,
    playState: PlayState?
  ) {
    self.gameID = gameID
    self.playState = playState
  }
}
