import Foundation

public struct ChangePasswordRequest: Codable, Equatable {
  public let password: String
  public let passwordConfirmation: String
  public let passwordToken: String

  public init(password: String, passwordConfirmation: String, passwordToken: String) {
    self.password = password
    self.passwordConfirmation = passwordConfirmation
    self.passwordToken = passwordToken
  }
}
