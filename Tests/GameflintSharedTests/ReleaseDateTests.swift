import XCTest
@testable import GameflintShared

final class ReleaseDateTests: XCTestCase {
  func testEarliestReleaseDateInit() {
    let earliestReleaseDate = ReleaseDate(year: 2017, month: 1, day: 30)

    let release1 = Release(id: .init(), humanDate: earliestReleaseDate)
    let release2 = Release(id: .init(), humanDate: .init(year: 2020, month: 12, day: 30))
    let release3 = Release(id: .init(), humanDate: .init(year: 2022))

    let game = Game(id: UUID(), name: "Game", releases: [release1, release3, release2])

    XCTAssertEqual(game.earliestReleaseDate, try? earliestReleaseDate.toRawDate())
  }

  func testEarliestReleaseDateUpdate() {
    let earliestReleaseDate = ReleaseDate(year: 2016, month: 1, day: 30)

    let release1 = Release(id: .init(), humanDate: .init(year: 2017, month: 1, day: 30))
    let release2 = Release(id: .init(), humanDate: .init(year: 2020, month: 12, day: 30))
    var release3 = Release(id: .init(), humanDate: .init(year: 2022))

    var game = Game(id: UUID(), name: "Game", releases: [release1, release3, release2])

    release3.humanDate = earliestReleaseDate

    game.releases?[2] = release3

    XCTAssertEqual(game.earliestReleaseDate, try? earliestReleaseDate.toRawDate())
  }

  func testEarliestReleaseDateAppend() {
    let earliestReleaseDate = ReleaseDate(year: 2016, month: 1, day: 30)

    let release1 = Release(id: .init(), humanDate: .init(year: 2017, month: 1, day: 30))
    let release2 = Release(id: .init(), humanDate: .init(year: 2020, month: 12, day: 30))
    var release3 = Release(id: .init(), humanDate: .init(year: 2022))

    var game = Game(id: UUID(), name: "Game", releases: [release1, release2])

    release3.humanDate = earliestReleaseDate

    game.releases?.append(release3)

    XCTAssertEqual(game.earliestReleaseDate, try? earliestReleaseDate.toRawDate())
  }

  func testReleaseDateConversion() {
    let date1 = try? ReleaseDate(year: 2016).toRawDate()
    let date2 = try? ReleaseDate(year: 2016, month: 1, day: 1).toRawDate()

    let expectedDate = Date(timeIntervalSince1970: 1451606400)

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
