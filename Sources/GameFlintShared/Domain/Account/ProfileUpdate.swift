import Foundation

public struct ProfileUpdate: Codable, Hashable {
  public var username: String?
  public var displayName: String?
  public var avatarURL: String?
  public var regions: [Region]?

  public init(
    username: String? = nil,
    displayName: String? = nil,
    avatarURL: String? = nil,
    regions: [Region]? = nil
  ) {
    self.username = username
    self.displayName = displayName
    self.avatarURL = avatarURL
    self.regions = regions
  }
}
