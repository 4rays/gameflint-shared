import Foundation

public struct Flare: Codable, Hashable, Sendable {
  public var gameID: UUID
  public var userID: UUID
  public var createdAt: Date

  public init(
    gameID: UUID,
    userID: UUID,
    createdAt: Date
  ) {
    self.gameID = gameID
    self.userID = userID
    self.createdAt = createdAt
  }
}

