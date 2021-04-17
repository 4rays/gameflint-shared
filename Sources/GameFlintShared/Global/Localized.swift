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

@dynamicMemberLookup
public struct Localized<T> {
  public var value: T
  public var strings: NonEmptyArray<LocalizedString>

  public init?(
    _ value: T,
    strings: [LocalizedString]
  ) {
    guard let strings = NonEmptyArray<LocalizedString>(
      rawValue: strings
    ) else {
      return nil
    }

    self.value = value
    self.strings = strings
  }

  public init(
    _ value: T,
    string: LocalizedString
  ) {
    self.value = value
    self.strings = NonEmptyArray<LocalizedString>(rawValue: [string])!
  }

  public subscript<U>(dynamicMember keyPath: WritableKeyPath<T, U>) -> U {
    get { self.value[keyPath: keyPath] }
    set { self.value[keyPath: keyPath] = newValue }
  }
}

extension Localized: Identifiable where T: Identifiable {
  public var id: T.ID {
    value.id
  }
}

extension Localized: Codable, Hashable, Equatable
where T: Codable & Hashable {}
