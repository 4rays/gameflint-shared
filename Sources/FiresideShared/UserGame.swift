import Foundation

public struct UserGame: Codable, Equatable, Hashable, Identifiable  {
  public struct State: Codable, Equatable, Hashable  {
    public var playState: PlayState
    public var totalPlayTimeMinutes: Int?

    public init(_ playState: PlayState = .interested, totalPlayTimeMinutes: Int? = nil) {
      self.playState = playState
      self.totalPlayTimeMinutes = totalPlayTimeMinutes
    }
  }

  public var game: Game
  public var state: State

  public init(game: Game, state: UserGame.State) {
    self.game = game
    self.state = state
  }

  public var id: UUID? {
    game.id
  }
}
