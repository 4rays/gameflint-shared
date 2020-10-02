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
    self.code = .internalServerError
    self.message = message
  }

  public init(_ code: Code) {
    self.code = code
    self.message = code.name
  }
}

public extension ResponseError {
  enum Code: Int, Codable, Equatable, Hashable {
    case internalServerError = 900
    case invalidCredentials = 910
    case invalidSession
    case takenEmail
    case unverifiedEmail
    case takenUsername

    public var name: String {
      switch self {
      case .internalServerError:
        return "Internal Server Error"
      case .invalidCredentials:
        return "Invalid Credentials"
      case .invalidSession:
        return "Invalid Session"
      case .takenEmail:
        return "Email is Taken"
      case .unverifiedEmail:
        return "Email is Unverified"
      case .takenUsername:
        return "Username is Taken"
      }
    }
  }
}


