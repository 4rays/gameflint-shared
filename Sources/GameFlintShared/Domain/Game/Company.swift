import Foundation

public struct Company: Codable, Hashable, Equatable, Identifiable {
  public var id: UUID
  public var name: String
  public var localizedNames: [LocalizedString]
  public var website: String?
  public var country: Int?
  public var createdAt: Date?
  public var updatedAt: Date?

  public init(
    id: UUID,
    name: String,
    localizedNames: [LocalizedString] = [],
    website: String? = nil,
    country: Int? = nil,
    createdAt: Date? = nil,
    updatedAt: Date? = nil
  ) {
    self.id = id
    self.name = name
    self.localizedNames = localizedNames
    self.website = website
    self.country = country
    self.createdAt = createdAt
    self.updatedAt = updatedAt
  }
}

public extension Company {
  struct Patch: Codable, Equatable, Hashable {
    public var id: UUID?
    public var name: String
    public var localizedNames: [LocalizedString]
    public var website: String?
    public var country: Int?

    public init(
      id: UUID? = nil,
      name: String,
      localizedNames: [LocalizedString] = [],
      website: String? = nil,
      country: Int? = nil
    ) {
      self.id = id
      self.name = name
      self.localizedNames = localizedNames
      self.website = website
      self.country = country
    }

    var full: Company {
      .init(
        id: id ?? .init(),
        name: name,
        localizedNames: localizedNames,
        website: website,
        country: country
      )
    }
  }

  var patch: Patch {
    .init(
      id: id,
      name: name,
      localizedNames: localizedNames,
      website: website,
      country: country
    )
  }
}
