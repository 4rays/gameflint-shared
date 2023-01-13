import Foundation

public struct GameCompany: Codable, Hashable, Sendable {
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
  public struct Compact: Codable, Hashable, Identifiable, Sendable {
    public var company: Company
    public var roles: [CompanyRole]

    public init(
      company: Company,
      roles: [CompanyRole]
    ) {
      self.company = company
      self.roles = roles
    }

    public var id: Company.ID {
      company.id
    }
  }

  public func compacted() -> Compact {
    .init(
      company: company,
      roles: roles
    )
  }
}
