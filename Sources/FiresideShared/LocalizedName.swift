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

extension LocalizedName: Identifiable {
  public var id: String {
    language + "_" + name
  }
}
