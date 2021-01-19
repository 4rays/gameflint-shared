import Foundation

public struct Fireside: Codable, Equatable, Identifiable, Hashable {
  public var id: UUID
  public var burned: Int
  public var burning: Int
  public var total: Int
  public var createdAt: Date?
  public var updatedAt: Date?
  public var reviews: [Review]?

  public init(
    id: UUID,
    burned: Int = 0,
    burning: Int = 0,
    total: Int = 0,
    createdAt: Date? = nil,
    updatedAt: Date? = nil,
    reviews: [Review]? = nil
  ) {
    self.id = id
    self.burned = burned
    self.burning = burning
    self.total = total
    self.createdAt = createdAt
    self.updatedAt = updatedAt
    self.reviews = reviews
  }
}
