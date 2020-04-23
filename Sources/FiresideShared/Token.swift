import Foundation

public struct Token: Codable, Equatable {
  public var access: String

  public init(access: String) {
    self.access = access
  }
}
