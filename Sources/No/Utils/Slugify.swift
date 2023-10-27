import Foundation

extension String {
  private static let allowedCharacters = CharacterSet(
    charactersIn: "abcdefghijklmnopqrstuvwxyz0123456789-_"
  )

  public func slugify() -> String {
    self.lowercased()
      .components(separatedBy: String.allowedCharacters.inverted)
      .filter { $0 != "" }
      .joined(separator: "-")
  }

  public func snakeCased(screaming: Bool = false) -> String {
    guard !isEmpty else { return self }

    var words : [Range<String.Index>] = []

    var wordStart = startIndex
    var searchRange = index(after: wordStart)..<endIndex

    while let upperCaseRange = rangeOfCharacter(
      from: CharacterSet.uppercaseLetters,
      options: [],
      range: searchRange
    ) {
      let untilUpperCase = wordStart..<upperCaseRange.lowerBound
      words.append(untilUpperCase)

      searchRange = upperCaseRange.lowerBound..<searchRange.upperBound

      guard let lowerCaseRange = rangeOfCharacter(
        from: CharacterSet.lowercaseLetters,
        options: [],
        range: searchRange
      ) else {
        wordStart = searchRange.lowerBound
        break
      }

      let nextCharacterAfterCapital = index(after: upperCaseRange.lowerBound)

      if lowerCaseRange.lowerBound == nextCharacterAfterCapital {
        wordStart = upperCaseRange.lowerBound
      } else {
        let beforeLowerIndex = index(before: lowerCaseRange.lowerBound)
        words.append(upperCaseRange.lowerBound..<beforeLowerIndex)
        wordStart = beforeLowerIndex
      }

      searchRange = lowerCaseRange.upperBound..<searchRange.upperBound
    }
    words.append(wordStart..<searchRange.upperBound)
    var result = words.map({ (range) in
      return self[range].lowercased()
    }).joined(separator: "_")

    if screaming {
      result = result.uppercased()
    }

    return result
  }
}
