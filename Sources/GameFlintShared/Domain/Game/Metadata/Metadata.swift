import Foundation

public struct Metadata: Codable, Equatable, Hashable {
  public var igdb: IGDB
  public var metacritic: Metacritic
  public var openCritic: OpenCritic
}
