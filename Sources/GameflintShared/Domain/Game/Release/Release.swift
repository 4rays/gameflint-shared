import Foundation

public struct Release: Codable, Hashable, Comparable, Identifiable, Sendable {
  public var id: UUID
  public var isTentative: Bool
  public private(set) var date: Date?
  public var timeZone: String?
  public var descriptions: [Language: String]
  public var platforms: [Platform]
  public var regions: [Region]
  public var createdAt: Date?
  public var updatedAt: Date?

  public var humanDate: ReleaseDate? {
    didSet {
      date = try? humanDate?.toRawDate()
    }
  }

  public init(
    id: UUID,
    isTentative: Bool = false,
    platforms: [Platform] = [],
    regions: [Region] = [],
    humanDate: ReleaseDate? = nil,
    timeZone: String? = nil,
    descriptions: [Language: String] = [:],
    createdAt: Date? = nil,
    updatedAt: Date? = nil
  ) {
    self.id = id
    self.isTentative = isTentative
    self.humanDate = humanDate
    self.date = try? humanDate?.toRawDate()
    self.timeZone = timeZone
    self.platforms = platforms
    self.regions = regions
    self.createdAt = createdAt
    self.updatedAt = updatedAt
    self.descriptions = descriptions
  }
}

extension Release {
  public static func < (lhs: Release, rhs: Release) -> Bool {
    switch (lhs.humanDate, rhs.humanDate) {
    case let (.some(lhd), .some(rhd)):
      return lhd < rhd
    default:
      return false
    }
  }
}
