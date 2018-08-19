import XCTest
import Quick
import AZDateBuilder

class EscortDateRolesSpec: QuickSpec {
    override func spec() {
        describe("isTypicallyWorkday") {
            it("when weekday is first should return false") {
                let currentDate = Date.date(by: [
                    .year: 2010,
                    .month: 10,
                    .day: 10,
                    ])
                XCTAssertFalse(currentDate.isTypicallyWorkday())
            }
            it("when weekday is last should return false") {
                let currentDate = Date.date(by: [
                    .year: 2010,
                    .month: 10,
                    .day: 16,
                    ])
                XCTAssertFalse(currentDate.isTypicallyWorkday())
            }
            it("when weekday is last should return true") {
                let currentDate = Date.date(by: [
                    .year: 2010,
                    .month: 10,
                    .day: 11 + Int(arc4random_uniform(5)),
                    ])
                XCTAssertTrue(currentDate.isTypicallyWorkday())
            }
        }
        describe("isTypicallyWeekend") {
            it("when weekday is first should return true") {
                let currentDate = Date.date(by: [
                    .year: 2010,
                    .month: 10,
                    .day: 10,
                    ])
                XCTAssertTrue(currentDate.isTypicallyWeekend())
            }
            it("when weekday is last should return true") {
                let currentDate = Date.date(by: [
                    .year: 2010,
                    .month: 10,
                    .day: 16,
                    ])
                XCTAssertTrue(currentDate.isTypicallyWeekend())
            }
            it("when weekday is last should return false") {
                let currentDate = Date.date(by: [
                    .year: 2010,
                    .month: 10,
                    .day: 11 + Int(arc4random_uniform(5)),
                    ])
                XCTAssertFalse(currentDate.isTypicallyWeekend())
            }
        }
    }
}
