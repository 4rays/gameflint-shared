import Foundation

public struct Metadata: Codable, Equatable, Hashable {
  public var igdb: IGDB?
  public var metacritic: Metacritic?
  public var openCritic: OpenCritic?

  public init(
    igdb: Metadata.IGDB?,
    metacritic: Metadata.Metacritic?,
    openCritic: Metadata.OpenCritic?
  ) {
    self.igdb = igdb
    self.metacritic = metacritic
    self.openCritic = openCritic
  }
}
