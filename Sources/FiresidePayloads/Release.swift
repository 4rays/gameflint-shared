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
  public var localizedNames: Set<LocalizedNamePayload>?
  public var regions: Set<String>
  public var createdAt: Date?
  public var updatedAt: Date?

  public init(isTentative: Bool,
              human: String?,
              date: Date?,
              day: Int?,
              month: Int?,
              quarter: Int?,
              year: Int?,
              platform: PlatformPayload,
              localizedNames: Set<LocalizedNamePayload>?,
              regions: Set<String>,
              createdAt: Date?,
              updatedAt: Date?) {
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
