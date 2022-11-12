import Foundation

public extension Metadata {
  struct IGDB: Codable, Hashable {
    public var url: String
    public var id: Int
    public var cover: String?
    public var updatedAt: Date
    public var aggregatedRating: Double?

    public init(
      url: String,
      id: Int,
      updatedAt: Date,
      cover: String? = nil,
      aggregatedRating: Double? = nil
    ) {
      self.url = url
      self.id = id
      self.cover = cover
      self.updatedAt = updatedAt
      self.aggregatedRating = aggregatedRating
    }
  }
}
