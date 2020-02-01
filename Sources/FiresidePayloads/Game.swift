import Foundation

public struct GamePayload: Codable, Equatable, Identifiable {
  public var id: UUID?
  public var name: String
  public var localizedNames: [LocalizedNamePayload]?
  public var releases: [ReleasePayload]?
  public var companies: [CompanyPayload]?
  public var ageRatings: [AgeRating]?
  public var openCriticMetadata: OpenCriticMetadata?
  public var metacriticMetadata: MetacriticMetadata?
  public var igdbMetadata: IGDBMetadata?
  public var coverHash: String?
  public var genres: [String]?
  public var tags: [String]?
  public var links: [String]?
  public var createdAt: Date?
  public var updatedAt: Date?

  public init(
    id: UUID? = nil,
    name: String,
    localizedNames: [LocalizedNamePayload]? = nil,
    releases: [ReleasePayload]? = nil,
    companies: [CompanyPayload]? = nil,
    ageRatings: [AgeRating]? = nil,
    openCriticMetadata: OpenCriticMetadata? = nil,
    metacriticMetadata: MetacriticMetadata? = nil,
    igdbMetadata: IGDBMetadata? = nil,
    coverHash: String? = nil,
    genres: [String]? = nil,
    tags: [String]? = nil,
    links: [String]? = nil,
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
  }
}
