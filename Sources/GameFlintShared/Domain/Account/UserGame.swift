import Foundation

public struct UserGame: Codable, Equatable, Hashable, Identifiable  {
  public var id: UUID
  public var gameID: UUID
  public var status: Status
  public var format: Format
  public var playStyle: PlayStyle
  public var inLibrary: Bool
  public var userPlayTime: Int?
  public private(set) var lastPlayedAt: Date?
  public private(set) var aggregatePlayTime: Int
  public var completionRate: Float?
  public var platform: Platform?
  public var gameInfo: Game.Compact?
  public var createdAt: Date?
  public var updatedAt: Date?

  public var playthroughs: [Playthrough]

  public init(
  id: UUID,
    gameID: UUID,
    status: Status = .interested,
    format: Format = .digital,
    playStyle: PlayStyle = .casual,
    inLibrary: Bool = false,
    userPlayTime: Int? = nil,
    lastPlayedAt: Date? = nil,
    aggregatePlayTime: Int = 0,
    completionRate: Float? = nil,
    platform: Platform? = nil,
    playthroughs: [Playthrough] = [],
    gameInfo: Game.Compact? = nil,
    createdAt: Date? = nil,
    updatedAt: Date? = nil
  ) {
    self.id = id
    self.gameID = gameID
    self.status = status
    self.userPlayTime = userPlayTime
    self.lastPlayedAt = lastPlayedAt
    self.aggregatePlayTime = aggregatePlayTime
    self.completionRate = completionRate
    self.format = format
    self.playStyle = playStyle
    self.inLibrary = inLibrary
    self.platform = platform
    self.gameInfo = gameInfo
    self.playthroughs = playthroughs
    self.createdAt = createdAt
    self.updatedAt = updatedAt
  }

  public func requirePlaythrough() throws -> Playthrough {
    guard let playthrough = playthroughs.first(where: { $0.isDefault })
    else {
      throw DataError.Data.missingDefaultPlaythrough
    }

    return playthrough
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
    case paused
    case cleared
    case abandoned
  }

  public enum PlayStyle: String, Codable, Equatable, CaseIterable {
    case casual
    case completionist
    case speedrunner
    case competitive
  }
}
