public enum PlayState: String, Codable, Equatable, CaseIterable  {
  case acquired
  case playing
  case abandoned
  case cleared
}
