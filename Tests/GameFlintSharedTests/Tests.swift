import XCTest
@testable import GameFlintShared

final class GameFlintSharedTests: XCTestCase {
  func testEarliestReleaseDateInit() {
    let earliestReleaseDate = ReleaseDate(year: 2017, month: 1, day: 30)

    let release1 = Release(humanDate: earliestReleaseDate)
    let release2 = Release(humanDate: .init(year: 2020, month: 12, day: 30))
    let release3 = Release(humanDate: .init(year: 2022))

    let game = Game(id: UUID(), name: "Game", releases: [release1, release3, release2])

    XCTAssertEqual(game.earliestReleaseDate, try? earliestReleaseDate.toRawDate())
  }

  func testEarliestReleaseDateUpdate() {
    let earliestReleaseDate = ReleaseDate(year: 2016, month: 1, day: 30)

    let release1 = Release(humanDate: .init(year: 2017, month: 1, day: 30))
    let release2 = Release(humanDate: .init(year: 2020, month: 12, day: 30))
    var release3 = Release(humanDate: .init(year: 2022))

    var game = Game(id: UUID(), name: "Game", releases: [release1, release3, release2])

    release3.humanDate = earliestReleaseDate

    game.releases[2] = release3

    XCTAssertEqual(game.earliestReleaseDate, try? earliestReleaseDate.toRawDate())
  }

  func testEarliestReleaseDateAppend() {
    let earliestReleaseDate = ReleaseDate(year: 2016, month: 1, day: 30)

    let release1 = Release(humanDate: .init(year: 2017, month: 1, day: 30))
    let release2 = Release(humanDate: .init(year: 2020, month: 12, day: 30))
    var release3 = Release(humanDate: .init(year: 2022))

    var game = Game(id: UUID(), name: "Game", releases: [release1, release2])

    release3.humanDate = earliestReleaseDate

    game.releases.append(release3)

    XCTAssertEqual(game.earliestReleaseDate, try? earliestReleaseDate.toRawDate())
  }

  func testReleaseDateConversion() {
    let date1 = try? ReleaseDate(year: 2016).toRawDate()
    let date2 = try? ReleaseDate(year: 2016, month: 1, day: 1).toRawDate()

    let expectedDate = Date(timeIntervalSince1970: 1451606400)

    XCTAssertEqual(date1, expectedDate)
    XCTAssertEqual(date2, expectedDate)
  }

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
}
