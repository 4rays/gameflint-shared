import Foundation

public struct GameCompany: Codable, Hashable, Equatable {
  public var gameID: UUID
  public var company: Company
  public var roles: [CompanyRole]

  public init(
    gameID: UUID,
    company: Company,
    roles: [CompanyRole]
  ) {
    self.gameID = gameID
    self.company = company
    self.roles = roles
  }
}

extension GameCompany: Compactable {
  public struct Compact: Codable, Equatable, Hashable {
    public var company: Company
    public var roles: [CompanyRole]

    public init(
      company: Company,
      roles: [CompanyRole]
    ) {
      self.company = company
      self.roles = roles
    }
  }

  public func compacted() -> Compact {
    .init(
      company: company,
      roles: roles
    )
  }
}

public struct Company: Codable, Hashable, Equatable, Identifiable {
  public var id: UUID
  public var name: String
  public var website: String?
  public var country: Int?
  public var localizedNames: [LocalizedString]
  public var createdAt: Date?
  public var updatedAt: Date?

  public init(
    id: UUID,
    name: String,
    website: String? = nil,
    country: Int? = nil,
    localizedNames: [LocalizedString] = [],
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
