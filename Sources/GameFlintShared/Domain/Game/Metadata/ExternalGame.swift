import Foundation

public struct ExternalGame: Codable, Hashable {
  public var externalID: String
  public var igdbID: Int
  public var category: Int
  public var url: URL?

  public var service: ExternalService? {
    .init(category)
  }

  public enum CodingKeys: String, CodingKey {
    case externalID = "uid"
    case igdbID = "game"
    case category
    case url
  }
}
