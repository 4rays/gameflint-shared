public struct OpenCriticMetadata: Codable, Equatable {
  public var criticAverage: Float
  public var recommendedBy: Float?
  public var url: String?

  public init(criticAverage: Float,
              recommendedBy: Float?,
              url: String?) {
    self.criticAverage = criticAverage
    self.recommendedBy = recommendedBy
    self.url = url
  }
}
