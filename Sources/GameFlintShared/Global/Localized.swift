import Foundation

public struct LocalizedName: Codable, Hashable, Equatable {
  public var language: String
  public var name: String
  
  public init(
    language: String,
    name: String
  ) {
    self.language = language
    self.name = name
  }
}

public struct LocalizedDescription: Codable, Hashable, Equatable {
  public var language: String
  public var description: String

  public init(
    language: String,
    description: String
  ) {
    self.language = language
    self.description = description
  }
}
