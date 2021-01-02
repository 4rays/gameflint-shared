import Foundation

public extension Game {
  struct SearchHit: Codable, Equatable, Identifiable, Hashable, Expandable {
    public var id: UUID
    public var name: String
    public var japaneseName: String
    public var coverHash: String?
    public var platforms: [String]
    public var tags: [String]
    public var releasedAt: Date?
    public var releasedAtText: String?

    public var output: Game.Compact {
      .init(
        id: id,
        name: name,
        localizedNames: [
          .init(language: "en", name: name),
          .init(language: "jp", name: japaneseName)
        ],
        coverHash: coverHash,
        platforms: platforms,
        tags: tags,
        earliestReleaseDate: releasedAt
      )
    }

    public init(with game: Game) {
      self.id = game.id
      self.name = game.name
      self.japaneseName = game.japaneseName
      self.coverHash = game.coverHash
      self.platforms = game.platforms
      self.tags = game.tags
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


