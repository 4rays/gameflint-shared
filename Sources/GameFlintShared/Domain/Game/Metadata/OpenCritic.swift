public extension Metadata {
  struct OpenCritic: Codable, Hashable {
    public var criticAverage: Float
    public var recommendedBy: Float?
    public var url: String?

    public init(
      criticAverage: Float,
      recommendedBy: Float? = nil,
      url: String? = nil
    ) {
      self.criticAverage = criticAverage
      self.recommendedBy = recommendedBy
      self.url = url
    }
  }
}
