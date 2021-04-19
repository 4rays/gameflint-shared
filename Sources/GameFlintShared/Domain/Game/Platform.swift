import Foundation

public struct Platform: Codable, Equatable, Hashable, Identifiable {
  public var id: UUID
  public var name: String
  public var abbreviation: String
  public var localizedNames: [LocalizedString]?
  public var createdAt: Date?
  public var updatedAt: Date?

  public init(
    id: UUID,
    name: String,
    localizedNames: [LocalizedString]? = nil,
    abbreviation: String,
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
