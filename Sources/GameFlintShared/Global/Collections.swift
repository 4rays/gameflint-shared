import Foundation

extension Sequence where Element: Hashable {
  @inlinable
  public func deduplicated() -> [Element] {
    var seen = Set<Element>()
    return filter { seen.insert($0).inserted }
  }
}

extension Sequence {
  @inlinable public func deduplicated<T>(
    on projection: (Element) throws -> T
  ) rethrows -> [Element] where T: Hashable  {
    var seen: Set<T> = []
    var result: [Element] = []
    for element in self {
      if seen.insert(try projection(element)).inserted {
        result.append(element)
      }
    }
    return result
  }

  @inlinable public func deduplicated<T>(
    by keyPath: KeyPath<Iterator.Element, T>
  ) -> [Iterator.Element] where T: Hashable {
    var seen = [T: Iterator.Element]()

    return filter { element in
      let key = element[keyPath: keyPath]

      if seen[key] == nil {
        seen[key] = element
        return true
      } else {
        return false
      }
    }
  }
}

public extension Collection where Index == Int {
  subscript(indexes: IndexSet) -> [Element] {
    return indexes.reduce([Element]()) { result, index in
      var newResult = result
      newResult.append(self[index])
      return newResult
    }
  }
}

public extension Optional where Wrapped: ExpressibleByArrayLiteral {
  var unwrapped: Wrapped {
    return self ?? []
  }
}

extension Collection where Self.Element: Equatable {
  @inlinable public func doesNotContain(_ element: Element) -> Bool {
    !contains(element)
  }
}

extension Collection where Self.Element: Hashable {
  @inlinable public func toSet() -> Set<Element> {
    Set(self)
  }
}
