import Foundation

public struct RefreshTokensRequest: Codable, Equatable, Sendable {
  public let refreshToken: String

  public init(refreshToken: String) {
    self.refreshToken = refreshToken
  }
}
