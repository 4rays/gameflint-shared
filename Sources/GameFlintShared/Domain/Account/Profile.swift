import Foundation

public struct Profile: Codable, Equatable, Identifiable, Hashable {
  public var id: UUID
  public var username: String
  public var pellets: Int
  public var displayName: String?
  public var avatarURL: String?
  public var regions: [Region]
  public var createdAt: Date?
  public var updatedAt: Date?

  public init(
    id: UUID,
    username: String,
    pellets: Int = 0,
    displayName: String? = nil,
    avatarURL: String? = nil,
    regions: [Region] = [],
    createdAt: Date? = nil,
    updatedAt: Date? = nil
  ) {
    self.id = id
    self.username = username
    self.pellets = pellets
    self.displayName = displayName
    self.avatarURL = avatarURL
    self.regions = regions
    self.createdAt = createdAt
    self.updatedAt = updatedAt
  }
}
