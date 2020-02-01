import Foundation

public struct GameCompanyPayload: Codable, Hashable, Equatable {
  public var company: CompanyPayload
  public var isDeveloper: Bool
  public var isPublisher: Bool

  public init(company: CompanyPayload,
              isDeveloper: Bool,
              isPublisher: Bool) {
    self.company = company
    self.isDeveloper = isDeveloper
    self.isPublisher = isPublisher
  }

}

public struct CompanyPayload: Codable, Hashable, Equatable {
  public var name: String
  public var website: String?
  public var country: Int?
  public var localizedNames: Set<LocalizedNamePayload>?
  public var isDeveloper: Bool
  public var isPublisher: Bool
  public var createdAt: Date?
  public var updatedAt: Date?

  public init(name: String,
              website: String?,
              country: Int?,
              localizedNames: Set<LocalizedNamePayload>?,
              isDeveloper: Bool,
              isPublisher: Bool,
              createdAt: Date?,
              updatedAt: Date?) {
    self.name = name
    self.website = website
    self.country = country
    self.localizedNames = localizedNames
    self.isDeveloper = isDeveloper
    self.isPublisher = isPublisher
    self.createdAt = createdAt
    self.updatedAt = updatedAt
  }
}
