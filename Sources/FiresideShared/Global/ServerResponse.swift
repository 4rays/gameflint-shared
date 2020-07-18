import Foundation

public struct ServerResponse: Codable, Equatable {
  public var error: Bool
  public var message: String

  public init(error: Bool, message: String) {
    self.error = error
    self.message = message
  }
}
