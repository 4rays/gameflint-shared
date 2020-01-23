import Foundation

public struct LocalizedNamePayload: Codable, Hashable, Equatable {
  public var languageIdentifier: String
  public var name: String
}
