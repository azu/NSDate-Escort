//
//  EscortComparingSpec..swift
//  Date-Escort
//
//  Created by akuraru on 2016/10/04.
//
//

import Foundation
import Quick
import Nimble
//import Date_Escort

class EscortComparingSpec: QuickSpec {
    override func spec() {
        describe("-isEqualToDateIgnoringTime") {
            let currentDate = Date()
            context("when same the date") {
                it("should be true") {
                    let isMatch = currentDate.isEqualToDateIgnoringTime(currentDate)
                    expect(isMatch).to(beTrue())
                }
            }
            context("when target is today") {
                it("should be true") {
                    let beginOfDate = currentDate.build(
                        hour: 0,
                        minute: 0,
                        second: 0
                    )
                    let endOfDate = currentDate.build(
                        hour: 23,
                        minute: 59,
                        second: 59
                    )
                    let isMatch_begin = beginOfDate.isEqualToDateIgnoringTime(currentDate)
                    let isMatch_end = endOfDate.isEqualToDateIgnoringTime(currentDate)
                    expect(isMatch_begin).to(beTrue())
                    expect(isMatch_end).to(beTrue())
                }
            }
            context("when target is a later day") {
                it("should be false") {
                    let laterDate = currentDate.build(
                        day: (currentDate.day() + 1),
                        hour: 0,
                        minute: 0,
                        second: 0
                    )
                    let isMatch = laterDate.isEqualToDateIgnoringTime(currentDate)
                    expect(isMatch).to(beFalse())
                }
            }
            context("when target is a earler day") {
                it("should be false") {
                    let laterDate = currentDate.build(
                        day: (currentDate.day() - 1),
                        hour: 23,
                        minute: 59,
                        second: 59
                    )
                    let isMatch = laterDate.isEqualToDateIgnoringTime(currentDate)
                    expect(isMatch).to(beFalse())
                }
            }
            context("when target is previous era") {
                let currentDate = Date.build(
                    year: 2014,
                    month: 5,
                    day: 19
                )
                let previousEraDate = Date.build(
                    year: -2013,
                    month: 5,
                    day: 19
                )
                it("shuold be equal year") {
                    expect(currentDate.year()).to(equal(previousEraDate.year()))
                }
                it("should be false") {
                    let isMatch = previousEraDate.isEqualToDateIgnoringTime(currentDate)
                    expect(isMatch).to(beFalse())
                }
            }
        }
        describe("-isToday") {
            let currentDate = Date()
            context("when suject is same date") {
                it("should be true") {
                    let match = currentDate.isToday()
                    expect(match).to(beTrue())
                }
            }
            context("when subject is a later day") {
                it("should be false") {
                    let laterDate = currentDate.build(
                        day: (currentDate.day() + 1),
                        hour: 0,
                        minute: 0,
                        second: 0
                    )
                    let isMatch = laterDate.isToday()
                    expect(isMatch).to(beFalse())
                }
            }
            context("when subject is a earler day") {
                it("should be false") {
                    let laterDate = currentDate.build(
                        day: (currentDate.day() - 1),
                        hour: 23,
                        minute: 59,
                        second: 59
                    )
                    let isMatch = laterDate.isToday()
                    expect(isMatch).to(beFalse())
                }
            }
        }
        describe("-isTomorrow") {
            let currentDate = Date()
            context("when suject is same date") {
                it("should be false") {
                    let match = currentDate.isTomorrow()
                    expect(match).to(beFalse())
                }
            }
            context("when subject is a tomorrow") {
                it("should be true") {
                    let laterDate = currentDate.build(
                        day: (currentDate.day() + 1),
                        hour: 0,
                        minute: 0,
                        second: 0
                    )
                    let isMatch = laterDate.isTomorrow()
                    expect(isMatch).to(beTrue())
                }
            }
            context("when subject is 2day later") {
                it("should be false") {
                    let laterDate = currentDate.build(
                        day : (currentDate.day() + 2),
                        hour: 0,
                        minute: 0,
                        second: 0
                    )
                    let isMatch = laterDate.isTomorrow()
                    expect(isMatch).to(beFalse())
                }
            }
        }
        describe("-isYesterday") {
            let currentDate = Date()
            context("when suject is same date") {
                it("should be false") {
                    let match = currentDate.isYesterday()
                    expect(match).to(beFalse())
                }
            }
            context("when subject is a yesterday") {
                it("should be true") {
                    let laterDate = currentDate.build(
                        day : (currentDate.day() - 1),
                        hour: 0,
                        minute: 0,
                        second: 0
                    )
                    let isMatch = laterDate.isYesterday()
                    expect(isMatch).to(beTrue())
                }
            }
            context("when subject is 2day ago") {
                it("should be false") {
                    let laterDate = currentDate.build(
                        day : (currentDate.day() - 2),
                        hour: 0,
                        minute: 0,
                        second: 0
                    )
                    let isMatch = laterDate.isYesterday()
                    expect(isMatch).to(beFalse())
                }
            }
        }
        describe("-isSameWeekAsDate") {
            context("today is 2010-10-10") {
                let currentDate = Date.build(
                    year: 2010,
                    month: 10,
                    day: 10
                )
                context("same week") {
                    it("should be true") {
                        let match = currentDate.isSameWeek(as: currentDate)
                        expect(match).to(beTrue())
                    }
                }
                context("next day (monday)") {
                    it("should be true") {
                        let match = currentDate.isSameWeek(as: currentDate.add(day: 1))
                        expect(match).to(beTrue())
                    }
                }
                context("when same the week, but difference year") {
                    let nextYearDate = currentDate.build(
                        year : (currentDate.year() + 1)
                    )
                    it("should be false") {
                        let match = nextYearDate.isSameWeek(as: currentDate)
                        expect(match).to(beFalse())
                    }
                }
                context("next week") {
                    let nextWeekDate = currentDate.add(day: DAYS_IN_WEEK)
                    it("should be false") {
                        let match = nextWeekDate.isSameWeek(as: currentDate)
                        expect(match).to(beFalse())
                    }
                }
                context("last week") {
                    let prevWeekDate = currentDate.add(day: DAYS_IN_WEEK)
                    it("should be false") {
                        let match = prevWeekDate.isSameWeek(as: currentDate)
                        expect(match).to(beFalse())
                    }
                }
            }
            context("today is 2015-03-30") {
                let currentDate = Date.build(
                    year: 2015,
                    month: 3,
                    day: 30
                )
                context("same week") {
                    it("should be true") {
                        let match = currentDate.isSameWeek(as: currentDate)
                        expect(match).to(beTrue())
                    }
                }
                context("within this week") {
                    // weekday 1...7
                    context("firstOfWeek") {
                        let firstOfWeek = currentDate.build(
                            day: (currentDate.firstDayOfWeekday())
                        )
                        it("should be true") {
                            let match_first = firstOfWeek.isSameWeek(as: currentDate)
                            expect(match_first).to(beTrue())
                        }
                    }
                    context("endOfWeek") {
                        let lastOfWeek = currentDate.build(
                            month: 4,
                            day: 4
                        )
                        it("should be true") {
                            let match_last = lastOfWeek.isSameWeek(as: currentDate)
                            expect(match_last).to(beTrue())
                        }
                    }
                }
                context("when same the week, but difference year") {
                    let nextYearDate = currentDate.build(
                        year : (currentDate.year() + 1)
                    )
                    it("should be false") {
                        let match = nextYearDate.isSameWeek(as: currentDate)
                        expect(match).to(beFalse())
                    }
                }
                context("next week") {
                    let nextWeekDate = currentDate.add(day: DAYS_IN_WEEK)
                    it("should be false") {
                        let match = nextWeekDate.isSameWeek(as: currentDate)
                        expect(match).to(beFalse())
                    }
                }
                context("last week") {
                    let prevWeekDate = currentDate.add(day: -(DAYS_IN_WEEK))
                    it("should be false") {
                        let match = prevWeekDate.isSameWeek(as: currentDate)
                        expect(match).to(beFalse())
                    }
                }
            }
        }
        describe("-isThisWeek") {
            let currentDate = Date()
            context("same week") {
                it("should be true") {
                    let match = currentDate.isThisWeek()
                    expect(match).to(beTrue())
                }
            }
            context("within this week") {
                context("firstOfWeek") {
                    it("should be true") {
                        // weekday 1...7
                        let firstOfWeek = currentDate.build(
                            day : (currentDate.firstDayOfWeekday())
                        )
                        let match_first = firstOfWeek.isThisWeek()
                        expect(match_first).to(beTrue())
                    }
                }
                context("endOfWeek") {
                    it("should be true") {
                        let lastOfWeek = currentDate.build(
                            day : (currentDate.lastDayOfWeekday())
                        )
                        let match_last = lastOfWeek.isThisWeek()
                        expect(match_last).to(beTrue())
                    }
                }
            }
            context("next week") {
                let nextWeekDate = currentDate.add(day: DAYS_IN_WEEK)
                it("should be false") {
                    let match = nextWeekDate.isThisWeek()
                    expect(match).to(beFalse())
                }
            }
            context("last week") {
                let prevWeekDate = currentDate.add(day: -DAYS_IN_WEEK)
                it("should be false") {
                    let match = prevWeekDate.isThisWeek()
                    expect(match).to(beFalse())
                }
            }
        }
        describe("-isNextWeek") {
            let currentDate = Date()
            context("within this week") {
                context("at endOfWeek") {
                    it("should be false") {
                        let endOfWeek = currentDate.build(
                            day : (currentDate.lastDayOfWeekday())
                        )
                        let match = endOfWeek.isNextWeek()
                        expect(match).to(beFalse())
                    }
                }
            }
            context("next week") {
                let nextWeekDate = currentDate.add(day: DAYS_IN_WEEK)
                it("should be true") {
                    let match = nextWeekDate.isNextWeek()
                    expect(match).to(beTrue())
                }
            }
            context("two weeks later") {
                let nextWeekDate = currentDate.add(day: DAYS_IN_WEEK * 2)
                it("should be false") {
                    let match = nextWeekDate.isNextWeek()
                    expect(match).to(beFalse())
                }
            }
        }
        describe("-isLastWeek") {
            let currentDate = Date()
            context("within this week") {
                context("at startOfWeek") {
                    it("should be false") {
                        let lastOfWeek = currentDate.build(
                            day : (currentDate.firstDayOfWeekday())
                        )
                        let match = lastOfWeek.isLastWeek()
                        expect(match).to(beFalse())
                    }
                }
            }
            context("when last week") {
                let prevWeekDate = currentDate.add(day: -DAYS_IN_WEEK)
                it("should be true") {
                    let match = prevWeekDate.isLastWeek()
                    expect(match).to(beTrue())
                }
            }
            context("when two weeks ago") {
                let prevWeekDate = currentDate.add(day: DAYS_IN_WEEK * 2)
                it("should be false") {
                    let match = prevWeekDate.isLastWeek()
                    expect(match).to(beFalse())
                }
            }
        }
        describe("-isSameMonthAsDate") {
            context("today is 2010-10-10 ") {
                let currentDate = Date()
                context("within this month") {
                    context("at start of month") {
                        it("should be yes") {
                            let startOfMonth = currentDate.startOfMonth()
                            let match = currentDate.isSameMonth(as: startOfMonth)
                            expect(match).to(beTrue())
                        }
                    }
                    context("at end of month") {
                        it("should be yes") {
                            let endOfMonth = currentDate.endOfMonth()
                            let match = currentDate.isSameMonth(as: endOfMonth)
                            expect(match).to(beTrue())
                        }
                    }
                }
                context("next month") {
                    let nextMonth = Date().add(month: 1)
                    it("should be false") {
                        let match = currentDate.isSameMonth(as: nextMonth)
                        expect(match).to(beFalse())
                    }
                }
                context("last month") {
                    let lastMonth = Date().add(month: -1)
                    it("should be false") {
                        let match = currentDate.isSameMonth(as: lastMonth)
                        expect(match).to(beFalse())
                    }
                }
                context("next year") {
                    let nextYear = Date().add(year: 1)
                    it("should be false") {
                        let match = currentDate.isSameMonth(as: nextYear)
                        expect(match).to(beFalse())
                    }
                }
            }
        }
        describe("-isThisMonth") {
            let currentDate = Date()
            context("when sameMonth as Date") {
                it("should be true") {
                    let match = currentDate.isThisMonth()
                    expect(match).to(beTrue())
                }
            }
        }
        describe("-isSameYearAsDate") {
            let currentDate = Date()
            context("within this year") {
                context("today is date") {
                    context("at start of year") {
                        let startOfYear = currentDate.startOfYear()
                        it("should be yes") {
                            let match = currentDate.isSameYear(as: startOfYear)
                            expect(match).to(beTrue())
                        }
                    }
                    context("at end of year") {
                        let endOfYear = currentDate.endOfYear()
                        it("should be yes") {
                            let match = currentDate.isSameYear(as: endOfYear)
                            expect(match).to(beTrue())
                        }
                    }
                }
            }
        }
        describe("-isThisYear") {
            let currentDate = Date()
            context("within this year") {
                it("should be true") {
                    let match = currentDate.isThisYear()
                    expect(match).to(beTrue())
                }
            }
            context("other year") {
                let otherYearDate = currentDate.add(year: 10)
                it("should be false") {
                    let match = otherYearDate.isThisYear()
                    expect(match).to(beFalse())
                }
            }
        }
        describe("-isNextYear") {
            context("today is 2010-10-10") {
                let currentDate = Date()
                context("this week") {
                    it("should be false") {
                        let match = currentDate.isNextYear()
                        expect(match).to(beFalse())
                    }
                }
                context("next year") {
                    let nextYear = currentDate.build(
                        year : (currentDate.year() + 1)
                    )
                    it("should be true") {
                        let match = nextYear.isNextYear()
                        expect(match).to(beTrue())
                    }
                }
                context("one years later") {
                    let twoYearsLater = currentDate.build(
                        year : (currentDate.year() + 2)
                    )
                    it("should be false") {
                        let match = twoYearsLater.isNextYear()
                        expect(match).to(beFalse())
                    }
                }
            }
        }
        describe("-isLastYear") {
            context("today is 2010-10-10") {
                let currentDate = Date()
                context("this week") {
                    it("should be false") {
                        let match = currentDate.isLastYear()
                        expect(match).to(beFalse())
                    }
                }
                context("last year") {
                    let lastYear = currentDate.build(
                        year : (currentDate.year() - 1)
                    )
                    it("should be true") {
                        let match = lastYear.isLastYear()
                        expect(match).to(beTrue())
                    }
                }
                context("two years ago") {
                    let twoYearsAgo = currentDate.build(
                        year : (currentDate.year() - 2)
                    )
                    it("should be false") {
                        let match = twoYearsAgo.isLastYear()
                        expect(match).to(beFalse())
                    }
                }
            }
        }
        describe("-isEarlierThanDate") {
            let currentDate = Date().build(
                year: 2010,
                month: 10,
                day: 10,
                hour: 10,
                minute: 10,
                second: 10
            )
            context("when same time") {
                it("should be false") {
                    let match = currentDate.isEarlier(than: currentDate)
                    expect(match).to(beFalse())
                }
            }
            context("when earlier date") {
                let earlierDate = currentDate.add(second: -1)
                it("should be true") {
                    let match = earlierDate.isEarlier(than: currentDate)
                    expect(match).to(beTrue())
                }
            }
            context("when later date") {
                let laterDate = currentDate.add(second: 1)
                it("should be false") {
                    let match = laterDate.isEarlier(than: currentDate)
                    expect(match).to(beFalse())
                }
            }
        }
        describe("-isLaterThanDate") {
            let currentDate = Date.build(
                year: 2010,
                month: 10,
                day: 10,
                hour: 10,
                minute: 10,
                second: 10
            )
            context("when same time") {
                it("should be false") {
                    let match = currentDate.isLater(than: currentDate)
                    expect(match).to(beFalse())
                }
            }
            context("when earlier date") {
                let earlierDate = currentDate.add(second: -1)
                it("should be false") {
                    let match = earlierDate.isLater(than: currentDate)
                    expect(match).to(beFalse())
                }
            }
            context("when later date") {
                let laterDate = currentDate.add(second: 1)
                it("should be true") {
                    let match = laterDate.isLater(than: currentDate)
                    expect(match).to(beTrue())
                }
            }
        }
        describe("-isEarlierThanOrEqualDate") {
            let currentDate = Date()
            context("when same time") {
                it("should be false") {
                    let match = currentDate.isEarlier(thanOrEqual: currentDate)
                    expect(match).to(beTrue())
                }
            }
            context("when earlier date") {
                let earlierDate = currentDate.add(second: -1)
                it("should be true") {
                    let match = earlierDate.isEarlier(thanOrEqual: currentDate)
                    expect(match).to(beTrue())
                }
            }
            context("when later date") {
                let laterDate = currentDate.add(second: 1)
                it("should be false") {
                    let match = laterDate.isEarlier(thanOrEqual: currentDate)
                    expect(match).to(beFalse())
                }
            }
        }
        describe("-isLaterThanOrEqualDate") {
            let currentDate = Date()
            context("when same time") {
                it("should be true") {
                    let match = currentDate.isLater(thanOrEqual: currentDate)
                    expect(match).to(beTrue())
                }
            }
            context("when earlier date") {
                let earlierDate = currentDate.add(second: -1)
                it("should be false") {
                    let match = earlierDate.isLater(thanOrEqual: currentDate)
                    expect(match).to(beFalse())
                }
            }
            context("when later date") {
                let laterDate = currentDate.add(second: 1)
                it("should be true") {
                    let match = laterDate.isLater(thanOrEqual: currentDate)
                    expect(match).to(beTrue())
                }
            }
        }
        describe("-isInPast") {
            let currentDate = Date()
            context("when same time") {
                it("should be false") {
                    let match = currentDate.isInPast()
                    expect(match).to(beTrue())
                }
            }
            context("when earlier date") {
                let earlierDate = currentDate.add(second: -1)
                it("should be true") {
                    let match = earlierDate.isInPast()
                    expect(match).to(beTrue())
                }
            }
        }
    }
}
//
//describe("-isInFuture") {
//    let currentDate;
//    beforeEach(^{
//        currentDate = Date.build(
//            year: 2010,
//            month: 10,
//            day: 10,
//            hour: 10,
//            minute: 10,
//            second: 10,
//        )
//        [FakeDateUtil stubCurrentDate:currentDate];
//        }
//    context("when same time") {
//        it("should be false") {
//            let match = currentDate.isInFuture()
//            expect(match).to(beFalse())
//            }
//        }
//    context("when later date") {
//        let laterDate;
//        beforeEach(^{
//            laterDate = currentDate.add(second: 1)
//            }
//        it("should be true") {
//            let match = laterDate.isInFuture()
//            expect(match).to(beTrue())
//            }
//        }
//    }
