import Foundation

extension Game {
  public struct Partial: Codable, Identifiable, Hashable, Sendable {
    public var name: String
    public var localizedNames: [Language: String]
    public var announcedAt: Date?
    public var releases: [Release.Partial]?
    public var companies: [GameCompany.Partial]?
    public var ageRatings: [AgeRating]?
    public var descriptions: [Language: String]
    public var artwork: [LocalizedArtwork]?
    public var genres: [Genre.Partial]?
    public var tags: [Tag.Partial]?
    public var links: [String]?
    public var metadata: Metadata?

    public var id: String { name }

    public init(
      name: String,
      localizedNames: [Language: String] = [:],
      announcedAt: Date? = nil,
      releases: [Release.Partial]? = nil,
      companies: [GameCompany.Partial]? = nil,
      ageRatings: [AgeRating]? = nil,
      descriptions: [Language: String] = [:],
      artwork: [LocalizedArtwork]? = nil,
      genres: [Genre.Partial]? = nil,
      tags: [Tag.Partial]? = nil,
      links: [String]? = nil,
      metadata: Metadata? = nil
    ) {
      self.name = name
      self.localizedNames = localizedNames
      self.announcedAt = announcedAt
      self.releases = releases
      self.companies = companies
      self.ageRatings = ageRatings
      self.descriptions = descriptions
      self.artwork = artwork
      self.genres = genres
      self.tags = tags
      self.links = links
      self.metadata = metadata
    }
  }
}

extension Game.Partial {
  public var getEarliestReleaseDate: Date? {
    releases.flatMap {
      $0.filter { $0.officialDate != nil }
        .sorted()
        .first?.officialDate
    }
  }

  public var platforms: [Platform.Partial] {
    releases
      .unwrapped
      .flatMap(\.platforms)
      .deduplicated()
  }
}
