import Foundation

public struct RefreshTokensRequest: Codable, Equatable {
  public let refreshToken: String

  public init(refreshToken: String) {
    self.refreshToken = refreshToken
  }
}
