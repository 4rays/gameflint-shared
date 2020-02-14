import Foundation

public func throwing<T>(_ value: T?, error: Error) throws -> T {
  if let value = value {
    return value
  } else {
    throw error
  }
}
