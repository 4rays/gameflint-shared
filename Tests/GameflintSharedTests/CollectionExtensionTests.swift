import XCTest
@testable import GameflintShared

final class CollectionExtensionTests: XCTestCase {
  struct Person: Identifiable, Equatable {
    public var id: UUID

    init() {
      self.id = UUID()
    }
  }

  func testDeltaIsCorrect() {
    let person1 = Person()
    let person2 = Person()
    let person3 = Person()
    let person4 = Person()


    let group1 = [person1, person2, person4]
    let group2 = [person2, person3, person4]

    let delta = group1.delta(from: group2)

    XCTAssertEqual(delta.0, [person3])
    XCTAssertEqual(delta.1, [person1])
  }

  func testGroupByKey() {
    let input = [
      ["A": 100, "B": 200],
      [:],
      ["A": 300, "C": 400]
    ]

    XCTAssertEqual(groupByKey(input)["A"], [100, 300])
  }
}
