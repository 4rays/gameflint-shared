import Foundation

public struct Metadata: Codable, Hashable, Sendable {
  public var igdb: IGDB?
  public var metacritic: Metacritic?
  public var openCritic: OpenCritic?
  public var playStoreID: String? // "com.mojang.minecraftpe"
  public var appStoreID: String? // "479516143"
  public var epicID: String? // "b4daa3e4-a782-401f-a68e-52f6b2d0a1ad"
  public var gogID: String? // "1443699418"
  public var oculusID: String? // "2557519677620753"
  public var psnID: String? // "212779"
  public var steamID: String? // "72850"
  public var twitchID: String? // "27471"
  public var xboxID: String? // "9NBLGGH537BL"

  public init(
    igdb: Metadata.IGDB? = nil,
    metacritic: Metadata.Metacritic? = nil,
    openCritic: Metadata.OpenCritic? = nil,
    playStoreID: String? = nil,
    appStoreID: String? = nil,
    epicID: String? = nil,
    gogID: String? = nil,
    oculusID: String? = nil,
    psnID: String? = nil,
    steamID: String? = nil,
    twitchID: String? = nil,
    xboxID: String? = nil
  ) {
    self.igdb = igdb
    self.metacritic = metacritic
    self.openCritic = openCritic
    self.playStoreID = playStoreID
    self.appStoreID = appStoreID
    self.epicID = epicID
    self.gogID = gogID
    self.oculusID = oculusID
    self.psnID = psnID
    self.steamID = steamID
    self.twitchID = twitchID
    self.xboxID = xboxID
  }
}

extension Metadata {
  public mutating func update(
    with externalGame: Metadata.IGDB.ExternalGame
  ) {
    switch externalGame.service {
    case .steam: self.steamID = externalGame.externalID
    case .gog: self.gogID = externalGame.externalID
    case .xbox: self.xboxID = externalGame.externalID
    case .appStore: self.appStoreID = externalGame.externalID
    case .twitch: self.twitchID = externalGame.externalID
    case .playStore: self.playStoreID = externalGame.externalID
    case .epic: self.epicID = externalGame.externalID
    case .oculus: self.oculusID = externalGame.externalID
    case .psn: self.psnID = externalGame.externalID
    case .none: break
    }
  }
}
