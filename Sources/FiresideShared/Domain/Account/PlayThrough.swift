import Foundation

struct PlayThrough: Codable, Equatable, Hashable, Identifiable {
  public var id: UUID
  public var totalPlayTime: Int?
  public var completionRate: Float?
  public var userCreated: Bool
  public var status: Status
  public var description: String?

  public enum Status: String, Codable, Equatable, CaseIterable {
    case ongoing
    case completed
    case paused
    case abandoned
  }
}
