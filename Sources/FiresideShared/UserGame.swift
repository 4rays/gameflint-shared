import Foundation

public struct UserGame: Codable, Equatable, Hashable, Identifiable  {
  public struct State: Codable, Equatable, Hashable  {
    public var playState: PlayState
    public var totalPlayTimeMinutes: Int?

    public init(
      _ playState: PlayState = .interested,
      totalPlayTimeMinutes: Int? = nil
    ) {
      self.playState = playState
      self.totalPlayTimeMinutes = totalPlayTimeMinutes
    }
  }

  public var game: Game
  public var state: State
  public var platform: Platform?

  public init(
    game: Game,
    state: UserGame.State
    platform: Platform? = nil
  ) {
    self.game = game
    self.state = state
    self.platform = platform
  }

  public var id: UUID? {
    game.id
  }
}
