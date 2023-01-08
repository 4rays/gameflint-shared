import Foundation

public struct Playthrough: Codable, Hashable, Identifiable, Sendable {
  public var id: UUID
  public var userPlayTime: Int?
  public private(set) var aggregatePlayTime: Int
  public var startedAt: Date?
  public var endedAt: Date?

  public var completionRate: Float?
  public var userCreated: Bool
  public var status: Status
  public var description: String?

  public var sessions: [PlaySession]?

  public var createdAt: Date?
  public var updatedAt: Date?

  public enum Status: String, Codable, Equatable, CaseIterable {
    case active
    case completed
    case paused
    case inactive
  }

  public init(
    id: UUID,
    userPlayTime: Int? = nil,
    aggregatePlayTime: Int = 0,
    startedAt: Date? = nil,
    endedAt: Date? = nil,
    completionRate: Float? = nil,
    userCreated: Bool,
    status: Playthrough.Status,
    description: String? = nil,
    sessions: [PlaySession]? = nil,
    createdAt: Date? = nil,
    updatedAt: Date? = nil
  ) {
    self.id = id
    self.userPlayTime = userPlayTime
    self.aggregatePlayTime = aggregatePlayTime
    self.startedAt = startedAt
    self.endedAt = endedAt
    self.completionRate = completionRate
    self.userCreated = userCreated
    self.status = status
    self.description = description
    self.sessions = sessions
    self.createdAt = createdAt
    self.updatedAt = updatedAt
  }

  public var isDefault: Bool {
    return !userCreated
  }
}
