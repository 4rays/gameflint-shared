import Foundation

public struct SignUpRequest: Codable, Equatable, Sendable {
  public var username: String
  public var email: String
  public var password: String

  public init(
    username: String,
    email: String,
    password: String
  ) {
    self.username = username
    self.email = email
    self.password = password
  }
}
