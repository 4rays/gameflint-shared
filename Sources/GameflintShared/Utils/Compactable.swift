public protocol Compactable {
  associatedtype Compact: Codable & Equatable & Sendable
  func compacted() -> Compact
}

public protocol Expandable {
  associatedtype Expanded: Codable & Equatable & Sendable
  func expanded() -> Expanded
}
