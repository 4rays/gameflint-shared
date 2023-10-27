import Foundation

public extension Game {
  struct Compact: Codable, Identifiable, Hashable, Expandable, Sendable {
    public var id: UUID
    public var name: String
    public var localizedNames: [Language: String]
    public var artwork: [LocalizedArtwork]?
    public var platforms: [String]?
    public var tags: [Language: [String]]?
    public var genres: [Language: [String]]?
    public var earliestReleaseDate: Date?

    public init(
      id: UUID,
      name: String,
      localizedNames: [Language: String] = [:],
      artwork: [LocalizedArtwork]? = nil,
      platforms: [String]? = nil,
      tags: [Language: [String]]? = nil,
      genres: [Language: [String]]? = nil,
      earliestReleaseDate: Date? = nil
    ) {
      self.id = id
      self.name = name
      self.localizedNames = localizedNames
      self.artwork = artwork
      self.platforms = platforms
      self.tags = tags
      self.genres = genres
      self.earliestReleaseDate = earliestReleaseDate
    }

    public func expanded() -> Game {
      .init(
        id: id,
        name: name,
        localizedNames: localizedNames,
        artwork: artwork
      )
    }
  }
}
