import Foundation

public struct Tag: Identifiable, Codable, Hashable, Sendable {
  public var id: UUID
  public var slug: String
  public var name: String
  public var localizedNames: [Language: String]
  public var createdAt: Date?
  public var updatedAt: Date?

  public init(
    id: UUID,
    slug: String,
    name: String,
    localizedNames: [Language: String] = [:],
    createdAt: Date? = nil,
    updatedAt: Date? = nil
  ) {
    self.id = id
    self.slug = slug
    self.name = name
    self.localizedNames = localizedNames
    self.createdAt = createdAt
    self.updatedAt = updatedAt
  }

  public init(
    _ name: String
  ) {
    self.id = .init()
    self.name = name
    self.slug = name.slugify()
    self.localizedNames = [.en: name]
    self.createdAt = Date()
    self.updatedAt = nil
  }
}
