import Foundation

public struct Genre: Identifiable, Codable, Equatable, Hashable {
  public var id: UUID
  public var slug: String
  public var name: String

  public init(
    id: UUID,
    slug: String,
    name: String
  ) {
    self.id = id
    self.slug = slug
    self.name = name
  }
}

public extension Genre {
  struct Patch: Codable, Equatable, Hashable {
    public var id: UUID? = nil
    public var slug: String
    public var localizedNames: NonEmptyArray<LocalizedString>

    public init(
      id: UUID? = nil,
      slug: String,
      localizedNames: NonEmptyArray<LocalizedString>
    ) {
      self.id = id
      self.slug = slug
      self.localizedNames = localizedNames
    }

    public init(
      _ value: String
    ) {
      self.id = nil
      self.slug = 
    }
  }
}
