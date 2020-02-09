import Foundation

public struct ReleasePayload: Codable, Hashable, Equatable {
  public var isTentative: Bool
  public var human: String?
  public var day: Int?
  public var month: Int?
  public var quarter: Int?
  public var year: Int?
  public var platform: PlatformPayload
  public var regions: [Region]
  public var createdAt: Date?
  public var updatedAt: Date?

  public init(
    isTentative: Bool,
    platform: PlatformPayload,
    regions: [Region],
    human: String? = nil,
    day: Int? = nil,
    month: Int? = nil,
    quarter: Int? = nil,
    year: Int? = nil,
    createdAt: Date? = nil,
    updatedAt: Date? = nil
  ) {
    self.isTentative = isTentative
    self.human = human
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
