import XCTest
@testable import GameFlintShared

final class PathComponentTests: XCTestCase {
  func testPathComponents() {
    let path1 = APIRoutes.signIn(.init())
    let path2 = APIRoutes.v1(.init())
    let path3 = APIRoutes.V1.Auth.verifyPasswordToken.endpoint

    XCTAssertEqual(path1.fullPath, "api/v1/auth/sign-in")
    XCTAssertEqual(path2.fullPath, "api/v1")
    XCTAssertEqual(path3.fullPath, "api/v1/auth/reset-password/verify")

    XCTAssertEqual(path3.last(3), ["auth", "reset-password", "verify"])
    XCTAssertEqual(path3.last(2), ["reset-password", "verify"])
    XCTAssertEqual(path3.last(1), ["verify"])
  }

  func testImportGamesPath() {
    let path = APIRoutes.importGames(.init())
    XCTAssertEqual(path.fullPath, "api/v1/admin/games/import")
  }

  func testUserGamesPath() {
    let path = APIRoutes.userGames(.init())
    XCTAssertEqual(path.fullPath, "api/v1/account/games")
  }
}
