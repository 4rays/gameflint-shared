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
  public var companies: [GameCompany.Compact]?
  public var ageRatings: [AgeRating]?
  public var descriptions: [Language: String]
  public var artwork: [LocalizedArtwork]?
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
    companies: [GameCompany.Compact]? = nil,
    ageRatings: [AgeRating]? = nil,
    descriptions: [Language: String] = [:],
    artwork: [LocalizedArtwork]? = nil,
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
    self.companies = companies
    self.ageRatings = ageRatings
    self.descriptions = descriptions
    self.artwork = artwork
    self.genres = genres
    self.tags = tags
    self.links = links
    self.metadata = metadata
    self.fireside = fireside
    self.createdAt = createdAt
    self.updatedAt = updatedAt

    if !releases.unwrapped.isEmpty {
      updateEarliestReleaseDate()
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

  var platforms: [Platform] {
    releases
      .unwrapped
      .flatMap(\.platforms)
      .deduplicated()
  }

  var firstCover: LocalizedArtwork? {
    artwork?.first(where: { $0.type == .cover })
  }

  var firstIcon: LocalizedArtwork? {
    artwork?.first(where: { $0.type == .icon })
  }

  var screenshots: [LocalizedArtwork]? {
    artwork?.filter { $0.type == .screenshot }
  }
}

extension Game: Compactable {
  public func compacted() -> Compact {
    .init(
      id: id,
      name: name,
      localizedNames: localizedNames,
      artwork: artwork?.filter { $0.type != .screenshot },
      tags: tags?.map(\.localizedNames).languageGrouped,
      genres: genres?.map(\.localizedNames).languageGrouped,
      earliestReleaseDate: earliestReleaseDate
    )
  }

  public var japaneseName: String {
    localizedNames[.jp] ?? name
  }
}

