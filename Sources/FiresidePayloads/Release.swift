import Foundation

public struct ReleasePayload: Codable, Hashable, Equatable {
  public var id: UUID?
  public var isTentative: Bool
  public var date: ReleaseDate?
  public var platform: PlatformPayload
  public var regions: [Region]
  public var createdAt: Date?
  public var updatedAt: Date?

  public init(
    id: UUID? = nil,
    isTentative: Bool,
    platform: PlatformPayload,
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
