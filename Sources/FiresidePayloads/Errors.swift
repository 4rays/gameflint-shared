enum PayloadError {
  enum Data: Int, Error {
    case invalidReleaseDate = 100

    var reason: String {
      return description
    }

    var description: String {
      switch self {
      case .invalidReleaseDate:
        return "The release date seems to be invalid"
      }
    }
  }
}
