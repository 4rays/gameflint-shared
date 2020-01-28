import Foundation

public struct TokenPayload: Codable, Equatable {
  public var access: String

  public init(access: String) {
    self.access = access
  }
}
