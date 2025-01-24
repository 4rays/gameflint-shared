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

  enum CodingKeys: String, CodingKey {
    case id
    case officialDate
    case tentativeDate
    case platforms
    case regions
    case descriptions
    case createdAt
    case updatedAt
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

  public var officialDate: Foundation.Date? {
    switch date {
    case .official(let date): date
    default: nil
    }
  }

  public var tentativeDate: ReleaseDate? {
    switch date {
    case .tentative(let date): date
    default: nil
    }
  }

  public var isTentative: Bool {
    tentativeDate != nil
  }
}

extension Release.Date {
  public static func < (lhs: Self, rhs: Self) -> Bool {
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
  public static func < (lhs: Self, rhs: Self) -> Bool {
    switch (lhs.date, rhs.date) {
    case let (.some(lhd), .some(rhd)): lhd < rhd
    case (.none, .some): true
    default: false
    }
  }
}

extension Release {
  public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(id, forKey: .id)
    try container.encode(platforms, forKey: .platforms)
    try container.encode(regions, forKey: .regions)
    try container.encode(descriptions, forKey: .descriptions)
    try container.encode(createdAt, forKey: .createdAt)
    try container.encode(updatedAt, forKey: .updatedAt)

    switch date {
    case .official(let date):
      try container.encode(date, forKey: .officialDate)

    case .tentative(let date):
      try container.encode(date, forKey: .tentativeDate)

    case .none:
      break
    }
  }

  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decode(UUID.self, forKey: .id)
    platforms = try container.decode([Platform].self, forKey: .platforms)
    regions = try container.decode([Region].self, forKey: .regions)
    descriptions = try container.decode([Language: String].self, forKey: .descriptions)
    createdAt = try container.decodeIfPresent(Foundation.Date.self, forKey: .createdAt)
    updatedAt = try container.decodeIfPresent(Foundation.Date.self, forKey: .updatedAt)

    if let officialDate = try container.decodeIfPresent(
      Foundation.Date.self,
      forKey: .officialDate
    ) {
      date = .official(officialDate)
    } else if let tentativeDate = try container.decodeIfPresent(
      ReleaseDate.self,
      forKey: .tentativeDate
    ) {
      date = .tentative(tentativeDate)
    } else {
      date = nil
    }
  }
}
