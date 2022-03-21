import Foundation

public struct Company: Codable, Hashable, Equatable, Identifiable {
  public var id: UUID
  public var name: String
  public var localizedNames: [Language: String]
  public var links: [String]?
  public var country: Int?
  public var createdAt: Date?
  public var updatedAt: Date?

  public init(
    id: UUID,
    name: String,
    localizedNames: [Language: String] = [:],
    links: [String]? = nil,
    country: Int? = nil,
    createdAt: Date? = nil,
    updatedAt: Date? = nil
  ) {
    self.id = id
    self.name = name
    self.localizedNames = localizedNames
    self.links = links
    self.country = country
    self.createdAt = createdAt
    self.updatedAt = updatedAt
  }
}
