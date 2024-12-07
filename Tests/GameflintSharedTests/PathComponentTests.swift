import HTTPRequestBuilder
import XCTest

@testable import GameflintShared

final class PathComponentTests: XCTestCase {
  func testPathComponents() {
    XCTAssertEqual(
      Path.signIn.apiVersion(.v1).fullPath,
      "v1/auth/sign-in"
    )

    XCTAssertEqual(
      Path().apiVersion(.v1).fullPath,
      "v1"
    )

    XCTAssertEqual(
      Path.verifyPasswordToken.fullPath,
      "auth/reset-password/verify"
    )
  }

  func testImportGamesPath() {
    XCTAssertEqual(
      Path.importGames.apiVersion(.v1).fullPath,
      "v1/admin/games/import"
    )
  }

  func testUserGamesPath() {
    XCTAssertEqual(
      Path.userGames.apiVersion(.v1).fullPath,
      "v1/account/games"
    )
  }

  func testCustomOperator() {
    let composed = "path" / "to" / "endpoint"
    XCTAssertEqual(composed.fullPath, "path/to/endpoint")
  }

  func testFlarePath() {
    let id = UUID()
    XCTAssertEqual(
      Path.flare(with: id).apiVersion(.v1).fullPath,
      "v1/games/\(id)/fireside/flare"
    )
  }

  func testSendability() async {
    struct Client: Sendable {
      var print: @Sendable () async -> String
    }

    let client = Client {
      let path = Path.userGamesByPlaythrough
      return path.fullPath
    }

    let result = await client.print()
    XCTAssertEqual(result, "account/games/filters/playthroughs")
  }
}
