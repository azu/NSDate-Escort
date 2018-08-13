import XCTest
import Quick
import AZDateBuilder

class EscortRetrievingIntervalsSpec: QuickSpec {
    override func spec() {
        describe("seconds(after:)") {
            let currentDate = Date.date(by: [
                .year: 2010,
                .month: 10,
                .day: 11,
                .hour: 12,
                .minute: 13,
                .second: 14,
                ])
            it("after 5 seconds should return 5") {
                let anotherDate = currentDate.add(second: 5)
                XCTAssertEqual(currentDate.seconds(after: anotherDate), 5)
            }
            it("after 10 minutes should return 600") {
                let anotherDate = currentDate.add(minute: 10)
                XCTAssertEqual(currentDate.seconds(after: anotherDate), 600)
            }
        }
        describe("minute(after:)") {
            let currentDate = Date.date(by: [
                .year: 2010,
                .month: 10,
                .day: 11,
                .hour: 12,
                .minute: 13,
                .second: 14,
                ])
            it("after 5 miuntes should return 5") {
                let anotherDate = currentDate.add(minute: 5)
                XCTAssertEqual(currentDate.minutes(after: anotherDate), 5)
            }
            it("after 10 hours should return 600") {
                let anotherDate = currentDate.add(hour: 10)
                XCTAssertEqual(currentDate.minutes(after: anotherDate), 600)
            }
        }
        describe("hours(after:)") {
            let currentDate = Date.date(by: [
                .year: 2010,
                .month: 10,
                .day: 11,
                .hour: 12,
                .minute: 13,
                .second: 14,
                ])
            it("after 5 hours should return 5") {
                let anotherDate = currentDate.add(hour: 5)
                XCTAssertEqual(currentDate.hours(after: anotherDate), 5)
            }
            it("after 1 days should return 24") {
                let anotherDate = currentDate.add(day: 1)
                XCTAssertEqual(currentDate.hours(after: anotherDate), 24)
            }
        }
        describe("days(after:)") {
            let currentDate = Date.date(by: [
                .year: 2010,
                .month: 10,
                .day: 11,
                .hour: 12,
                .minute: 13,
                .second: 14,
                ])
            it("after 5 days should return 5") {
                let anotherDate = currentDate.add(day: 5)
                XCTAssertEqual(currentDate.days(after: anotherDate), 5)
            }
            it("after 2 months should return 61") {
                let anotherDate = currentDate.add(month: 2)
                XCTAssertEqual(currentDate.days(after: anotherDate), 61)
            }
        }
        describe("months(after:)") {
            let currentDate = Date.date(by: [
                .year: 2010,
                .month: 10,
                .day: 11,
                .hour: 12,
                .minute: 13,
                .second: 14,
                ])
            it("after 5 months should return 5") {
                let anotherDate = currentDate.add(month: 5)
                XCTAssertEqual(currentDate.months(after: anotherDate), 5)
            }
            it("after 2 years should return 24") {
                let anotherDate = currentDate.add(year: 2)
                XCTAssertEqual(currentDate.months(after: anotherDate), 24)
            }
        }
        describe("years(after:)") {
            let currentDate = Date.date(by: [
                .year: 2010,
                .month: 10,
                .day: 11,
                .hour: 12,
                .minute: 13,
                .second: 14,
                ])
            it("after 5 years should return 5") {
                let anotherDate = currentDate.add(year: 5)
                XCTAssertEqual(currentDate.years(after: anotherDate), 5)
            }
        }
    }
}
