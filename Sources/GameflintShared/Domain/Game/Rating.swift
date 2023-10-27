public enum Rating: UInt8, Codable, Equatable, CaseIterable, Sendable {
  case ash = 1
  case candle
  case fireplace
  case bonfire
}
