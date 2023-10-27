import Foundation

extension Platform {
  public struct Partial: Codable, Hashable, Sendable {
    public var name: String
    public var abbreviation: String
    public var localizedNames: [Language: String]

    public init(
      name: String,
      localizedNames: [Language: String] = [:],
      abbreviation: String
    ) {
      self.name = name
      self.abbreviation = abbreviation
      self.localizedNames = localizedNames
    }
  }
}
