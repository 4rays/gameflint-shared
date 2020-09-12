import Foundation

public struct UserGame: Codable, Equatable, Hashable, Identifiable  {
  public var id: UUID?
  public var gameID: Game.ID
  public var status: Status
  public var format: Format
  public var inLibrary: Bool
  public var userPlayTime: Int?
  public private(set) var aggregatePlayTime: Int
  public var platform: Platform?
  public var gameInfo: Game.Compact?
  public var createdAt: Date?
  public var updatedAt: Date?

  public var playthroughs: [Playthrough]

  public init(
    id: UUID? = nil,
    gameID: Game.ID,
    status: Status = .interested,
    format: Format = .digital,
    inLibrary: Bool = false,
    userPlayTime: Int? = nil,
    aggregatePlayTime: Int = 0,
    platform: Platform? = nil,
    playthroughs: [Playthrough] = [],
    gameInfo: Game.Compact? = nil,
    createdAt: Date? = nil
    updatedAt: Date? = nil
  ) {
    self.id = id
    self.gameID = gameID
    self.status = status
    self.userPlayTime = userPlayTime
    self.aggregatePlayTime = aggregatePlayTime
    self.format = format
    self.inLibrary = inLibrary
    self.platform = platform
    self.gameInfo = gameInfo
    self.playthroughs = playthroughs
    self.createdAt = createdAt
    self.updatedAt = updatedAt
  }
}

extension UserGame {
  public enum Format: String, Codable, Equatable, CaseIterable {
    case physical
    case digital
  }

  public enum Status: String, Codable, Equatable, CaseIterable {
    case interested
    case wishlisted
    case ready
    case playing
    case cleared
    case abandoned
  }
}
