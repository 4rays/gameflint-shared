import Foundation

public enum Language:
  String,
  Hashable,
  Identifiable,
  CaseIterable,
  Codable,
  CodingKeyRepresentable,
  Sendable {
  case en
  case jp

  public var id: String {
    rawValue
  }

  public var description: String {
    switch self {
    case .en:
      return "English"
    case .jp:
      return "日本語"
    }
  }
}

extension Array where Element == Dictionary<Language, String> {
  @available(*, deprecated, message: "Use groupByKey(:) instead.")
  public var languageGrouped: [Language: [String]] {
    groupByKey(self)
  }
}
