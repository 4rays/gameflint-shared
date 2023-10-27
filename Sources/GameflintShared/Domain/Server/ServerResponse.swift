import Foundation

public enum ServerResponse: Equatable, Sendable {
  case failure(CodedError)
  case success
}

extension ServerResponse: Codable {
  enum CodingKeys: String, CodingKey {
    case error
    case success
  }

  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    if let failure = try container.decodeIfPresent(CodedError.self, forKey: .error) {
      self = .failure(failure)
    } else {
      self = .success
    }
  }

  public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case let .failure(error):
      try container.encode(error, forKey: .error)

    case .success:
      try container.encode(true, forKey: .success)
    }
  }
}
