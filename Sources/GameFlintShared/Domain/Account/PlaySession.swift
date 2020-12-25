import Foundation

public struct PlaySession: Codable, Equatable, Hashable, Identifiable {
  public var id: UUID
  public var playthroughID: UUID
  public var playTime: Int?
  public var startedAt: Date
  public var endedAt: Date?
  public var description: String?
  public var createdAt: Date?
  public var updatedAt: Date?
  public var sets: [Set]

  public init(
    id: UUID,
    playthroughID: UUID,
    startedAt: Date,
    endedAt: Date? = nil,
    playTime: Int? = nil,
    description: String? = nil,
    sets: [Set] = [],
    createdAt: Date? = nil,
    updatedAt: Date? = nil
  ) {
    self.id = id
    self.playthroughID = playthroughID
    self.startedAt = startedAt
    self.endedAt = endedAt
    self.description = description
    self.playTime = playTime
    self.sets = sets
    self.createdAt = createdAt
    self.updatedAt = updatedAt
  }
}

public extension PlaySession {
  struct Set: Codable, Equatable, Hashable {
    public var startedAt: Date
    public var endedAt: Date?

    public init(startedAt: Date, endedAt: Date? = nil) {
      self.startedAt = startedAt
      self.endedAt = endedAt
    }

    public var isOngoing: Bool {
      endedAt == nil
    }

    public var duration: TimeInterval {
      (endedAt ?? Date()).timeIntervalSince(startedAt)
    }
  }
}
