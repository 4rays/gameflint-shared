import Foundation

public extension Game {
  struct SearchHit: Codable, Identifiable, Hashable, Expandable, Sendable {
    public var id: UUID
    public var name: String
    public var japaneseName: String
    public var artwork: [LocalizedArtwork]?
    public var platforms: [String]?
    public var tags: [Language: [String]]?
    public var genres: [Language: [String]]?
    public var releasedAt: Date?
    public var releasedAtText: String?

    public var output: Game.Compact {
      .init(
        id: id,
        name: name,
        localizedNames: [
          .en: name,
          .jp: japaneseName
        ],
        artwork: artwork,
        platforms: platforms,
        tags: tags,
        genres: genres,
        earliestReleaseDate: releasedAt
      )
    }

    public init(with game: Game) {
      self.id = game.id
      self.name = game.name
      self.japaneseName = game.japaneseName
      self.artwork = game.artwork?.filter { $0.type != .screenshot }
      self.platforms = game.platforms.map(\.abbreviation)
      self.tags = (game.tags?.map(\.localizedNames)).map(groupByKey)
      self.genres = (game.genres?.map(\.localizedNames)).map(groupByKey)
      self.releasedAt = game.earliestReleaseDate
      self.releasedAtText = game.earliestReleaseDate.map {
        ReleaseDate.formatter.string(from: $0)
      }
    }

    public func expanded() -> Game {
      output.expanded()
    }
  }
}


