import Foundation

public struct Release: Codable, Hashable, Equatable {
  public var id: UUID?
  public var isTentative: Bool
  public var date: ReleaseDate?
  public var platform: Platform
  public var regions: [Region]
  public var createdAt: Date?
  public var updatedAt: Date?

  public init(
    id: UUID? = nil,
    isTentative: Bool,
    platform: Platform,
    regions: [Region],
    date: ReleaseDate? = nil,
    createdAt: Date? = nil,
    updatedAt: Date? = nil
  ) {
    self.id = id
    self.isTentative = isTentative
    self.date = date
    self.platform = platform
    self.regions = regions
    self.createdAt = createdAt
    self.updatedAt = updatedAt
  }
}
