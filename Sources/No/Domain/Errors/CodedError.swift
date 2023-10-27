import Foundation

extension ServerResponse {
  public struct CodedError: Error, Codable, Hashable, Sendable {
    public var code: Code
    public var message: String?

    public var localizedDescription: String { message ?? description }

    public init(
      code: Code = .internalServerError,
      message: String? = nil
    ) {
      self.code = code
      self.message = message
    }
  }
}

extension ServerResponse.CodedError {
  public enum Code: String, Codable, Hashable, Sendable {
    case internalServerError
    case invalidCredentials
    case invalidSession
    case takenEmail
    case unverifiedEmail
    case takenUsername
    case gameAlreadyFlared
    case notEnoughPellets
    case missingResource

    @available(*, deprecated, renamed: "title")
    public var name: String { "Server Response Error" }
  }

  public var title: String {
    switch code {
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

    case .gameAlreadyFlared:
      return "Game already Flared"

    case .notEnoughPellets:
      return "Not Enough Pellets"

    case .missingResource:
      return "Resource is Missing"
    }
  }

  public var description: String {
    switch code {
    case .internalServerError:
      return "Something went wrong on our end. Please try again later."

    case .invalidCredentials:
      return "The credentials provided are invalid."

    case .invalidSession:
      return "The current session is invalid. Please sign in again."

    case .takenEmail:
      return "The email you entered is already taken."

    case .unverifiedEmail:
      return "The email used is unverified."

    case .takenUsername:
      return "The username you entered is already taken."

    case .gameAlreadyFlared:
      return "You have already flared this game."

    case .notEnoughPellets:
      return "You don't have enough pellets to perform this action."

    case .missingResource:
      return "The requested resource is missing."
    }
  }
}
