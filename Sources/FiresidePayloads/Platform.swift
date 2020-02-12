import Foundation

public struct PlatformPayload: Codable, Equatable, Hashable {
  public var id: UUID?
  public var name: String
  public var abbreviation: String
  public var localizedNames: [LocalizedNamePayload]
  public var createdAt: Date?
  public var updatedAt: Date?

  public init(
    id: UUID? = nil,
    name: String,
    abbreviation: String,
    localizedNames: [LocalizedNamePayload] = [],
    createdAt: Date? = nil,
    updatedAt: Date? = nil
  ) {
    self.id = id
    self.name = name
    self.abbreviation = abbreviation
    self.localizedNames = localizedNames
    self.createdAt = createdAt
    self.updatedAt = updatedAt
  }
}
