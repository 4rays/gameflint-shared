extension Metadata {
  public struct Metacritic: Codable, Equatable, Hashable {
    public var metaScore: Float
    public var userScore: Float?
    public var url: String?

    public init(
      metaScore: Float,
      userScore: Float? = nil,
      url: String? = nil
    ) {
      self.metaScore = metaScore
      self.userScore = userScore
      self.url = url
    }
  }
}
