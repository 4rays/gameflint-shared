import Foundation

public struct ResetPasswordRequest: Codable, Equatable {
  public let email: String

  public init(email: String) {
    self.email = email
  }
}
