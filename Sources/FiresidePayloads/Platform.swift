import Foundation

public struct PlatformPayload: Codable, Equatable, Hashable {
  public var name: String
  public var abbreviation: String?
  public var createdAt: Date?
  public var updatedAt: Date?

  public init(
    name: String,
    abbreviation: String? = nil,
    createdAt: Date? = nil,
    updatedAt: Date? = nil
  ) {
    self.name = name
    self.abbreviation = abbreviation
    self.createdAt = createdAt
    self.updatedAt = updatedAt
  }
}
