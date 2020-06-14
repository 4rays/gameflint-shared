import XCTest
@testable import FiresideShared

final class FiresideSharedTests: XCTestCase {
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

    XCTAssertEqual(date1, date2)
  }
}
