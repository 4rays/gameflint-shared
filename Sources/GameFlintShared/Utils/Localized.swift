import Foundation

public enum Language: String, Hashable, Identifiable, CaseIterable, Codable {
  case en
  case jp

  public var id: String {
    rawValue
  }
}

public struct LocalizedString: Codable, Hashable {
  public var value: String
  public var language: Language

  public init(
    _ value: String,
    language: Language = .en
  ) {
    self.value = value
    self.language = language
  }
}

extension Collection where Element == LocalizedString {
  public func value(
    _ language: Language = .en
  ) -> String? {
    first(where: {
      $0.language == language
    })?.value
  }

  public func filter(
    by language: Language = .en
  ) -> [LocalizedString] {
    filter {
      $0.language == language
    }
  }
}
