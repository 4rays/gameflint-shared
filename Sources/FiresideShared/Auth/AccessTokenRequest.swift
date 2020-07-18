import Foundation

public struct AccessTokenRequest: Codable, Equatable {
  public let refreshToken: String

  public init(refreshToken: String) {
    self.refreshToken = refreshToken
  }
}
