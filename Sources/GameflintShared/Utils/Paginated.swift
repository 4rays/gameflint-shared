import Foundation

public struct Paginated<T>: Codable, Hashable, Sendable
where T: Codable & Equatable & Hashable & Sendable {
  public let items: [T]
  public let metadata: Metadata

  public init(
    items: [T],
    metadata: Metadata
  ) {
    self.items = items
    self.metadata = metadata
  }
}

extension Paginated {
  public struct Metadata: Codable, Hashable, Sendable {
    public let page: Int
    public let per: Int
    public let total: Int

    public init(page: Int, per: Int, total: Int) {
      self.page = page
      self.per = per
      self.total = total
    }
  }
}
