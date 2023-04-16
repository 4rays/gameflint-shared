import Foundation
import XCTest

@testable import GameflintShared

final class URLSanitizerTests: XCTestCase {
  func testURLSanitized() {
    let url = "https://redalemeden.com/search?q=hello world"

    XCTAssertEqual(
      url.urlSanitized,
      "https://redalemeden.com/search?q=hello%20world"
    )

    let url2 = "https://redalemeden.com/foo bar "

    XCTAssertEqual(
      url2.urlSanitized, 
      "https://redalemeden.com/foo%20bar"
    )
  }
}
