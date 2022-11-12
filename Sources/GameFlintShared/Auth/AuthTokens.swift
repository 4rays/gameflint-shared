import Foundation

public struct AuthTokens: Codable, Hashable {
  public var access: String
  public var refresh: String

  public init(
    access: String,
    refresh: String
  ) {
    self.access = access
    self.refresh = refresh
  }
}
