import XCTest
import Quick
import AZDateBuilder

class EscortExtractSpec: QuickSpec {
    override func spec() {
        describe("gregorianYear") {
            context("when 2010-10-10") {
                let currentDate = Date.date(by: [
                    .year: 2010,
                    .month: 10,
                    .day: 15,
                    ])
                it("gregorian calendar should return 2010") {
                    Date.identifier = .gregorian
                    XCTAssertEqual(currentDate.gregorianYear, 2010)
                }
                it("japanese calendar should return 2010") {
                    Date.identifier = .japanese
                    XCTAssertEqual(currentDate.gregorianYear, 2010)
                }
            }
        }
        describe("nearestHour") {
            it("when 10:00:00 should return 10") {
                let currentDate = Date.date(by: [
                    .year: 2010,
                    .month: 10,
                    .day: 11,
                    .hour: 10,
                    .minute: 0,
                    .second: 0,
                    ])
                XCTAssertEqual(currentDate.nearestHour, 10)
            }
            it("when 10:29:59 should return 10") {
                let currentDate = Date.date(by: [
                    .year: 2010,
                    .month: 10,
                    .day: 11,
                    .hour: 10,
                    .minute: 29,
                    .second: 59,
                    ])
                XCTAssertEqual(currentDate.nearestHour, 10)
            }
            it("when 10:30:00 should return 10") {
                let currentDate = Date.date(by: [
                    .year: 2010,
                    .month: 10,
                    .day: 11,
                    .hour: 10,
                    .minute: 30,
                    .second: 00,
                    ])
                XCTAssertEqual(currentDate.nearestHour, 11)
            }
        }
    }
}
