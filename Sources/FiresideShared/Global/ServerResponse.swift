import Foundation

public struct ServerResponse: Codable, Equatable {
  public var error: ResponseError?
  public var success: Bool

  public init(error: ResponseError? = nil) {
    self.error = error
    self.success = error == nil
  }
}

public struct ResponseError: Codable, Equatable, Hashable {
  public var code: Code
  public var message: String

  public init(_ message: String) {
    self.code = .genericError
    self.message = message
  }

  public init(_ code: Code) {
    self.code = code
    self.message = code.description
  }
}

public extension ResponseError {
  enum Code: Int, Codable, Equatable, Hashable {
    case genericError = 900

    public var description: String {
      switch self {
      case .genericError:
        return "Something went wrong and we're not quite sure what or how."
      }
    }
  }
}


