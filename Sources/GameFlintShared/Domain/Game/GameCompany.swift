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
  public struct Patch: Codable, Equatable, Hashable {
    public var company: Company.Patch
    public var roles: [CompanyRole]

    public init(
      company: Company.Patch,
      roles: [CompanyRole]
    ) {
      self.company = company
      self.roles = roles
    }

    public var compact: Compact {
      .init(
        company: company.full,
        roles: roles
      )
    }
  }

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
