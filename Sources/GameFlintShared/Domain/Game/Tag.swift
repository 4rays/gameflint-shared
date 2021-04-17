import Foundation

public struct Tag: Identifiable, Codable, Equatable, Hashable {
  public var id: UUID
  public var name: String

  public init(
    id: UUID,
    name: String
  ) {
    self.id = id
    self.name = name
  }
}

public extension Tag {
  struct Patch: Codable, Equatable, Hashable {
    public var name: String
    public var localizedNames: [LocalizedString]

    public init(
      name: String,
      localizedNames: [LocalizedString]
    ) {
      self.name = name
      self.localizedNames = localizedNames
    }
  }
}
