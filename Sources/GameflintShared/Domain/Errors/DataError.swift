enum DataError {
  enum Data: Int, Error {
    case invalidReleaseDate = 100
    case missingDefaultPlaythrough

    var reason: String {
      return description
    }

    var description: String {
      switch self {
      case .invalidReleaseDate: "The release date seems to be invalid."
      case .missingDefaultPlaythrough: "A default playthrough is required."
      }
    }
  }
}
