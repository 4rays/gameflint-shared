import Foundation

public struct VerifyPasswordTokenRequest: Codable, Equatable {
  public let token: String

  public init(token: String) {
    self.token = token
  }
}
