import Foundation

public struct LocalizedNamePayload: Codable, Hashable, Equatable {
  public var languageIdentifier: String
  public var name: String

  public init(languageIdentifier: String,
              name: String) {
    self.languageIdentifier = languageIdentifier
    self.name = name
  }
}
