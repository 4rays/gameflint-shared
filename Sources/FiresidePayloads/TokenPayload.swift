import Foundation

public struct TokenPayload: Codable {
  public var access: String

  public init(access: String) {
    self.access = access
  }
}
