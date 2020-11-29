import Foundation

public struct Review:  Codable, Equatable, Identifiable, Hashable {
  public var id: UUID?
  public var text: String
  public var rating: Rating
  public var profileID: Profile.ID
  public var releaseID: Release.ID
  public var createdAt: Date?
  public var updatedAt: Date?

  public init(
    id: UUID? = nil,
    text: String,
    rating: Rating,
    profileID: UUID,
    releaseID: UUID,
    createdAt: Date? = nil,
    updatedAt: Date? = nil
  ) {
    self.id = id
    self.text = text
    self.rating = rating
    self.profileID = profileID
    self.releaseID = releaseID
    self.createdAt = createdAt
    self.updatedAt = updatedAt
  }
}
