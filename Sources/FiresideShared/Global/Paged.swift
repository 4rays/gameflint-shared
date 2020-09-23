import Foundation

public struct Paged<T>: Codable where T: Codable {
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

extension Paged {
  public struct Metadata: Codable, Equatable, Hashable {
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

