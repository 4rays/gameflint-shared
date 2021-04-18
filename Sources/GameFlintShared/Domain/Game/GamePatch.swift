import Foundation

public extension Game {
  struct Patch: Codable, Equatable, Hashable {
    public var id: UUID?
    public var name: String
    public var localizedNames: [LocalizedString]
    public var announcedAt: Date?
    public var releases: [Release]?
    public var companies: [GameCompany.Patch]?
    public var ageRatings: [AgeRating]?
    public var description: [LocalizedString]?
    public var coverHash: String?
    public var genres: [Genre.Patch]?
    public var tags: [Tag.Patch]?
    public var links: [String]?
    public var metadata: Metadata?

    public init(
      id: UUID? = nil,
      name: String,
      localizedNames: [LocalizedString] = [],
      announcedAt: Date? = nil,
      releases: [Release]? = nil,
      companies: [GameCompany.Patch]? = nil,
      ageRatings: [AgeRating]? = nil,
      description: [LocalizedString]? = nil,
      coverHash: String? = nil,
      genres: [Genre.Patch]? = nil,
      tags: [Tag.Patch]? = nil,
      links: [String]? = nil,
      metadata: Metadata? = nil
    ) {
      self.id = id
      self.name = name
      self.localizedNames = localizedNames
      self.announcedAt = announcedAt
      self.releases = releases
      self.companies = companies
      self.ageRatings = ageRatings
      self.description = description
      self.coverHash = coverHash
      self.genres = genres
      self.tags = tags
      self.links = links
      self.metadata = metadata
    }
  }
}
