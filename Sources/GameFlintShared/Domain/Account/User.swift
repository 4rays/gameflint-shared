import Foundation

public struct User: Codable, Identifiable, Hashable, Sendable {
  public var id: UUID
  public var isAdmin: Bool
  public var email: String
  public var givenName: String?
  public var familyName: String?
  public var createdAt: Date?
  public var updatedAt: Date?
  public var profile: Profile?

  public init(
    id: UUID,
    isAdmin: Bool = false,
    email: String,
    givenName: String? = nil,
    familyName: String? = nil,
    profile: Profile? = nil,
    createdAt: Date? = nil,
    updatedAt: Date? = nil
  ) {
    self.id = id
    self.isAdmin = isAdmin
    self.email = email
    self.givenName = givenName
    self.familyName = familyName
    self.profile = profile
    self.createdAt = createdAt
    self.updatedAt = updatedAt
  }
}
