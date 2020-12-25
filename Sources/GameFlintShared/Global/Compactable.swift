public protocol Compactable {
  associatedtype Compact: Codable, Equatable
  func compacted() -> Compact
}

public protocol Expandable {
  associatedtype Expanded: Codable, Equatable
  func expanded() -> Expanded
}
