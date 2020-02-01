import Foundation

public struct ReleasePayload: Codable, Hashable, Equatable {
  public var isTentative: Bool
  public var human: String?
  public var date: Date?
  public var day: Int?
  public var month: Int?
  public var quarter: Int?
  public var year: Int?
  public var platform: PlatformPayload
  public var localizedNames: [LocalizedNamePayload]?
  public var regions: [String]
  public var createdAt: Date?
  public var updatedAt: Date?
  
  public init(
    isTentative: Bool,
    platform: PlatformPayload,
    regions: [String],
    human: String? = nil,
    date: Date? = nil,
    day: Int? = nil,
    month: Int? = nil,
    quarter: Int? = nil,
    year: Int? = nil,
    localizedNames: [LocalizedNamePayload]? = nil,
    createdAt: Date? = nil,
    updatedAt: Date? = nil
  ) {
    self.isTentative = isTentative
    self.human = human
    self.date = date
    self.day = day
    self.month = month
    self.quarter = quarter
    self.year = year
    self.platform = platform
    self.localizedNames = localizedNames
    self.regions = regions
    self.createdAt = createdAt
    self.updatedAt = updatedAt
  }
}
