import Foundation

public enum ExternalService: Codable, Hashable {
  case steam
  case gog
  case xbox
  case playStore
  case appStore
  case epic
  case oculus
  case psn
  case twitch

  init?(_ value: Int) {
    switch value {
    case 1:
      self = .steam

    case 5:
      self = .gog

    case 11:
      self = .xbox

    case 13:
      self = .appStore

    case 14:
      self = .twitch

    case 15:
      self = .playStore

    case 26:
      self = .epic

    case 28:
      self = .oculus

    case 36:
      self = .psn

    default:
      return nil
    }
  }
}
