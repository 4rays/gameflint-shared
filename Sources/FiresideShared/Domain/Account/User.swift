import Foundation

public struct User: Codable, Equatable, Identifiable {
  public var id: UUID
  public var username: String
  public var isAdmin: Bool
  
  public init(
    id: UUID,
    username: String,
    isAdmin: Bool = false
  ) {
    self.id = id
    self.username = username
    self.isAdmin = isAdmin
  }
}
