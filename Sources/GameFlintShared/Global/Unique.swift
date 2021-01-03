extension Sequence where Element: Hashable {
  @inlinable
  public func deduplicated() -> [Element] {
    var seen = Set<Element>()
    return filter { seen.insert($0).inserted }
  }
}

extension Sequence {
  @inlinable
  func uniqued<Subject: Hashable>(
    on projection: (Element) throws -> Subject
  ) rethrows -> [Element] {
    var seen: Set<Subject> = []
    var result: [Element] = []
    for element in self {
      if seen.insert(try projection(element)).inserted {
        result.append(element)
      }
    }
    return result
  }
}
