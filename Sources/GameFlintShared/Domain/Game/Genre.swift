import Foundation

public struct Genre: Identifiable, Codable, Equatable, Hashable {
  public var id: UUID
  public var slug: String
  public var name: String
  public var localizedNames: [LocalizedString]?

  public init(
    id: UUID,
    slug: String,
    name: String,
    localizedNames: [LocalizedString]? = nil
  ) {
    self.id = id
    self.slug = slug
    self.name = name
    self.localizedNames = localizedNames
  }

  public init(
    _ name: String
  ) {
    self.id = .init()
    self.name = name
    self.slug = name.slugify()
    self.localizedNames = [LocalizedString(name, language: .en)]
  }
}
