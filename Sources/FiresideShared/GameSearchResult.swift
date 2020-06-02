import Foundation

public struct GameSearchResult: Codable, Equatable, Identifiable, Hashable {
  public var id: UUID
  public var name: String
  public var coverURL: String?
  public var description: String?

  public init(
    id: UUID,
    name: String,
    coverURL: String? = nil,
    description: String? = nil
  ) {
    self.id = id
    self.name = name
    self.coverURL = coverURL
    self.description = description
  }
}
