import Foundation

public extension Metadata {
  struct IGDB: Codable, Equatable, Hashable {
    public var url: String
    public var id: Int
    public var coverHash: String?
    public var updatedAt: Date
    public var aggregatedRating: Double?

    public init(
      url: String,
      id: Int,
      updatedAt: Date,
      coverHash: String? = nil,
      aggregatedRating: Double? = nil
    ) {
      self.url = url
      self.id = id
      self.coverHash = coverHash
      self.updatedAt = updatedAt
      self.aggregatedRating = aggregatedRating
    }
  }
}
