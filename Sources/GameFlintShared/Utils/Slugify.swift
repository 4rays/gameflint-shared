import Foundation

extension String {
  private static let allowedCharacters = CharacterSet(
    charactersIn: "abcdefghijklmnopqrstuvwxyz0123456789-_"
  )

  public func slugify() -> String {
    var copy = self.lowercased()

    return copy
      .components(separatedBy: String.allowedCharacters.inverted)
      .filter { $0 != "" }
      .joined(separator: "-")
  }
}
