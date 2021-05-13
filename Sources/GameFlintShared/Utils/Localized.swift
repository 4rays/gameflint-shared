import Foundation

public enum Language: String, Hashable, Identifiable, CaseIterable, Codable {
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

extension Array where Element == LocalizedString {
  public mutating func set(
    _ name: String,
    for language: Language = .en
  ) {
    let localized = LocalizedString(name, language: language)

    if let index = firstIndex(where: { $0.language == language }) {
      self[index] = localized
    } else {
      append(localized)
    }
  }

  public mutating func insert(
    _ localized: LocalizedString
  ) {
    set(localized.value, for: localized.language)
  }
}
