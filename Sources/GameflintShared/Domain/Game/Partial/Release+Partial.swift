import Foundation 

extension Release {
  public struct Partial: Codable, Hashable, Sendable {
    public var date: Release.Date?
    public var descriptions: [Language: String]
    public var platforms: [Platform]
    public var regions: [Region]

    public init(
      date: Release.Date? = nil,
      descriptions: [Language: String] = [:],
      platforms: [Platform] = [],
      regions: [Region] = []
    ) {
      self.date = date
      self.descriptions = descriptions
      self.platforms = platforms
      self.regions = regions
    }
  }
}
