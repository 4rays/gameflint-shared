import Foundation

public struct PlaySession: Codable, Equatable, Hashable, Identifiable {
  public var id: UUID?
  public var playTime: Int?
  public var startedAt: Date
  public var endedAt: Date?
  public var description: String?
  public var pauseDates: [Date]
  public var resumeDates: [Date]
  public var createdAt: Date?
  public var updatedAt: Date?

  public init(
    id: UUID? = nil,
    startedAt: Date,
    endedAt: Date? = nil,
    playTime: Int? = nil,
    description: String? = nil,
    createdAt: Date? = nil,
    updatedAt: Date? = nil
  ) {
    self.id = id
    self.startedAt = startedAt
    self.endedAt = endedAt
    self.description = description
    self.createdAt = createdAt
    self.updatedAt = updatedAt
    self.pauseDates = []
    self.resumeDates = []
  }
}
