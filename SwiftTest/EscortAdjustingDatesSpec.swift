import XCTest
import Quick
import AZDateBuilder

class EscortAdjustingDatesSpec: QuickSpec {
    override func spec() {
        describe("add(day:)") {
            let currentDate = Date.date(by: [
                .year: 2010,
                .month: 10,
                .day: 11,
                .hour: 12,
                .minute: 13,
                .second: 14,
                ])
            it("add 0 day should return 2010-10-11") {
                XCTAssertEqual(currentDate, currentDate.add(day: 0))
            }
            it("add 1 day should return 2010-10-12") {
                let expectDate = Date.date(by: [
                    .year: 2010,
                    .month: 10,
                    .day: 12,
                    .hour: 12,
                    .minute: 13,
                    .second: 14,
                    ])
                XCTAssertEqual(expectDate, currentDate.add(day: 1))
            }
            it("add 30 days should return 2010-11-10") {
                let expectDate = Date.date(by: [
                    .year: 2010,
                    .month: 11,
                    .day: 10,
                    .hour: 12,
                    .minute: 13,
                    .second: 14,
                    ])
                XCTAssertEqual(expectDate, currentDate.add(day: 30))
            }
        }
        describe("add(hour:)") {
            let currentDate = Date.date(by: [
                .year: 2010,
                .month: 10,
                .day: 11,
                .hour: 12,
                .minute: 13,
                .second: 14,
                ])
            it("add 0 hour should return 2010-10-11 12") {
                XCTAssertEqual(currentDate, currentDate.add(hour: 0))
            }
            it("add 1 hour should return 2010-10-11 13") {
                let expectDate = Date.date(by: [
                    .year: 2010,
                    .month: 10,
                    .day: 11,
                    .hour: 13,
                    .minute: 13,
                    .second: 14,
                    ])
                XCTAssertEqual(expectDate, currentDate.add(hour: 1))
            }
            it("add 25 hours should return 2010-11-11 13") {
                let expectDate = Date.date(by: [
                    .year: 2010,
                    .month: 10,
                    .day: 12,
                    .hour: 13,
                    .minute: 13,
                    .second: 14,
                    ])
                XCTAssertEqual(expectDate, currentDate.add(hour: 25))
            }
        }
        describe("add(minute:)") {
            let currentDate = Date.date(by: [
                .year: 2010,
                .month: 10,
                .day: 11,
                .hour: 12,
                .minute: 13,
                .second: 14,
                ])
            it("add 0 minute should return 2010-10-11 12:13") {
                XCTAssertEqual(currentDate, currentDate.add(minute: 0))
            }
            it("add 1 minute should return 2010-10-11 12:14") {
                let expectDate = Date.date(by: [
                    .year: 2010,
                    .month: 10,
                    .day: 11,
                    .hour: 12,
                    .minute: 14,
                    .second: 14,
                    ])
                XCTAssertEqual(expectDate, currentDate.add(minute: 1))
            }
            it("add 60 minutes should return 2010-10-11 13:13") {
                let expectDate = Date.date(by: [
                    .year: 2010,
                    .month: 10,
                    .day: 11,
                    .hour: 13,
                    .minute: 13,
                    .second: 14,
                    ])
                XCTAssertEqual(expectDate, currentDate.add(minute: 60))
            }
        }
        describe("startDateOfYear") {
            let currentDate = Date.date(by: [
                .year: 2010,
                .month: 10,
                .day: 11,
                .hour: 12,
                .minute: 13,
                .second: 14,
                ])
            it("should return 2010-01-01 00:00:00") {
                let expectDate = Date.date(by: [
                    .year: 2010,
                    .month: 1,
                    .day: 1,
                    .hour: 0,
                    .minute: 0,
                    .second: 0,
                    ])
                XCTAssertEqual(expectDate, currentDate.startDateOfYear())
            }
        }
        describe("startDateOfMonth") {
            let currentDate = Date.date(by: [
                .year: 2010,
                .month: 10,
                .day: 11,
                .hour: 12,
                .minute: 13,
                .second: 14,
                ])
            it("should return 2010-10-01 00:00:00") {
                let expectDate = Date.date(by: [
                    .year: 2010,
                    .month: 10,
                    .day: 1,
                    .hour: 0,
                    .minute: 0,
                    .second: 0,
                    ])
                XCTAssertEqual(expectDate, currentDate.startDateOfMonth())
            }
        }
        describe("startDateOfWeek") {
            let currentDate = Date.date(by: [
                .year: 2010,
                .month: 10,
                .day: 11,
                .hour: 12,
                .minute: 13,
                .second: 14,
                ])
            it("should return 2010-10-10 00:00:00") {
                let expectDate = Date.date(by: [
                    .year: 2010,
                    .month: 10,
                    .day: 10,
                    .hour: 0,
                    .minute: 0,
                    .second: 0,
                    ])
                XCTAssertEqual(expectDate, currentDate.startDateOfWeekday())
            }
        }
        describe("startDateOfDay") {
            let currentDate = Date.date(by: [
                    .year: 2010,
                    .month: 10,
                    .day: 11,
                    .hour: 12,
                    .minute: 13,
                    .second: 14,
                    ])
            it("should return 2010-10-11 00:00:00") {
                let expectDate = Date.date(by: [
                    .year: 2010,
                    .month: 10,
                    .day: 11,
                    .hour: 0,
                    .minute: 0,
                    .second: 0,
                    ])
                XCTAssertEqual(expectDate, currentDate.startDateOfDay())
            }
        }
    }
}
