import Foundation

extension Metadata.IGDB {
  public struct ExternalGame: Codable, Hashable, Sendable {
    public var externalID: String
    public var igdbID: Int
    public var category: Int
    public var url: String?

    public var service: ExternalService? {
      switch category {
      case 1: .steam
      case 5: .gog
      case 11: .xbox
      case 13: .appStore
      case 14: .twitch
      case 15: .playStore
      case 26: .epic
      case 28: .oculus
      case 36: .psn
      default: nil
      }
    }

    public enum CodingKeys: String, CodingKey {
      case externalID = "uid"
      case igdbID = "game"
      case category
      case url
    }
  }
}
