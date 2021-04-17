import Foundation

public struct Release: Codable, Hashable, Equatable, Comparable, Identifiable {
  public var id: UUID
  public var isTentative: Bool
  public var humanDate: ReleaseDate? {
    didSet {
      date = try? humanDate?.toRawDate()
    }
  }
  public private(set) var date: Date?
  public var timeZone: String?
  public var description: LocalizedString?
  public var platforms: [Platform]
  public var regions: [Region]
  public var createdAt: Date?
  public var updatedAt: Date?

  public init(
    id: UUID,
    isTentative: Bool = false,
    platforms: [Platform] = [],
    regions: [Region] = [],
    humanDate: ReleaseDate? = nil,
    timeZone: String? = nil,
    description: LocalizedString? = nil,
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
    self.description = description
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

public extension Release {
  struct Patch: Codable, Equatable, Hashable {
    public var id: UUID?
    public var isTentative: Bool
    public var humanDate: ReleaseDate?
    public var timeZone: String?
    public var description: LocalizedString?
    public var platforms: [Platform]
    public var regions: [Region]
    public var createdAt: Date?
    public var updatedAt: Date?
  }
}
