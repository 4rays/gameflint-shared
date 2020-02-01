import Foundation

public struct IGDBMetadata: Codable, Equatable {
  public var url: String
  public var id: String
  public var coverHash: String
  public var updatedAt: Date
  public var aggregatedRating: Double?
  
  public init(url: String,
              id: String,
              coverHash: String,
              updatedAt: Date,
              aggregatedRating: Double?) {
    self.url = url
    self.id = id
    self.coverHash = coverHash
    self.updatedAt = updatedAt
    self.aggregatedRating = aggregatedRating
  }
}

