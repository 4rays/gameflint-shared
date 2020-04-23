public enum PlayState: String, Codable, Equatable, CaseIterable {
  case interested
  case acquired
  case playing
  case abandoned
  case cleared
}
