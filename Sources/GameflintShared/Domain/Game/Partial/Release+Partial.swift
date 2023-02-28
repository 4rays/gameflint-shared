import Foundation

extension Release {
  public struct Partial: Codable, Hashable, Sendable {
    public var date: Release.Date?
    public var descriptions: [Language: String]
public var platforms: [Platform.Partial]

    public var regions: [Region]

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
  }
}
