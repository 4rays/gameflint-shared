import Foundation

public struct LocalizedArtwork: Identifiable, Codable, Hashable {
  public var fileName: String
  public var type: ArtworkType
  public var width: Int?
  public var height: Int?

  public init(
    _ fileName: String,
    type: ArtworkType,
    width: Int? = nil,
    height: Int? = nil
  ) {
    self.fileName = fileName
    self.type = type
    self.width = width
    self.height = height
  }

  public var id: String {
    [type.rawValue, fileName , region.rawValue].joined(separator: "-")
  }

  public var region: Region {
    let components = fileName.split(separator: "-")
    guard components.count == 2 else { return .worldwide }
    return Region(rawValue: String(components[1])) ?? .worldwide
  }

  public var aspectRatio: Double? {
    guard
      let width = width,
      let height = height,
      height > 0
    else { return nil }
    return Double(width) / Double(height)
  }

  public static func cover(
    _ fileName: String,
    width: Int? = nil,
    height: Int? = nil
  ) -> Self {
    .init(fileName, type: .cover, width: width, height: height)
  }

  public static func screenshot(
    _ fileName: String,
    width: Int? = nil,
    height: Int? = nil
  ) -> Self {
    .init(fileName, type: .screenshot, width: width, height: height)
  }

  public static func icon(
    _ fileName: String,
    width: Int? = nil,
    height: Int? = nil
  ) -> Self {
    .init(fileName, type: .icon, width: width, height: height)
  }
}

public enum ArtworkSize: String, Codable, Hashable {
  case full
  case maxWidth512 = "max-512"
  case maxWidth256 = "max-256"
  case maxWidth128 = "max-128"

  public var maxWidth: Double {
    switch self {
    case .full:
      return .infinity

    case .maxWidth512:
      return 512

    case .maxWidth256:
      return 256

    case .maxWidth128:
      return 128
    }
  }
}

public enum ArtworkType: String, Codable, Hashable {
  case cover
  case icon
  case screenshot

  public var availableSizes: [ArtworkSize] {
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

extension Sequence where Element == LocalizedArtwork {
  public var firstCover: LocalizedArtwork? {
    first(where: { $0.type == .cover })
  }

  public var firstIcon: LocalizedArtwork? {
    first(where: { $0.type == .icon })
  }

  public var covers: [LocalizedArtwork] {
    filter { $0.type == .cover }
  }

  public var icons: [LocalizedArtwork] {
    filter { $0.type == .icon }
  }

  public var screenshots: [LocalizedArtwork] {
    filter { $0.type == .screenshot }
  }
}
