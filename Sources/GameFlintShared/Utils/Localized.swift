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
