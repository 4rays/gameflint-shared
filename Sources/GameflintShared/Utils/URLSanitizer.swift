import Foundation

extension String {
  public var urlSanitized: String {
    self
      .trimmingCharacters(in: .whitespacesAndNewlines)
      .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    ?? self
  }
}
