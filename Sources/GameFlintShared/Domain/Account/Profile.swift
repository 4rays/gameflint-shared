import Foundation

public struct Profile: Codable, Equatable, Identifiable, Hashable  {
  public var id: UUID
  public var username: String
  public var firewood: Int
  public var displayName: String?
  public var avatarURL: String?
  public var createdAt: Date?
  public var updatedAt: Date?

  public init(
    id: UUID,
    username: String,
    firewood: Int = 0,
    displayName: String? = nil,
    avatarURL: String? = nil,
    createdAt: Date? = nil,
    updatedAt: Date? = nil
  ) {
    self.id = id
    self.username = username
    self.firewood = firewood
    self.displayName = displayName
    self.avatarURL = avatarURL
    self.createdAt = createdAt
    self.updatedAt = updatedAt
  }

}
