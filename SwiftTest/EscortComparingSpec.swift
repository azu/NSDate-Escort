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
        describe("isSameWeekAsDate") {
            context("today is 2010-10-10") {
                let currentDate = Date.date(by: [
                    .year: 2010,
                    .month: 10,
                    .day: 10,
                    ])
                it("same date should return false") {
                    XCTAssertTrue(currentDate.isSameWeek(as: currentDate))
                }
                context("next day (monday)") {
                    context("firstWeekday is sunday") {
                        beforeEach {
                            var beginingOfMondayCalendar = Calendar(identifier: .gregorian)
                            beginingOfMondayCalendar.firstWeekday = 1
                            Date._currentCalendar = beginingOfMondayCalendar
                            Date.identifier = .gregorian
                        }
                        afterEach {
                            Date._currentCalendar = nil
                            Date.identifier = nil
                        }
                        it("should return true") {
                            XCTAssertTrue(currentDate.isSameWeek(as: currentDate.add(day: 1)))
                        }
                    }
                    context("firstWeekday is monday") {
                        beforeEach {
                            var beginingOfMondayCalendar = Calendar(identifier: .gregorian)
                            beginingOfMondayCalendar.firstWeekday = 2
                            Date._currentCalendar = beginingOfMondayCalendar
                            Date.identifier = .gregorian
                        }
                        afterEach {
                            Date._currentCalendar = nil
                            Date.identifier = nil
                        }
                        it("should return true") {
                            XCTAssertFalse(currentDate.isSameWeek(as: currentDate.add(day: 1)))
                        }
                    }
                }
                context("within this week") {
                    it("firstOfWeek should return true") {
                        XCTAssertTrue(currentDate.isSameWeek(as: currentDate.startDateOfWeekday()))
                    }
                    it("endOfWeek should return true") {
                        XCTAssertTrue(currentDate.isSameWeek(as: currentDate.endDateOfWeekday()))
                    }
                }
                it("when same the week, but difference year should return false") {
                    XCTAssertFalse(currentDate.isSameWeek(as: currentDate.add(year: 1)))
                }
                it("next week should return false") {
                    XCTAssertFalse(currentDate.isSameWeek(as: currentDate.addingTimeInterval(currentDate.date(of: .weekOfYear).interval)))
                }
                it("last week should return false") {
                    XCTAssertFalse(currentDate.isSameWeek(as: currentDate.addingTimeInterval(-(currentDate.date(of: .weekOfYear).interval))))
                }
            }
            context("today is 2015-03-30") {
                let currentDate = Date.date(by: [
                    .year: 2015,
                    .month: 3,
                    .day: 30,
                    ])
                it("same date should return false") {
                    XCTAssertTrue(currentDate.isSameWeek(as: currentDate))
                }
                context("within this week") {
                    it("firstOfWeek should return true") {
                        XCTAssertTrue(currentDate.isSameWeek(as: currentDate.startDateOfWeekday()))
                    }
                    it("endOfWeek should return true") {
                        XCTAssertTrue(currentDate.isSameWeek(as: currentDate.endDateOfWeekday()))
                    }
                }
                it("when same the week, but difference year should return false") {
                    XCTAssertFalse(currentDate.isSameWeek(as: currentDate.add(year: 1)))
                }
                it("next week should return false") {
                    XCTAssertFalse(currentDate.isSameWeek(as: currentDate.addingTimeInterval(currentDate.date(of: .weekOfYear).interval)))
                }
                it("last week should return false") {
                    XCTAssertFalse(currentDate.isSameWeek(as: currentDate.addingTimeInterval(-(currentDate.date(of: .weekOfYear).interval))))
                }
            }
            context("today is 1989-01-07") {
                let currentDate = Date.date(by: [
                    .year: 1989,
                    .month: 1,
                    .day: 7,
                    ])
                beforeEach {
                    var beginingOfMondayCalendar = Calendar(identifier: .japanese)
                    beginingOfMondayCalendar.firstWeekday = 2
                    Date._currentCalendar = beginingOfMondayCalendar
                    Date.identifier = .japanese
                }
                afterEach {
                    Date._currentCalendar = nil
                    Date.identifier = nil
                }
                it("next era of same week should return true") {
                    XCTAssertTrue(currentDate.isSameWeek(as: currentDate.add(day: 1)))
                }
            }
        }
        describe("isThisWeek") {
            let currentDate = Date()
            it("when now should return true") {
                XCTAssertTrue(currentDate.isThisWeek())
            }
            it("when start date of weekday should return true") {
                XCTAssertTrue(currentDate.startDateOfWeekday().isThisWeek())
            }
            it("when end date of weekday should return true") {
                XCTAssertTrue(currentDate.endDateOfWeekday().isThisWeek())
            }
            it("when last week should return false") {
                XCTAssertFalse(currentDate.startDateOfWeekday().addingTimeInterval(-1).isThisWeek())
            }
            it("when next week should return false") {
                XCTAssertFalse(currentDate.endDateOfWeekday().addingTimeInterval(1).isThisWeek())
            }
        }
        describe("isNextWeek") {
            let currentDate = Date().add(weekOfYear: 1)
            it("when next week should return true") {
                XCTAssertTrue(currentDate.isNextWeek())
            }
            it("when start date of weekday should return true") {
                XCTAssertTrue(currentDate.startDateOfWeekday().isNextWeek())
            }
            it("when end date of weekday should return true") {
                XCTAssertTrue(currentDate.endDateOfWeekday().isNextWeek())
            }
            it("when last week should return false") {
                XCTAssertFalse(currentDate.startDateOfWeekday().addingTimeInterval(-1).isNextWeek())
            }
            it("when next week should return false") {
                XCTAssertFalse(currentDate.endDateOfWeekday().addingTimeInterval(1).isNextWeek())
            }
        }
        describe("isLastWeek") {
            let currentDate = Date().add(weekOfYear: -1)
            it("when next week should return true") {
                XCTAssertTrue(currentDate.isLastWeek())
            }
            it("when start date of weekday should return true") {
                XCTAssertTrue(currentDate.startDateOfWeekday().isLastWeek())
            }
            it("when end date of weekday should return true") {
                XCTAssertTrue(currentDate.endDateOfWeekday().isLastWeek())
            }
            it("when last week should return false") {
                XCTAssertFalse(currentDate.startDateOfWeekday().addingTimeInterval(-1).isLastWeek())
            }
            it("when next week should return false") {
                XCTAssertFalse(currentDate.endDateOfWeekday().addingTimeInterval(1).isLastWeek())
            }
        }
        describe("isSameMonthAsDate") {
            context("today is 2010-10-10") {
                let currentDate = Date.date(by: [
                    .year: 2010,
                    .month: 10,
                    .day: 10,
                    ])
                it("same day should return true") {
                    XCTAssertTrue(currentDate.isSameMonth(as: currentDate))
                }
                it("with in this month at start of month should return true") {
                    XCTAssertTrue(currentDate.isSameMonth(as: currentDate.startDateOfMonth()))
                }
                it("with in this month at end of month should return true") {
                    XCTAssertTrue(currentDate.isSameMonth(as: currentDate.endDateOfMonth()))
                }
                it("with in last month at end of month should return false") {
                    XCTAssertFalse(currentDate.isSameMonth(as: currentDate.startDateOfMonth().addingTimeInterval(-1)))
                }
                it("with in next month at start of month should return false") {
                    XCTAssertFalse(currentDate.isSameMonth(as: currentDate.endDateOfMonth().addingTimeInterval(1)))
                }
                it("next year should return false") {
                    XCTAssertFalse(currentDate.isSameMonth(as: currentDate.add(year: 1)))
                }
            }
            context("today is 1989-01-07") {
                let currentDate = Date.date(by: [
                    .year: 1989,
                    .month: 1,
                    .day: 7,
                    ])
                beforeEach {
                    Date.identifier = .japanese
                }
                afterEach {
                    Date.identifier = nil
                }
                it("next era of same month should return true") {
                    XCTAssertTrue(currentDate.isSameMonth(as: currentDate.add(day: 1)))
                }
            }
            context("today is 2010-02-13") {
                let currentDate = Date.date(by: [
                    .year: 2010,
                    .month: 2,
                    .day: 13,
                    ])
                beforeEach {
                    Date.identifier = .chinese
                }
                afterEach {
                    Date.identifier = nil
                }
                it("next era of same month should return true") {
                    XCTAssertTrue(currentDate.isSameMonth(as: currentDate.add(day: 1)))
                }
            }
        }
        describe("isThisMonth") {
            let currentDate = Date()
            it("when sameMonth as Date should return true") {
                XCTAssertTrue(currentDate.isThisMonth())
            }
        }
    }
}
