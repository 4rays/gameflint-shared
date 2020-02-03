import Foundation

public struct GameCompanyPayload: Codable, Hashable, Equatable {
  public var company: CompanyPayload
  public var isDeveloper: Bool
  public var isPublisher: Bool

  public init(
    company: CompanyPayload,
    isDeveloper: Bool = false,
    isPublisher: Bool = false
  ) {
    self.company = company
    self.isDeveloper = isDeveloper
    self.isPublisher = isPublisher
  }
}

public struct CompanyPayload: Codable, Hashable, Equatable {
  public var name: String
  public var website: String?
  public var country: Int?
  public var localizedNames: [LocalizedNamePayload]
  public var createdAt: Date?
  public var updatedAt: Date?

  public init(
    name: String,
    website: String? = nil,
    country: Int? = nil,
    localizedNames: [LocalizedNamePayload] = [],
    createdAt: Date? = nil,
    updatedAt: Date? = nil
  ) {
    self.name = name
    self.website = website
    self.country = country
    self.localizedNames = localizedNames
    self.createdAt = createdAt
    self.updatedAt = updatedAt
  }
}
