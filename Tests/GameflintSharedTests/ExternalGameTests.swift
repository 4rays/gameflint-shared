import XCTest

@testable import GameflintShared

final class ExternalGameTests: XCTestCase {
  func testUpdatingMetadata() {
    var metadata = Metadata()

    let steamExternal = Metadata.IGDB.ExternalGame(
      externalID: "12345",
      igdbID: 1,
      category: 1
    )

    metadata.update(with: steamExternal)
    XCTAssertEqual(metadata.steamID, "12345")

    let gogExternal = Metadata.IGDB.ExternalGame(
      externalID: "67890",
      igdbID: 1,
      category: 5
    )

    metadata.update(with: gogExternal)
    XCTAssertEqual(metadata.gogID, "67890")

    let xboxExternal = Metadata.IGDB.ExternalGame(
      externalID: "12345",
      igdbID: 1,
      category: 11
    )

    metadata.update(with: xboxExternal)
    XCTAssertEqual(metadata.xboxID, "12345")

    let appStoreExternal = Metadata.IGDB.ExternalGame(
      externalID: "12345",
      igdbID: 1,
      category: 13
    )

    metadata.update(with: appStoreExternal)
    XCTAssertEqual(metadata.appStoreID, "12345")

    let twitchExternal = Metadata.IGDB.ExternalGame(
      externalID: "12345",
      igdbID: 1,
      category: 14
    )

    metadata.update(with: twitchExternal)
    XCTAssertEqual(metadata.twitchID, "12345")

    let playStoreExternal = Metadata.IGDB.ExternalGame(
      externalID: "12345",
      igdbID: 1,
      category: 15
    )

    metadata.update(with: playStoreExternal)
    XCTAssertEqual(metadata.playStoreID, "12345")

    let epicExternal = Metadata.IGDB.ExternalGame(
      externalID: "12345",
      igdbID: 1,
      category: 26
    )

    metadata.update(with: epicExternal)
    XCTAssertEqual(metadata.epicID, "12345")

    let oculusExternal = Metadata.IGDB.ExternalGame(
      externalID: "12345",
      igdbID: 1,
      category: 28
    )

    metadata.update(with: oculusExternal)
    XCTAssertEqual(metadata.oculusID, "12345")

    let psnExternal = Metadata.IGDB.ExternalGame(
      externalID: "12345",
      igdbID: 1,
      category: 36
    )

    metadata.update(with: psnExternal)
    XCTAssertEqual(metadata.psnID, "12345")

    let unknownExternal = Metadata.IGDB.ExternalGame(
      externalID: "12345",
      igdbID: 1,
      category: 100
    )

    let metadataCopy = metadata
    metadata.update(with: unknownExternal)
    XCTAssertEqual(metadata, metadataCopy)
  }

  func testUpdatingGamePartial() {
    var game = Game.Partial(name: "Bloodborne")

    let steamExternal = Metadata.IGDB.ExternalGame(
      externalID: "12345",
      igdbID: 1,
      category: 1
    )

    game.update(with: steamExternal)
    XCTAssertNotNil(game.metadata)
    XCTAssertEqual(game.metadata?.steamID, "12345")
    XCTAssertNil(game.links)

    let gogExternal = Metadata.IGDB.ExternalGame(
      externalID: "67890",
      igdbID: 1,
      category: 5,
      url: "https://www.gog.com/game/bloodborne"
    )

    game.update(with: gogExternal)
    XCTAssertEqual(game.metadata?.gogID, "67890")
    XCTAssertNotNil(game.links)

    XCTAssertEqual(
      game.links?.first,
      "https://www.gog.com/game/bloodborne"
    )

    let xboxExternal = Metadata.IGDB.ExternalGame(
      externalID: "12345",
      igdbID: 1,
      category: 11,
      url: "https://www.xbox.com/en-US/games/bloodborne"
    )

    game.update(with: xboxExternal)
    XCTAssertEqual(game.metadata?.xboxID, "12345")
    XCTAssertEqual(game.links?.count, 2)

    XCTAssertEqual(
      game.links?.last,
      "https://www.xbox.com/en-US/games/bloodborne"
    )

    let appStoreExternal = Metadata.IGDB.ExternalGame(
      externalID: "12345",
      igdbID: 1,
      category: 13
    )

    let twitchExternal = Metadata.IGDB.ExternalGame(
      externalID: "12345",
      igdbID: 1,
      category: 14
    )

    game.update(
      with: [appStoreExternal, twitchExternal]
    )

    XCTAssertEqual(game.metadata?.appStoreID, "12345")
    XCTAssertEqual(game.metadata?.twitchID, "12345")
  }
}
