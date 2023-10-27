import Foundation

extension Company {
  public struct Partial: Codable, Hashable, Sendable {
    public var name: String
    public var localizedNames: [Language: String]
    public var links: [String]?
    public var country: Int?

    public init(
      name: String,
      localizedNames: [Language: String] = [:],
      links: [String]? = nil,
      country: Int? = nil
    ) {
      self.name = name
      self.localizedNames = localizedNames
      self.links = links
      self.country = country
    }
  }
}

extension GameCompany {
  public struct Partial: Codable, Hashable, Identifiable, Sendable {
    public var company: Company.Partial
    public var roles: [CompanyRole]

    public init(
      company: Company.Partial,
      roles: [CompanyRole]
    ) {
      self.company = company
      self.roles = roles
    }

    public var id: String {
      company.name
    }
  }
}
