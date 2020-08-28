import Foundation

public struct UserGame: Codable, Equatable, Hashable, Identifiable  {
  public var gameID: Game.ID
  public var status: Status
  public var format: Format
  public var inLibrary: Bool
  public var totalPlayTime: Int?
  public var platform: Platform?
  public var gameInfo: Game.Compact?

  public init(
    gameID: Game.ID,
    status: Status = .interested,
    format: Format = .digital,
    inLibrary: Bool = false,
    totalPlayTime: Int? = nil,
    platform: Platform? = nil,
    gameInfo: Game.Compact? = nil
  ) {
    self.gameID = gameID
    self.status = status
    self.totalPlayTime = totalPlayTime
    self.format = format
    self.inLibrary = inLibrary
    self.platform = platform
    self.gameInfo = gameInfo
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
