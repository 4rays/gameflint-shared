import XCTest
@testable import GameFlintShared

final class PathComponentTests: XCTestCase {
  func testPathComponents() {
    XCTAssertEqual(
      URLPath.signIn.apiVersion(.v1).fullPath,
      "v1/auth/sign-in"
    )

    XCTAssertEqual(
      URLPath().apiVersion(.v1).fullPath,
      "v1"
    )

    XCTAssertEqual(
      URLPath.verifyPasswordToken.fullPath,
      "auth/reset-password/verify"
    )
  }

  func testImportGamesPath() {
    XCTAssertEqual(
      URLPath.importGames.apiVersion(.v1).fullPath,
      "v1/admin/games/import"
    )
  }

  func testUserGamesPath() {
    XCTAssertEqual(
      URLPath.userGames.apiVersion(.v1).fullPath,
      "v1/account/games"
    )
  }

  func testCustomOperator() {
    let composed = "path" / "to" / "endpoint"
    XCTAssertEqual(composed.fullPath, "path/to/endpoint")
  }

  func testFlareUpGamePath() {
    let id = UUID()
    XCTAssertEqual(
      URLPath.flareUp(with: id).apiVersion(.v1).fullPath,
      "v1/games/\(id)/flare"
    )
  }
}
