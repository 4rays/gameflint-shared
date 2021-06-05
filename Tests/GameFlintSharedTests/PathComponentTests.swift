import XCTest
@testable import GameFlintShared

final class PathComponentTests: XCTestCase {
  func testPathComponents() {
    let path1 = APIRoutes.v1.versioned(.signIn)(.init())
    let path2 = APIRoutes.v1.path(.init())
    let path3 = APIRoutes.Auth.verifyPasswordToken.endpoint

    XCTAssertEqual(path1.fullPath, "api/v1/auth/sign-in")
    XCTAssertEqual(path2.fullPath, "api/v1")
    XCTAssertEqual(path3.fullPath, "auth/reset-password/verify")

    XCTAssertEqual(path3.last(3), ["auth", "reset-password", "verify"])
    XCTAssertEqual(path3.last(2), ["reset-password", "verify"])
    XCTAssertEqual(path3.last(1), ["verify"])
  }

  func testImportGamesPath() {
    let path = APIRoutes.v1.versioned(.importGames)(.init())
    XCTAssertEqual(path.fullPath, "api/v1/admin/games/import")
  }

  func testUserGamesPath() {
    let path = APIRoutes.v1.versioned(.userGames)(.init())
    XCTAssertEqual(path.fullPath, "api/v1/account/games")
  }

  func testCustomOperator() {
    let transform1 = "path".asPath
    let transform2 = "to".asPath
    let transform3 = "endpoint".asPath

    let composed = transform1 / transform2 / transform3
    let endpoint = composed(Endpoint())

    XCTAssertEqual(endpoint.fullPath, "path/to/endpoint")
  }
}
