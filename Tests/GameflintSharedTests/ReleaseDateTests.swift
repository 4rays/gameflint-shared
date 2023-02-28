import XCTest

@testable import GameflintShared

final class ReleaseDateTests: XCTestCase {
  func testEarliestReleaseDate() throws {
    let earliestReleaseDate = ReleaseDate(year: 2017, month: 1, day: 30)

    let release1 = Release(
      id: .init(),
      date: .official(try earliestReleaseDate.toUTCDate())
    )

    let release3 = Release(
      id: .init(),
      date: .official(try ReleaseDate(year: 2022).toUTCDate())
    )

    let release2 = Release(
      id: .init(),
      date: .official(
        try ReleaseDate(
          year: 2020,
          month: 12,
          day: 30
        ).toUTCDate()
      )
    )

    let game = Game(id: .init(), name: "Game", releases: [release1, release3, release2])

    XCTAssertEqual(game.earliestReleaseDate, try? earliestReleaseDate.toUTCDate())
  }

  func testEarliestReleaseDateUpdate() throws {
    let earliestReleaseDate = ReleaseDate(year: 2016, month: 1, day: 30)

    let release1 = Release(
      id: .init(),
      date: .official(
        try ReleaseDate(year: 2017, month: 1, day: 30).toUTCDate()
      )
    )

    let release2 = Release(
      id: .init(),
      date: .official(
        try ReleaseDate(year: 2020, month: 12, day: 30).toUTCDate()
      )
    )

    var release3 = Release(
      id: .init(),
      date: .official(
        try ReleaseDate(year: 2022).toUTCDate()
      )
    )

    var game = Game(
      id: .init(),
      name: "Game",
      releases: [
        release1,
        release3,
        release2,
      ]
    )

    release3 = Release(id: .init(), date: .official(try earliestReleaseDate.toUTCDate()))

    game.releases?[2] = release3

    XCTAssertEqual(game.earliestReleaseDate, try? earliestReleaseDate.toUTCDate())
  }

  func testEarliestReleaseDateAppend() throws {
    let earliestReleaseDate = ReleaseDate(year: 2016, month: 1, day: 30)

    let release1 = Release(
      id: .init(),
      date: .official(
        try ReleaseDate(year: 2017, month: 1, day: 30).toUTCDate()
      )
    )

    let release2 = Release(
      id: .init(),
      date: .official(
        try ReleaseDate(year: 2020, month: 12, day: 30).toUTCDate()
      )
    )

    var release3 = Release(
      id: .init(),
      date: .official(
        try ReleaseDate(year: 2022).toUTCDate()
      )
    )

    var game = Game(id: .init(), name: "Game", releases: [release1, release2])
    release3 = Release(id: .init(), date: .official(try earliestReleaseDate.toUTCDate()))

    game.releases?.append(release3)

    XCTAssertEqual(game.earliestReleaseDate, try? earliestReleaseDate.toUTCDate())
  }

  func testReleaseDateConversion() {
    let date1 = try? ReleaseDate(year: 2016).toUTCDate()
    let date2 = try? ReleaseDate(year: 2016, month: 1, day: 1).toUTCDate()

    let expectedDate = Date(timeIntervalSince1970: 1_451_606_400)

    XCTAssertEqual(date1, expectedDate)
    XCTAssertEqual(date2, expectedDate)
  }

  func testDecodeReleaseDate() throws {
    let json = """
      { "year": 2000, "month": 14, "day": 20 }
      """

    let value = try JSONDecoder().decode(
      ReleaseDate.self,
      from: json.data(using: .utf8)!
    )

    XCTAssertNotNil(value)
    XCTAssertEqual(value.month, 12)
    XCTAssertEqual(value.day, 20)
  }
}
