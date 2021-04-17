import Foundation

public struct NilError: Error, CustomStringConvertible {
  public var description: String { return descriptionText }
  private let descriptionText: String

  public init(file: String, line: Int) {
    descriptionText = "Nil returned at "
      + (file as NSString).lastPathComponent + ":\(line)"
  }
}

extension Optional {
  public func unwrap(file: String = #file, line: Int = #line, error: Error? = nil) throws -> Wrapped {
    guard let unwrapped = self else { throw error ?? NilError(file: file, line: line) }
    return unwrapped
  }
}
