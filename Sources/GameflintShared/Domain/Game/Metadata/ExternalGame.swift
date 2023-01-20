import Foundation

extension Metadata.IGDB {
  public struct ExternalGame: Codable, Hashable, Sendable {
    public var externalID: String
    public var igdbID: Int
    public var category: Int
    public var url: URL?

    public var service: ExternalService? {
      switch category {
      case 1: return .steam
      case 5: return .gog
      case 11: return .xbox
      case 13: return .appStore
      case 14: return .twitch
      case 15: return .playStore
      case 26: return .epic
      case 28: return .oculus
      case 36: return .psn
      default: return nil
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
