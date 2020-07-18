import Foundation

public struct GameCompany: Codable, Hashable, Equatable {
  public var company: Company
  public var isDeveloper: Bool
  public var isPublisher: Bool

  public init(
    company: Company,
    isDeveloper: Bool = false,
    isPublisher: Bool = false
  ) {
    self.company = company
    self.isDeveloper = isDeveloper
    self.isPublisher = isPublisher
  }
}

public struct Company: Codable, Hashable, Equatable {
  public var id: UUID?
  public var name: String
  public var website: String?
  public var country: Int?
  public var localizedNames: [LocalizedName]
  public var createdAt: Date?
  public var updatedAt: Date?

  public init(
    id: UUID? = nil,
    name: String,
    website: String? = nil,
    country: Int? = nil,
    localizedNames: [LocalizedName] = [],
    createdAt: Date? = nil,
    updatedAt: Date? = nil
  ) {
    self.id = id
    self.name = name
    self.website = website
    self.country = country
    self.localizedNames = localizedNames
    self.createdAt = createdAt
    self.updatedAt = updatedAt
  }
}
