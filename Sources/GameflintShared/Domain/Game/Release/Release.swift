import Foundation

public struct Release: Codable, Hashable, Comparable, Identifiable, Sendable {
  public var id: UUID
  public var date: Date?
  public var descriptions: [Language: String]
  public var platforms: [Platform]
  public var regions: [Region]
  public var createdAt: Foundation.Date?
  public var updatedAt: Foundation.Date?

  public enum Date: Codable, Hashable, Sendable, Comparable {
    case official(Foundation.Date)
    case tentative(ReleaseDate)
  }

  public init(
    id: UUID,
    platforms: [Platform] = [],
    regions: [Region] = [],
    date: Date? = nil,
    descriptions: [Language: String] = [:],
    createdAt: Foundation.Date? = nil,
    updatedAt: Foundation.Date? = nil
  ) {
    self.id = id
    self.date = date
    self.platforms = platforms
    self.regions = regions
    self.createdAt = createdAt
    self.updatedAt = updatedAt
    self.descriptions = descriptions
  }

  public init(
    id: UUID,
    platforms: [Platform] = [],
    regions: [Region] = [],
    isTentative: Bool,
    date: ReleaseDate? = nil,
    descriptions: [Language: String] = [:],
    createdAt: Foundation.Date? = nil,
    updatedAt: Foundation.Date? = nil
  ) {
    self.id = id
    self.platforms = platforms
    self.regions = regions
    self.createdAt = createdAt
    self.updatedAt = updatedAt
    self.descriptions = descriptions

    if isTentative,
      let tentativeDate = date {
      self.date = .tentative(tentativeDate)
    } else if let officialDate = try? date?.toUTCDate() {
      self.date = .official(officialDate)
    }
  }

  public var officialDate: Foundation.Date? {
    switch date {
    case .official(let date):
      return date

    default:
      return nil
    }
  }

  public var tentativeDate: ReleaseDate? {
    switch date {
    case .tentative(let date):
      return date

    default:
      return nil
    }
  }

  public var isTentative: Bool {
    tentativeDate != nil
  }
}

extension Release.Date {
  public static func < (lhs: Release.Date, rhs: Release.Date) -> Bool {
    switch (lhs, rhs) {
    case let (.official(lhsDate), .official(rhsDate)):
      return lhsDate < rhsDate

    case let (.tentative(lhsDate), .tentative(rhsDate)):
      return lhsDate < rhsDate
    
    case (.tentative, .official):
      return true

    case (.official, .tentative):
      return false
    }
  }
}

extension Release {
  public static func < (lhs: Release, rhs: Release) -> Bool {
    switch (lhs.date, rhs.date) {
    case let (.some(lhd), .some(rhd)):
      return lhd < rhd

    case (.none, .some):
      return true

    default:
      return false
    }
  }
}
