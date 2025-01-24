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
    case .internalServerError: "Internal Server Error"
    case .invalidCredentials: "Invalid Credentials"
    case .invalidSession: "Invalid Session"
    case .takenEmail: "Email is Taken"
    case .unverifiedEmail: "Email is Unverified"
    case .takenUsername: "Username is Taken"
    case .gameAlreadyFlared: "Game already Flared"
    case .notEnoughPellets: "Not Enough Pellets"
    case .missingResource: "Resource is Missing"
    }
  }

  public var description: String {
    switch code {
    case .internalServerError: "Something went wrong on our end. Please try again later."
    case .invalidCredentials: "The credentials provided are invalid."
    case .invalidSession: "The current session is invalid. Please sign in again."
    case .takenEmail: "The email you entered is already taken."
    case .unverifiedEmail: "The email used is unverified."
    case .takenUsername: "The username you entered is already taken."
    case .gameAlreadyFlared: "You have already flared this game."
    case .notEnoughPellets: "You don't have enough pellets to perform this action."
    case .missingResource: "The requested resource is missing."
    }
  }
}
