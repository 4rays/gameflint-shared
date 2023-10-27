import Foundation

public struct SignInResponse: Codable, Hashable, Sendable {
  public var token: AuthTokens
  public var profile: Profile

  public init(
    token: AuthTokens,
    profile: Profile
  ) {
    self.token = token
    self.profile = profile
  }
}

