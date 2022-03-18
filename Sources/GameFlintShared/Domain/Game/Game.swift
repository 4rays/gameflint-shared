import Foundation

public struct Game: Codable, Equatable, Identifiable, Hashable {
  public var id: UUID
  public var name: String
  public var localizedNames: [Language: String]
  public fileprivate(set) var earliestReleaseDate: Date?
  public var announcedAt: Date?
  public var releases: [Release]? {
    didSet { updateEarliestReleaseDate() }
  }
  public var platforms: [String]?
  public var companies: [GameCompany.Compact]?
  public var ageRatings: [AgeRating]?
  public var descriptions: [Language: String]
  public var posterID: String?
  public var genres: [Genre]?
  public var tags: [Tag]?
  public var links: [String]?
  public var metadata: Metadata?
  public var fireside: Fireside?
  public var createdAt: Date?
  public var updatedAt: Date?

  public init(
    id: UUID,
    name: String,
    earliestReleaseDate: Date? = nil,
    localizedNames: [Language: String] = [:],
    announcedAt: Date? = nil,
    releases: [Release]? = nil,
    platforms: [String]? = nil,
    companies: [GameCompany.Compact]? = nil,
    ageRatings: [AgeRating]? = nil,
    descriptions: [Language: String] = [:],
    posterID: String? = nil,
    genres: [Genre]? = nil,
    tags: [Tag]? = nil,
    links: [String]? = nil,
    metadata: Metadata? = nil,
    fireside: Fireside? = nil,
    createdAt: Date? = nil,
    updatedAt: Date? = nil
  ) {
    self.id = id
    self.name = name
    self.earliestReleaseDate = earliestReleaseDate
    self.localizedNames = localizedNames
    self.announcedAt = announcedAt
    self.releases = releases
    self.platforms = platforms
    self.companies = companies
    self.ageRatings = ageRatings
    self.descriptions = descriptions
    self.posterID = posterID
    self.genres = genres
    self.tags = tags
    self.links = links
    self.metadata = metadata
    self.fireside = fireside
    self.createdAt = createdAt
    self.updatedAt = updatedAt

    if !releases.unwrapped.isEmpty {
      updateEarliestReleaseDate()
      updatePlatforms()
    }
  }
}
 
public extension Game {
  mutating func updateEarliestReleaseDate() {
    earliestReleaseDate = releases.flatMap {
      $0.filter { $0.date != nil }
      .sorted()
      .first?.date
    }
  }

  mutating func updatePlatforms() {
    let releasePlatforms = releases
      .unwrapped
      .flatMap(\.platforms)
      .deduplicated()

    if releasePlatforms.isEmpty { return }

    platforms = releasePlatforms.map(\.abbreviation)
  }
}

extension Game: Compactable {
  public func compacted() -> Compact {
    .init(
      id: id,
      name: name,
      localizedNames: localizedNames,
      posterID: posterID,
      platforms: platforms,
      tags: tags?.map(\.name),
      genres: genres?.map(\.name),
      earliestReleaseDate: earliestReleaseDate
    )
  }

  public var japaneseName: String {
    localizedNames[.jp] ?? name
  }
}

