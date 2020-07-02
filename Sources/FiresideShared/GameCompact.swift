import Foundation

public extension Game {
  struct Compact: Codable, Equatable, Identifiable, Hashable {
    public var id: UUID?
    public var name: String
    public var localizedNames: [LocalizedName]
    public var coverHash: String?
    public var platforms: [Platform]
    public var earliestReleaseDate: Date?

    public init(
      id: UUID?,
      name: String,
      localizedNames: [LocalizedName] = [],
      coverHash: String? = nil,
      platforms: [Platform] = [],
      earliestReleaseDate: Date? = nil
    ) {
      self.id = id
      self.name = name
      self.localizedNames = localizedNames
      self.coverHash = coverHash
      self.platforms = platforms
      self.earliestReleaseDate = earliestReleaseDate
    }
  }

}
