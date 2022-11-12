import Foundation

public struct Metadata: Codable, Hashable {
  public var igdb: IGDB?
  public var metacritic: Metacritic?
  public var openCritic: OpenCritic?

  public init(
    igdb: Metadata.IGDB? = nil,
    metacritic: Metadata.Metacritic? = nil,
    openCritic: Metadata.OpenCritic? = nil
  ) {
    self.igdb = igdb
    self.metacritic = metacritic
    self.openCritic = openCritic
  }
}
