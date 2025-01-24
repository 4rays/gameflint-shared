import Foundation

extension Release {
  public struct Partial: Codable, Hashable, Sendable, Comparable {
    public var date: Release.Date?
    public var descriptions: [Language: String]
    public var platforms: [Platform.Partial]
    public var regions: [Region]

    enum CodingKeys: String, CodingKey {
      case officialDate
      case tentativeDate
      case platforms
      case regions
      case descriptions
    }

    public init(
      date: Release.Date? = nil,
      descriptions: [Language: String] = [:],
      platforms: [Platform.Partial] = [],
      regions: [Region] = []
    ) {
      self.date = date
      self.descriptions = descriptions
      self.platforms = platforms
      self.regions = regions
    }

    public init(
      platforms: [Platform.Partial] = [],
      regions: [Region] = [],
      isTentative: Bool,
      date: ReleaseDate? = nil,
      descriptions: [Language: String] = [:]
    ) {
      self.platforms = platforms
      self.regions = regions
      self.descriptions = descriptions

      if isTentative,
        let tentativeDate = date
      {
        self.date = .tentative(tentativeDate)
      } else if let officialDate = try? date?.toUTCDate() {
        self.date = .official(officialDate)
      }
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
}

extension Release.Partial {
  public static func < (lhs: Self, rhs: Self) -> Bool {
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

extension Release.Partial {
  public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(platforms, forKey: .platforms)
    try container.encode(regions, forKey: .regions)
    try container.encode(descriptions, forKey: .descriptions)

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
    platforms = try container.decode([Platform.Partial].self, forKey: .platforms)
    regions = try container.decode([Region].self, forKey: .regions)
    descriptions = try container.decode([Language: String].self, forKey: .descriptions)

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
