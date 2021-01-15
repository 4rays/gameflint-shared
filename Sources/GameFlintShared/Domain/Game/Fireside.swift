import Foundation

public struct Fireside: Codable, Equatable, Identifiable, Hashable {
  public var id: UUID
  public var firewood: Int
  public var createdAt: Date?
  public var updatedAt: Date?
  public var reviews: [Review]

  public init(
    id: UUID,
    firewood: Int,
    createdAt: Date? = nil,
    updatedAt: Date? = nil,
    reviews: [Review] = []
  ) {
    self.id = id
    self.firewood = firewood
    self.createdAt = createdAt
    self.updatedAt = updatedAt
    self.reviews = reviews
  }
}
