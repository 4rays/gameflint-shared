import Foundation

public struct ReleaseDate: Codable, Hashable, Equatable, CustomStringConvertible {
  public var year: Int
  public var quarter: Int?
  public var month: Int?
  public var day: Int?

  static let formatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "YYYY-MM-dd"
    return formatter
  }()

  public init(
    year: Int,
    quarter: Int? = nil,
    month: Int? = nil,
    day: Int? = nil
  ) {
    self.year = year
    self.quarter = quarter
    self.month = month
    self.day = day
  }

  public var description: String {
    let coalescingDay = day ?? 1
    let coalescingMonth = month ?? quarter.flatMap(month(from:)) ?? 1
    return "\(year)-\(coalescingMonth)-\(coalescingDay)"
  }
}

public extension ReleaseDate {
  func toRawDate() throws -> Date {
    try throwing(
      ReleaseDate.formatter.date(from: description),
      error: PayloadError.Data.invalidReleaseDate
    )
  }

  fileprivate func month(from quarter: Int) -> Int? {
    switch quarter {
    case 1: return 1
    case 2: return 4
    case 3: return 7
    case 4: return 10
    default: return nil
    }
  }
}
