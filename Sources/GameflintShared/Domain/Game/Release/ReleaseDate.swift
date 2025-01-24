import Foundation

public struct ReleaseDate: Codable, Hashable, CustomStringConvertible, Comparable, Sendable {
  @Year public var year: Int
  @Quarter public var quarter: Int?
  @Month public var month: Int?
  @Day public var day: Int?

  public static let formatterUTC: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    formatter.timeZone = .utc
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

  public init(
    date: Date = Date()
  ) {
    let components = Calendar.current.dateComponents(
      in: .utc ?? .current,
      from: date
    )

    self.year = components.year ?? 2000
    self.month = components.month ?? 1
    self.day = components.day ?? 1
    self.quarter = nil
  }

  public var description: String {
    let coalescingDay = day ?? 1
    let coalescingMonth = month ?? quarter.flatMap(month(from:)) ?? 1
    return "\(year)-\(coalescingMonth)-\(coalescingDay)"
  }

  public static func < (lhs: ReleaseDate, rhs: ReleaseDate) -> Bool {
    switch (try? lhs.toUTCDate(), try? rhs.toUTCDate()) {
    case let (.some(lhd), .some(rhd)): lhd < rhd
    case (.none, .some): true
    default: false
    }
  }

  public static func now() -> Self {
    .init()
  }
}

extension ReleaseDate {
  public func toUTCDate() throws -> Date {
    try ReleaseDate.formatterUTC.date(from: description).unwrap(
      error: DataError.Data.invalidReleaseDate
    )
  }

  fileprivate func month(from quarter: Int) -> Int? {
    switch quarter {
    case 1: 1
    case 2: 4
    case 3: 7
    case 4: 10
    default: nil
    }
  }
}
