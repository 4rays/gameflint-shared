import Foundation

public struct ServerResponse: Codable, Equatable, Sendable {
  public var error: CodedError?
  public var success: Bool

  public init(error: CodedError? = nil) {
    self.error = error
    self.success = error == nil
  }
}
