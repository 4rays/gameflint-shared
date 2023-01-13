import Foundation

protocol DateUnit: Codable, Hashable, Sendable {
  var value: Int { get set }
  init(wrappedValue: Int)
}

extension DateUnit {
  public init(from decoder: Decoder) throws {
    self.init(wrappedValue: try Int(from: decoder))
  }

  public func encode(to encoder: Encoder) throws {
    try value.encode(to: encoder)
  }
}

protocol OptionalDateUnit: Codable, Hashable, OptionalCodingWrapper {
  var value: Int? { get set }
  init(wrappedValue: Int?)
}

extension OptionalDateUnit {
  public init(from decoder: Decoder) throws {
    self.init(wrappedValue: try? Int(from: decoder))
  }

  public func encode(to encoder: Encoder) throws {
    if let value = value {
        try value.encode(to: encoder)
    } else {
        try Optional<Int>.none.encode(to: encoder)
    }
  }
}

@propertyWrapper
public struct Year: DateUnit {
  var value: Int
  static var range: ClosedRange<Int> = 1500...3000

  public init(wrappedValue: Int = 2020) {
    self.value = clamp(wrappedValue, range: Self.range)
  }

  public var wrappedValue: Int {
    get { value }
    set { value = clamp(newValue, range: Self.range) }
  }
}

@propertyWrapper
public struct Quarter: OptionalDateUnit, Sendable {
  var value: Int?
  static var range: ClosedRange<Int> = 1...4

  public init(wrappedValue: Int? = 1) {
    self.value = wrappedValue.map { clamp($0, range: Self.range) }
  }

  public var wrappedValue: Int? {
    get { value }
    set { value = newValue.map { clamp($0, range: Self.range) } }
  }
}

@propertyWrapper
public struct Month: OptionalDateUnit, Sendable {
  var value: Int?
  static var range: ClosedRange<Int> = 1...12

  public init(wrappedValue: Int? = 1) {
    self.value = wrappedValue.map { clamp($0, range: Self.range) }
  }

  public var wrappedValue: Int? {
    get { value }
    set { value = newValue.map { clamp($0, range: Self.range) } }
  }
}

@propertyWrapper
public struct Day: OptionalDateUnit, Sendable {
  var value: Int?
  static var range: ClosedRange<Int> = 1...31

  public init(wrappedValue: Int? = 1) {
    self.value = wrappedValue.map { clamp($0, range: Self.range) }
  }

  public var wrappedValue: Int? {
    get { value }
    set { value = newValue.map { clamp($0, range: Self.range) } }
  }
}

public func clamp<T: Comparable>(_ value: T, range: ClosedRange<T>) -> T {
  return min(max(range.lowerBound, value), range.upperBound)
}

//MARK: - OptionalCodingWrapper

public protocol OptionalCodingWrapper {
    associatedtype WrappedType: ExpressibleByNilLiteral
  var wrappedValue: WrappedType { get }
  init(wrappedValue: WrappedType)
}

extension KeyedDecodingContainer {
  public func decode<T>(
    _ type: T.Type,
    forKey key: KeyedDecodingContainer<K>.Key
  ) throws -> T
  where T: Decodable,
        T: OptionalCodingWrapper {
    return try decodeIfPresent(T.self, forKey: key) ?? T(wrappedValue: nil)
  }
}

extension KeyedEncodingContainer {
  public mutating func encode<T>(
    _ value: T,
    forKey key: KeyedEncodingContainer<K>.Key
  ) throws where T: Encodable, T: OptionalCodingWrapper {

    // Warning: use of Mirror.
    let mirror = Mirror(reflecting: value.wrappedValue)

    guard mirror.displayStyle != .optional || !mirror.children.isEmpty else {
      return
    }

    try encodeIfPresent(value, forKey: key)
  }
}
