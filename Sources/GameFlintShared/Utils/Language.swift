import Foundation

public enum Language: String, Hashable, Identifiable, CaseIterable, Codable, CodingKeyRepresentable {
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
  public var languageGrouped: [Language: [String]] {
    reduce([:]) { partialResult, dictionary in
      var newPartialResult = partialResult

      for key in dictionary.keys {
        newPartialResult[key] = newPartialResult[key] ?? []
        
        if let value = dictionary[key],
           newPartialResult[key]!.contains(value) == false {
          newPartialResult[key]!.append(value)
        }
      }

      return newPartialResult
    }
  }
}
