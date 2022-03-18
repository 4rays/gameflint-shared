import Foundation

public extension Game {
  struct Compact: Codable, Equatable, Identifiable, Hashable, Expandable {
    public var id: UUID
    public var name: String
    public var localizedNames: [Language: String]
    public var posterID: String?
    public var platforms: [String]?
    public var tags: [String]?
    public var genres: [String]?
    public var earliestReleaseDate: Date?

    public init(
      id: UUID,
      name: String,
      localizedNames: [Language: String] = [:],
      posterID: String? = nil,
      platforms: [String]? = nil,
      tags: [String]? = nil,
      genres: [String]? = nil,
      earliestReleaseDate: Date? = nil
    ) {
      self.id = id
      self.name = name
      self.localizedNames = localizedNames
      self.posterID = posterID
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
        posterID: posterID
      )
    }
  }
}
