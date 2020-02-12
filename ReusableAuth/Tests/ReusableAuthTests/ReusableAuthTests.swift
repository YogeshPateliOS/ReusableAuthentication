import XCTest
@testable import ReusableAuth

final class ReusableAuthTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ReusableAuth().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
