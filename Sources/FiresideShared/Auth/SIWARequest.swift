import Foundation

public struct SIWARequest {
  public var firstName: String?
  public var lastName: String?
  public var email: String?
  public var token: String

  public init(
    firstName: String? = nil,
    lastName: String? = nil,
    email: String? = nil,
    token: String
  ) {
    self.firstName = firstName
    self.lastName = lastName
    self.email = email
    self.token = token
  }
}
