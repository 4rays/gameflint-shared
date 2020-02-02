import Foundation

public struct LocalizedNamePayload: Codable, Hashable, Equatable {
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
