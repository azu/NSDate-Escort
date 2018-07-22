import XCTest
import Quick
import AZDateBuilder

class EscortComparingSpec: QuickSpec {
    override func spec() {
        describe("- isEqual(ignoringTime: date)") {
            let currentDate = Date()
            it("when same the date should be true") {
                XCTAssertTrue(currentDate.isEqual(ignoringTime: currentDate))
            }
            context("when target is today") {
                it("of start should return true") {
                    let beginOfDate = currentDate.date(by: [
                        .hour: 0,
                        .minute: 0,
                        .second: 0,
                        ])
                    XCTAssertTrue(currentDate.isEqual(ignoringTime: beginOfDate))
                }
                it("of end should return true") {
                    let endOfDate = currentDate.date(by: [
                        .hour: 0,
                        .minute: 0,
                        .second: 0,
                        ])
                    XCTAssertTrue(currentDate.isEqual(ignoringTime: endOfDate))
                }
            }
            it("when target is a later day should return false") {
                let laterDate = currentDate.date(by: [
                    .day: currentDate.day + Int(arc4random()) + 1,
                    .hour: 0,
                    .minute: 0,
                    .second: 0,
                    ])
                XCTAssertFalse(currentDate.isEqual(ignoringTime: laterDate))
            }
            it("when target is a earler day should return false") {
                let earlerDate = currentDate.date(by: [
                    .day: currentDate.day - Int(arc4random()) - 1,
                    .hour: 0,
                    .minute: 0,
                    .second: 0,
                    ])
                XCTAssertFalse(currentDate.isEqual(ignoringTime: earlerDate))
            }
            it("when target is previous era should return false") {
                let currentDate = Date.date(by: [
                    .year: 2014,
                    .month: 5,
                    .day: 19,
                    ])
                let previousEraDate = Date.date(by: [
                    .year: 1951,
                    .month: 5,
                    .day: 19,
                    ])
                
                Date.identifier = .japanese
                XCTAssertFalse(currentDate.isEqual(ignoringTime: previousEraDate))
            }
        }
        describe("isToday") {
            let currentDate = Date()
            it("when subject is same date should return true") {
                XCTAssertTrue(currentDate.isToday())
            }
            it("when subject is a later day should return false") {
                let laterDate = currentDate.date(by: [
                    .day: currentDate.day + 1,
                    .hour: 0,
                    .minute: 0,
                    .second: 0,
                    ])
                XCTAssertFalse(laterDate.isToday())
            }
            it("when subject is a earler day should return false") {
                let earlerDate = currentDate.date(by: [
                    .day: currentDate.day - 1,
                    .hour: 23,
                    .minute: 59,
                    .second: 59,
                    ])
                XCTAssertFalse(earlerDate.isToday())
            }
        }
        describe("isTomorrow") {
            let currentDate = Date()
            it("when subject is same date should return false") {
                XCTAssertFalse(currentDate.isTomorrow())
            }
            it("when subject is a tomorrow should return true") {
                let tomorrow = currentDate.date(by: [
                    .day: currentDate.day + 1,
                    .hour: 0,
                    .minute: 0,
                    .second: 0,
                    ])
                XCTAssertTrue(tomorrow.isTomorrow())
            }
            it("when subject is a 2 days later should return false") {
                let laterDate = currentDate.date(by: [
                    .day: currentDate.day + 2,
                    .hour: 23,
                    .minute: 59,
                    .second: 59,
                    ])
                XCTAssertFalse(laterDate.isTomorrow())
            }
        }
        describe("isYesterday") {
            let currentDate = Date()
            it("when subject is same date should return false") {
                XCTAssertFalse(currentDate.isYesterday())
            }
            it("when subject is a tomorrow should return true") {
                let tomorrow = currentDate.date(by: [
                    .day: currentDate.day - 1,
                    .hour: 0,
                    .minute: 0,
                    .second: 0,
                    ])
                XCTAssertTrue(tomorrow.isYesterday())
            }
            it("when subject is a 2 days later should return false") {
                let laterDate = currentDate.date(by: [
                    .day: currentDate.day - 2,
                    .hour: 23,
                    .minute: 59,
                    .second: 59,
                    ])
                XCTAssertFalse(laterDate.isYesterday())
            }
        }
    }
}
