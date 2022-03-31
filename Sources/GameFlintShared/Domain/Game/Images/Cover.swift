import Foundation

public struct LocalizedArtwork: Identifiable, Codable, Hashable {
  var fileName: String
  var type: ArtworkType
  var width: Float?
  var height: Float?

  public var id: String {
    [type.rawValue, fileName , region.rawValue].joined(separator: "-")
  }

  var region: Region {
    let components = fileName.split(separator: "-")
    guard components.count == 2 else { return .worldwide }
    return Region(rawValue: String(components[1])) ?? .worldwide
  }
}

public enum ArtworkSize: String, Codable, Hashable {
  case full
  case maxWidth512 = "max-512"
  case maxWidth256 = "max-256"
  case maxWidth128 = "max-128"
}

public enum ArtworkType: String, Codable, Hashable {
  case cover
  case icon
  case screenshot

  var availableSizes: [ArtworkSize] {
    switch self {
    case .cover:
      return [.full, .maxWidth512]
    case .icon:
      return [.full, .maxWidth256, .maxWidth128]
    case .screenshot:
      return [.full]
    }
  }
}
