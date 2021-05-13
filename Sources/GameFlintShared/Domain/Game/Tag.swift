import Foundation

public struct Tag: Identifiable, Codable, Equatable, Hashable {
  public var id: UUID
  public var slug: String
  public var name: String
  public var localizedNames: [LocalizedString]?
  public var createdAt: Date?
  public var updatedAt: Date?

  public init(
    id: UUID,
    slug: String,
    name: String,
    localizedNames: [LocalizedString]? = nil,
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
    self.localizedNames = [LocalizedString(name, language: .en)]
    self.createdAt = Date()
    self.updatedAt = nil
  }
}
