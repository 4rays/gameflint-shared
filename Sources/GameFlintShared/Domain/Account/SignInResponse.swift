import Foundation

public struct SignInResponse: Codable, Equatable, Hashable {
  public var token: AccessToken
  public var profile: Profile

  public init(
    token: AccessToken,
    profile: Profile
  ) {
    self.token = token
    self.profile = profile
  }
}

