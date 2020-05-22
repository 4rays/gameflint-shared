import Foundation

public struct Release: Codable, Hashable, Equatable {
  public var id: UUID?
  public var isTentative: Bool
  public var humanDate: ReleaseDate?
  public var date: Date?
  public var platform: Platform
  public var regions: [Region]
  public var createdAt: Date?
  public var updatedAt: Date?

  public init(
    id: UUID? = nil,
    isTentative: Bool,
    platform: Platform,
    regions: [Region],
    humanDate: ReleaseDate? = nil,
    date: Date? = nil,
    createdAt: Date? = nil,
    updatedAt: Date? = nil
  ) {
    self.id = id
    self.isTentative = isTentative
    self.humanDate = humanDate
    self.date = date
    self.platform = platform
    self.regions = regions
    self.createdAt = createdAt
    self.updatedAt = updatedAt
  }
}
