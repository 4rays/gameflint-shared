import Foundation

public struct GameRow: Codable, Equatable, Identifiable, Hashable {
  public var id: UUID
  public var name: String
  public var coverHash: String?
  public var description: String?
  public var earliestReleaseDate: Date?

  public init(
    id: UUID,
    name: String,
    coverHash: String? = nil,
    description: String? = nil,
    earliestReleaseDate: Date? = nil
  ) {
    self.id = id
    self.name = name
    self.coverHash = coverHash
    self.description = description
    self.earliestReleaseDate = earliestReleaseDate
  }
}
