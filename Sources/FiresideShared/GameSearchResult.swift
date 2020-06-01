import Foundation

public struct GameSearchResult: Codable, Equatable, Identifiable, Hashable {
  public var id: UUID
  public var name: String
  public var coverURL: String?
  public var description: String?
}
