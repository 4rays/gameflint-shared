import Foundation

extension Genre {
  public struct Partial: Codable, Hashable, Sendable {
    public var slug: String
    public var name: String
    public var localizedNames: [Language: String]

    public init(
      slug: String,
      name: String,
      localizedNames: [Language: String] = [:]
    ) {
      self.slug = slug
      self.name = name
      self.localizedNames = localizedNames
    }

    public init(
      _ name: String
    ) {
      self.name = name
      self.slug = name.slugify()
      self.localizedNames = [.en: name]
    }
  }
}
