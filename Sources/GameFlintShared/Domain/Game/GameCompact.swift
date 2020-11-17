import Foundation

public extension Game {
  struct Compact: Codable, Equatable, Identifiable, Hashable {
    public var id: UUID?
    public var name: String
    public var localizedNames: [LocalizedName]
    public var coverHash: String?
    public var platforms: [String]
    public var tags: [String]
    public var earliestReleaseDate: Date?

    public init(
      id: UUID?,
      name: String,
      localizedNames: [LocalizedName] = [],
      coverHash: String? = nil,
      platforms: [String] = [],
      tags: [String] = [],
      earliestReleaseDate: Date? = nil
    ) {
      self.id = id
      self.name = name
      self.localizedNames = localizedNames
      self.coverHash = coverHash
      self.platforms = platforms
      self.tags = tags
      self.earliestReleaseDate = earliestReleaseDate
    }

    public func expand() -> Game {
      .init(
        id: id,
        name: name,
        localizedNames: localizedNames,
        coverHash: coverHash
      )
    }
  }

}
