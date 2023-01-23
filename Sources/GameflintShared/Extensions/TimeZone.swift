import Foundation

extension TimeZone {
  public static var utc: Self? {
    .init(identifier: "UTC")
  }
}
