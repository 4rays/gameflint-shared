import Foundation

public struct UserGame: Codable, Equatable, Hashable, Identifiable  {
  public var gameID: Game.ID
  public var status: Status
  public var format: Format
  public var inLibrary: Bool
  public var totalPlayTimeMinutes: Int?
  public var completionRate: Float?
  public var platform: Platform?

  public init(
    game: Game.ID,
    status: Status = .interested,
    format: Format = .digital,
    inLibrary: Bool = false,
    totalPlayTimeMinutes: Int? = nil,
    completionRate: Float? = nil,
    platform: Platform? = nil
  ) {
    self.gameID = game
    self.status = status
    self.totalPlayTimeMinutes = totalPlayTimeMinutes
    self.format = format
    self.inLibrary = inLibrary
    self.completionRate = completionRate
    self.platform = platform
  }

  public var id: UUID? {
    gameID
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

extension UserGame {
  public struct Expanded: Codable, Equatable, Hashable, Identifiable {
    public var value: UserGame
    public var game: Game.Compact

    public init(value: UserGame, game: Game.Compact) {
      self.value = value
      self.game = game
    }

    public var id: UUID? {
      game.id
    }
  }
}

