import Foundation

public struct UserGame: Codable, Equatable, Hashable, Identifiable  {
  public struct State: Codable, Equatable, Hashable  {
    public var status: Status
    public var format: Format
    public var inLibrary: Bool
    public var totalPlayTimeMinutes: Int?
    public var completionRate: Float?

    public init(
      _ status: Status = .interested,
      format: Format = .digital,
      inLibrary: Bool = false,
      totalPlayTimeMinutes: Int? = nil,
      completionRate: Float? = nil
    ) {
      self.status = status
      self.totalPlayTimeMinutes = totalPlayTimeMinutes
      self.format = format
      self.inLibrary = inLibrary
      self.completionRate = completionRate
    }
  }

  public var game: Game
  public var state: State
  public var platform: Platform?

  public init(
    game: Game,
    state: UserGame.State,
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

extension UserGame {
  public enum Format: String, Codable, Equatable, CaseIterable {
    case physical
    case digital
  }

  public enum Status: String, Codable, Equatable, CaseIterable {
    case interested
    case ready
    case playing
    case abandoned
    case cleared
  }
}
