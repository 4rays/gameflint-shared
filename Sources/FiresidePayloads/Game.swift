import Foundation

public struct GamePayload: Codable, Equatable, Identifiable {
  public var id: UUID?
  public var name: String
  public var localizedNames: Set<LocalizedNamePayload>?

  public init(
    id: UUID? = nil,
    name: String,
    localizedNames: Set<LocalizedNamePayload> = []
  ) {
    self.id = id
    self.name = name
    self.localizedNames = localizedNames
  }
}
