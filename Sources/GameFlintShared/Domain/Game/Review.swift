import Foundation

public struct Review: Codable, Identifiable, Hashable, Sendable {
  public var id: UUID
  public var text: String
  public var rating: Rating
  public var profileID: UUID
  public var releaseID: UUID
  public var language: Language
  public var createdAt: Date?
  public var updatedAt: Date?

  public init(
    id: UUID,
    text: String,
    rating: Rating,
    profileID: UUID,
    releaseID: UUID,
    language: Language = .en,
    createdAt: Date? = nil,
    updatedAt: Date? = nil
  ) {
    self.id = id
    self.text = text
    self.rating = rating
    self.profileID = profileID
    self.releaseID = releaseID
    self.language = language
    self.createdAt = createdAt
    self.updatedAt = updatedAt
  }
}
