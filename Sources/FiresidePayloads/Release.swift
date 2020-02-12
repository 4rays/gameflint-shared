import Foundation

public struct ReleasePayload: Codable, Hashable, Equatable {
  public var id: UUID?
  public var isTentative: Bool
  public var day: Int?
  public var month: Int?
  public var quarter: Int?
  public var year: Int?
  public var platform: PlatformPayload
  public var regions: [Region]
  public var createdAt: Date?
  public var updatedAt: Date?

  public init(
    id: UUID? = nil,
    isTentative: Bool,
    platform: PlatformPayload,
    regions: [Region],
    day: Int? = nil,
    month: Int? = nil,
    quarter: Int? = nil,
    year: Int? = nil,
    createdAt: Date? = nil,
    updatedAt: Date? = nil
  ) {
    self.id = id
    self.isTentative = isTentative
    self.day = day
    self.month = month
    self.quarter = quarter
    self.year = year
    self.platform = platform
    self.regions = regions
    self.createdAt = createdAt
    self.updatedAt = updatedAt
  }
}
