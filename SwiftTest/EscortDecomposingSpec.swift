import XCTest
import Quick
import AZDateBuilder

class EscortDecomposingSpec: QuickSpec {
    override func spec() {
        describe("era") {
            context("when 2010-10-10") {
                let currentDate = Date.date(by: [
                    .year: 2010,
                    .month: 10,
                    .day: 15,
                    ])
                it("gregorian calendar should return 1") {
                    Date.identifier = .gregorian
                    XCTAssertEqual(currentDate.era, 1)
                }
                it("japanese calendar should return 1") {
                    Date.identifier = .japanese
                    XCTAssertEqual(currentDate.era, 235)
                }
            }
            context("when Showa era") {
                let currentDate = Date.date(by: [
                    .year: 1988,
                    .month: 10,
                    .day: 11,
                    ])
                it("japanese calendar should return 63") {
                    Date.identifier = .japanese
                    XCTAssertEqual(currentDate.era, 234)
                }
            }
        }
        describe("year") {
            context("when 2010-10-10") {
                let currentDate = Date.date(by: [
                    .year: 2010,
                    .month: 10,
                    .day: 15,
                    ])
                it("gregorian calendar should return 2010") {
                    Date.identifier = .gregorian
                    XCTAssertEqual(currentDate.year, 2010)
                }
                it("japanese calendar should return 22") {
                    Date.identifier = .japanese
                    XCTAssertEqual(currentDate.year, 22)
                }
            }
            context("when Showa era") {
                let currentDate = Date.date(by: [
                    .year: 1988,
                    .month: 10,
                    .day: 11,
                    ])
                it("japanese calendar should return 63") {
                    Date.identifier = .japanese
                    XCTAssertEqual(currentDate.year, 63)
                }
            }
        }
        describe("month") {
            it("when 2010-10-11 should retuen 11") {
                let currentDate = Date.date(by: [
                    .year: 2010,
                    .month: 10,
                    .day: 11,
                    ])
                XCTAssertEqual(currentDate.month, 10)
            }
        }
        describe("day") {
            it("when 2010-10-11 should retuen 11") {
                let currentDate = Date.date(by: [
                    .year: 2010,
                    .month: 10,
                    .day: 11,
                    ])
                XCTAssertEqual(currentDate.day, 11)
            }
        }
        describe("minute") {
            it("when 01:02:03 should retuen 2") {
                let currentDate = Date.date(by: [
                    .year: 2010,
                    .month: 10,
                    .day: 11,
                    .hour: 1,
                    .minute: 2,
                    .second: 3,
                    ])
                XCTAssertEqual(currentDate.minute, 2)
                
            }
        }
        describe("second") {
            it("when 01:02:03 should retuen 3") {
                let currentDate = Date.date(by: [
                    .year: 2010,
                    .month: 10,
                    .day: 11,
                    .hour: 1,
                    .minute: 2,
                    .second: 3,
                    ])
                XCTAssertEqual(currentDate.second, 3)
            }
        }
        describe("weekday") {
            it("when 2010-01-01 should retuen 6") {
                let currentDate = Date.date(by: [
                    .year: 2010,
                    .month: 1,
                    .day: 1,
                    ])
                XCTAssertEqual(currentDate.weekday, 6)
            }
            it("when 2010-10-11 should retuen 2") {
                let currentDate = Date.date(by: [
                    .year: 2010,
                    .month: 10,
                    .day: 11,
                    ])
                XCTAssertEqual(currentDate.weekday, 2)
            }
        }
        describe("weekdayOrdinal") {
            it("when 2010-01-01 should retuen 1") {
                let currentDate = Date.date(by: [
                    .year: 2010,
                    .month: 1,
                    .day: 1,
                    ])
                XCTAssertEqual(currentDate.weekdayOrdinal, 1)
            }
            it("when 2010-10-07 should retuen 1") {
                let currentDate = Date.date(by: [
                    .year: 2010,
                    .month: 10,
                    .day: 7,
                    ])
                XCTAssertEqual(currentDate.weekdayOrdinal, 1)
            }
            it("when 2010-10-08 should retuen 2") {
                let currentDate = Date.date(by: [
                    .year: 2010,
                    .month: 10,
                    .day: 8,
                    ])
                XCTAssertEqual(currentDate.weekdayOrdinal, 2)
            }
            it("when 2010-10-14 should retuen 2") {
                let currentDate = Date.date(by: [
                    .year: 2010,
                    .month: 10,
                    .day: 14,
                    ])
                XCTAssertEqual(currentDate.weekdayOrdinal, 2)
            }
            it("when 2010-10-15 should retuen 3") {
                let currentDate = Date.date(by: [
                    .year: 2010,
                    .month: 10,
                    .day: 15,
                    ])
                XCTAssertEqual(currentDate.weekdayOrdinal, 3)
            }
        }
        describe("quarter") {
            it("when 2010-01 should retuen 0") {
                let currentDate = Date.date(by: [
                    .year: 2010,
                    .month: 1,
                    ])
                XCTAssertEqual(currentDate.quarter, 0)
            }
        }
        describe("weekOfMonth") {
            it("when 2010-10-09 should retuen 2") {
                let currentDate = Date.date(by: [
                    .year: 2010,
                    .month: 10,
                    .day: 9,
                    ])
                XCTAssertEqual(currentDate.weekOfMonth, 2)
            }
            it("when 2010-10-10 should retuen 3") {
                let currentDate = Date.date(by: [
                    .year: 2010,
                    .month: 10,
                    .day: 10,
                    ])
                XCTAssertEqual(currentDate.weekOfMonth, 3)
            }
            it("when 2010-10-16 should retuen 3") {
                let currentDate = Date.date(by: [
                    .year: 2010,
                    .month: 10,
                    .day: 16,
                    ])
                XCTAssertEqual(currentDate.weekOfMonth, 3)
            }
            it("when 2010-10-17 should retuen 4") {
                let currentDate = Date.date(by: [
                    .year: 2010,
                    .month: 10,
                    .day: 17,
                    ])
                XCTAssertEqual(currentDate.weekOfMonth, 4)
            }
            it("when 2010-10-31 should retuen 4") {
                let currentDate = Date.date(by: [
                    .year: 2010,
                    .month: 10,
                    .day: 31,
                    ])
                XCTAssertEqual(currentDate.weekOfMonth, 6)
            }
        }
        describe("weekOfYear") {
            it("when 2010-10-09 should retuen 41") {
                let currentDate = Date.date(by: [
                    .year: 2010,
                    .month: 10,
                    .day: 9,
                    ])
                XCTAssertEqual(currentDate.weekOfYear, 41)
            }
            it("when 2010-10-10 should retuen 42") {
                let currentDate = Date.date(by: [
                    .year: 2010,
                    .month: 10,
                    .day: 10,
                    ])
                XCTAssertEqual(currentDate.weekOfYear, 42)
            }
            it("when 2010-10-16 should retuen 42") {
                let currentDate = Date.date(by: [
                    .year: 2010,
                    .month: 10,
                    .day: 16,
                    ])
                XCTAssertEqual(currentDate.weekOfYear, 42)
            }
            it("when 2010-10-17 should retuen 43") {
                let currentDate = Date.date(by: [
                    .year: 2010,
                    .month: 10,
                    .day: 17,
                    ])
                XCTAssertEqual(currentDate.weekOfYear, 43)
            }
            it("when 2010-12-26 should retuen 1") {
                let currentDate = Date.date(by: [
                    .year: 2010,
                    .month: 12,
                    .day: 26,
                    ])
                XCTAssertEqual(currentDate.weekOfYear, 1)
            }
        }
        describe("yearForWeekOfYear") {
            it("when 2009-12-26 should retuen 2009") {
                let currentDate = Date.date(by: [
                    .year: 2009,
                    .month: 12,
                    .day: 26,
                    ])
                XCTAssertEqual(currentDate.yearForWeekOfYear, 2009)
            }
            it("when 2009-12-27 should retuen 2010") {
                let currentDate = Date.date(by: [
                    .year: 2009,
                    .month: 12,
                    .day: 27,
                    ])
                XCTAssertEqual(currentDate.yearForWeekOfYear, 2010)
            }
            it("when 2010-12-25 should retuen 2010") {
                let currentDate = Date.date(by: [
                    .year: 2010,
                    .month: 12,
                    .day: 25,
                    ])
                XCTAssertEqual(currentDate.yearForWeekOfYear, 2010)
            }
            it("when 2010-12-26 should retuen 2011") {
                let currentDate = Date.date(by: [
                    .year: 2010,
                    .month: 12,
                    .day: 26,
                    ])
                XCTAssertEqual(currentDate.yearForWeekOfYear, 2011)
            }
        }
        describe("nanosecond") {
            it("when 01:02:03.059 should retuen 59") {
                let currentDate = Date.date(by: [
                    .year: 2010,
                    .month: 10,
                    .day: 11,
                    .hour: 1,
                    .minute: 2,
                    .second: 3,
                    .nanosecond: 59,
                    ])
                XCTAssertEqual(currentDate.nanosecond, 59)
            }
        }
    }
}
