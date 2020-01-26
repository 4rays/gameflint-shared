import Foundation

public struct UserPayload: Codable, Equatable, Identifiable {
  public var id: UUID
  public var username: String
  public var isMod: Bool

  public init(id: UUID,
       username: String,
       isMod: Bool = false) {
    self.id = id
    self.username = username
    self.isMod = isMod
  }
}
