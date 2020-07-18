import Foundation

public enum APIEndpoints {
  public static let path = "api"

  public enum V1 {
    public static let path = [APIEndpoints.path, "v1"]

    public enum Auth {
      public static let signIn = "sign-in"
      public static let signUp = "sign-up"
      public static let refreshAccessToken = "refresh-access"
    }
  }
}
