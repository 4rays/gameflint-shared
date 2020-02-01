import Foundation

public struct GamePayload: Codable, Equatable, Identifiable {
  public var id: UUID?
  public var name: String
  public var localizedNames: Set<LocalizedNamePayload>?
  public var releases: Set<ReleasePayload>?
  public var companies: Set<CompanyPayload>?
  public var ageRatings: Set<AgeRating>?
  public var openCriticMetadata: OpenCriticMetadata?
  public var metacriticMetadata: MetacriticMetadata?
  public var igdbMetadata: IGDBMetadata?
  public var coverHash: String?
  public var genres: Set<String>?
  public var tags: Set<String>?
  public var links: Set<String>?
  public var createdAt: Date?
  public var updatedAt: Date?

  public init(id: UUID?,
              name: String,
              localizedNames: Set<LocalizedNamePayload>? = nil,
              releases: Set<ReleasePayload>? = nil,
              companies: Set<CompanyPayload>? = nil,
              ageRatings: Set<AgeRating>? = nil,
              openCriticMetadata: OpenCriticMetadata? = nil,
              metacriticMetadata: MetacriticMetadata? = nil,
              igdbMetadata: IGDBMetadata? = nil,
              coverHash: String? = nil,
              genres: Set<String>? = nil,
              tags: Set<String>? = nil,
              links: Set<String>? = nil,
              createdAt: Date? = nil,
              updatedAt: Date? = nil) {
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
