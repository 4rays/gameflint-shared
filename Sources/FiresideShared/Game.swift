import Foundation

public struct Game: Codable, Equatable, Identifiable, Hashable {
  public var id: UUID?
  public var name: String
  public var localizedNames: [LocalizedName]
  public fileprivate(set) var earliestReleaseDate: Date?
  public var releases: [Release] {
    didSet {
      updateEarliestReleaseDate()
    }
  }
  public var companies: [GameCompany]
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
    id: UUID? = nil,
    name: String,
    localizedNames: [LocalizedName] = [],
    releases: [Release] = [],
    companies: [GameCompany] = [],
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
  }
}

public extension Game {
  mutating func updateEarliestReleaseDate() {
    earliestReleaseDate = releases
      .filter { $0.date != nil }
      .sorted()
      .first?.date
  }
}


