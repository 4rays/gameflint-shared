import Foundation

public struct Game: Codable, Equatable, Identifiable, Hashable {
  public var id: UUID
  public var name: String
  public var localizedNames: [LocalizedName]
  public fileprivate(set) var earliestReleaseDate: Date?
  public var releases: [Release] {
    didSet { updateEarliestReleaseDate() }
  }
  public var platforms: [String]
  public var companies: [GameCompany.Compact]
  public var ageRatings: [AgeRating]
  public var openCriticMetadata: OpenCriticMetadata?
  public var metacriticMetadata: MetacriticMetadata?
  public var igdbMetadata: IGDBMetadata?
  public var coverHash: String?
  public var genres: [String]
  public var tags: [String]
  public var links: [String]
  public var createdAt: Date?
  public var updatedAt: Date?

  public init(
    id: UUID,
    name: String,
    localizedNames: [LocalizedName] = [],
    releases: [Release] = [],
    platforms: [String] = [],
    companies: [GameCompany.Compact] = [],
    ageRatings: [AgeRating] = [],
    openCriticMetadata: OpenCriticMetadata? = nil,
    metacriticMetadata: MetacriticMetadata? = nil,
    igdbMetadata: IGDBMetadata? = nil,
    coverHash: String? = nil,
    genres: [String] = [],
    tags: [String] = [],
    links: [String] = [],
    createdAt: Date? = nil,
    updatedAt: Date? = nil
  ) {
    self.id = id
    self.name = name
    self.localizedNames = localizedNames
    self.releases = releases
    self.platforms = platforms
    self.companies = companies
    self.ageRatings = ageRatings
    self.openCriticMetadata = openCriticMetadata
    self.metacriticMetadata = metacriticMetadata
    self.igdbMetadata = igdbMetadata
    self.coverHash = coverHash
    self.genres = genres
    self.tags = tags
    self.links = links
    self.createdAt = createdAt
    self.updatedAt = updatedAt

    updateEarliestReleaseDate()
    updatePlatforms()
  }
}

public extension Game {
  mutating func updateEarliestReleaseDate() {
    earliestReleaseDate = releases
      .filter { $0.date != nil }
      .sorted()
      .first?.date
  }

  mutating func updatePlatforms() {
    let releasePlatforms = releases
      .flatMap(\.platforms)
      .deduped()

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
      coverHash: coverHash,
      platforms: platforms,
      tags: tags + genres,
      earliestReleaseDate: earliestReleaseDate
    )
  }

  public var japaneseName: String {
    localizedNames
      .first(where: { $0.language == "jp" })?.name ?? name
  }
}

