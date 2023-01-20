import Foundation

public struct ResetPasswordRequest: Codable, Equatable, Sendable {
  public let email: String

  public init(email: String) {
    self.email = email
  }
}
