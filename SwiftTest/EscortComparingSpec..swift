//
//  EscortComparingSpec..swift
//  NSDate-Escort
//
//  Created by akuraru on 2016/10/04.
//
//

import Foundation
import Quick
import Nimble
import NSDate_Escort

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
        }
    }
}
//describe("-isYesterday") {
//    let currentDate = Date()
//    beforeEach(^{
//        [FakeDateUtil stubCurrentDate:currentDate];
//        }
//    context("when suject is same date") {
//        it("should be false") {
//            let match = currentDate.isYesterday()
//            expect(match).to(beFalse())
//            }
//        }
//    context("when subject is a yesterday") {
//        it("should be true") {
//            let laterDate = currentDate.build(
//                day : (currentDate.day() - 1),
//                hour: 0,
//                minute: 0,
//                second: 0,
//            )
//            let isMatch = laterDate.isYesterday()
//            expect(isMatch).to(beTrue())
//            }
//        }
//    context("when subject is 2day ago") {
//        it("should be false") {
//            let laterDate = currentDate.build(
//                day : (currentDate.day() - 2),
//                hour: 0,
//                minute: 0,
//                second: 0,
//            )
//            let isMatch = laterDate.isYesterday()
//            expect(isMatch).to(beFalse())
//            }
//        }
//    }
//describe("-isSameWeekAsDate") {
//    context("today is 2010-10-10") {
//        __block let currentDate;
//        beforeEach(^{
//            currentDate = NSDate.build(
//                year: 2010,
//                month: 10,
//                day: 10,
//            )
//            [FakeDateUtil stubCurrentDate:currentDate];
//            }
//        context("same week") {
//            it("should be true") {
//                let match = currentDate.isSameWeekAsDate(currentDate)
//                expect(match).to(beTrue())
//                }
//            }
//        context("next day (monday)") {
//            context("firstWeekday is sunday") {
//                beforeEach(^{
//                    NSCalendar *beginingOfMondayCalendar = [NSCalendar.alloc() initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
//                    beginingOfMondayCalendar.firstWeekday = 1;
//                    [NSDate stub:selector(AZ_currentCalendar) andReturn:beginingOfMondayCalendar];
//                    }
//                it("should be true") {
//                    let match = [currentDate isSameWeekAsDate:[currentDate dateByAddingDays:1]];
//                    expect(match).to(beTrue())
//                    }
//                }
//            context("firstWeekday is monday") {
//                beforeEach(^{
//                    NSCalendar *beginingOfMondayCalendar = [NSCalendar.alloc() initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
//                    beginingOfMondayCalendar.firstWeekday = 2;
//                    [NSDate stub:selector(AZ_currentCalendar) andReturn:beginingOfMondayCalendar];
//                    }
//                it("should be true") {
//                    let match = [currentDate isSameWeekAsDate:[currentDate dateByAddingDays:1]];
//                    expect(match).to(beFalse())
//                    }
//                }
//            }
//        context("within this week") {
//            // weekday 1...7
//            beforeEach(^{
//                NSCalendar *beginingOfMondayCalendar = [NSCalendar.alloc() initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
//                beginingOfMondayCalendar.firstWeekday = 2;
//                [NSDate stub:selector(AZ_currentCalendar) andReturn:beginingOfMondayCalendar];
//                }
//            context("firstOfWeek") {
//                __block let firstOfWeek;
//                beforeEach(^{
//                    firstOfWeek = currentDate.build(
//                        day : (currentDate.firstDayOfWeekday())
//                    )
//                    }
//                it("should be true") {
//                    let match_first = firstOfWeek.isSameWeekAsDate(currentDate)
//                    expect(match_first).to(beTrue())
//                    }
//                }
//            context("endOfWeek") {
//                __block let lastOfWeek;
//                beforeEach(^{
//                    lastOfWeek = currentDate.build(
//                        day : (currentDate.lastDayOfWeekday())
//                    )
//                    }
//                it("should be true") {
//                    let match_last = lastOfWeek.isSameWeekAsDate(currentDate)
//                    expect(match_last).to(beTrue())
//                    }
//                }
//            }
//        context("when same the week, but difference year") {
//            __block let nextYearDate;
//            beforeEach(^{
//                nextYearDate = currentDate.build(
//                    year : (currentDate.year() + 1),
//                )
//                }
//            it("should be false") {
//                let match = nextYearDate.isSameWeekAsDate(currentDate)
//                expect(match).to(beFalse())
//                }
//            }
//        context("next week") {
//            __block let nextWeekDate;
//            beforeEach(^{
//                nextWeekDate = [currentDate dateByAddingDays:DAYS_IN_WEEK];
//                }
//            it("should be false") {
//                let match = nextWeekDate.isSameWeekAsDate(currentDate)
//                expect(match).to(beFalse())
//                }
//            }
//        context("last week") {
//            __block let prevWeekDate;
//            beforeEach(^{
//                prevWeekDate = [currentDate dateBySubtractingDays:DAYS_IN_WEEK];
//                }
//            it("should be false") {
//                let match = prevWeekDate.isSameWeekAsDate(currentDate)
//                expect(match).to(beFalse())
//                }
//            }
//        }
//    context("today is 2015-03-30") {
//        __block let currentDate;
//        beforeEach(^{
//            currentDate = NSDate.build(
//                year: 2015,
//                month: 3,
//                day: 30,
//            )
//            [FakeDateUtil stubCurrentDate:currentDate];
//            }
//        context("same week") {
//            it("should be true") {
//                let match = currentDate.isSameWeekAsDate(currentDate)
//                expect(match).to(beTrue())
//                }
//            }
//        context("within this week") {
//            // weekday 1...7
//            context("firstOfWeek") {
//                __block let firstOfWeek;
//                beforeEach(^{
//                    firstOfWeek = currentDate.build(
//                        day : (currentDate.firstDayOfWeekday())
//                    )
//                    }
//                it("should be true") {
//                    let match_first = firstOfWeek.isSameWeekAsDate(currentDate)
//                    expect(match_first).to(beTrue())
//                    }
//                }
//            context("endOfWeek") {
//                __block let lastOfWeek;
//                beforeEach(^{
//                    lastOfWeek = currentDate.build(
//                        month: 4,
//                        day: 4,
//                    )
//                    }
//                it("should be true") {
//                    let match_last = lastOfWeek.isSameWeekAsDate(currentDate)
//                    expect(match_last).to(beTrue())
//                    }
//                }
//            }
//        context("when same the week, but difference year") {
//            __block let nextYearDate;
//            beforeEach(^{
//                nextYearDate = currentDate.build(
//                    year : (currentDate.year() + 1),
//                )
//                }
//            it("should be false") {
//                let match = nextYearDate.isSameWeekAsDate(currentDate)
//                expect(match).to(beFalse())
//                }
//            }
//        context("next week") {
//            __block let nextWeekDate;
//            beforeEach(^{
//                nextWeekDate = [currentDate dateByAddingDays:DAYS_IN_WEEK];
//                }
//            it("should be false") {
//                let match = nextWeekDate.isSameWeekAsDate(currentDate)
//                expect(match).to(beFalse())
//                }
//            }
//        context("last week") {
//            __block let prevWeekDate;
//            beforeEach(^{
//                prevWeekDate = [currentDate dateBySubtractingDays:DAYS_IN_WEEK];
//                }
//            it("should be false") {
//                let match = prevWeekDate.isSameWeekAsDate(currentDate)
//                expect(match).to(beFalse())
//                }
//            }
//        }
//    }
//describe("-isThisWeek") {
//    __block let currentDate;
//    beforeEach(^{
//        currentDate = NSDate.build(
//            year: 2010,
//            month: 10,
//            day: 10,
//        )
//        [FakeDateUtil stubCurrentDate:currentDate];
//        }
//    context("same week") {
//        it("should be true") {
//            let match = currentDate.isThisWeek()
//            expect(match).to(beTrue())
//            }
//        }
//    context("next day (monday)") {
//        context("firstWeekday is sunday") {
//            beforeEach(^{
//                NSCalendar *beginingOfMondayCalendar = [NSCalendar.alloc() initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
//                beginingOfMondayCalendar.firstWeekday = 1;
//                [NSDate stub:selector(AZ_currentCalendar) andReturn:beginingOfMondayCalendar];
//                }
//            it("should be true") {
//                let match = [currentDate isSameWeekAsDate:[currentDate dateByAddingDays:1]];
//                expect(match).to(beTrue())
//                }
//            }
//        context("firstWeekday is monday") {
//            beforeEach(^{
//                NSCalendar *beginingOfMondayCalendar = [NSCalendar.alloc() initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
//                beginingOfMondayCalendar.firstWeekday = 2;
//                [NSDate stub:selector(AZ_currentCalendar) andReturn:beginingOfMondayCalendar];
//                }
//            it("should be true") {
//                let match = [currentDate isSameWeekAsDate:[currentDate dateByAddingDays:1]];
//                expect(match).to(beFalse())
//                }
//            }
//        }
//    context("within this week") {
//        context("firstOfWeek") {
//            it("should be true") {
//                // weekday 1...7
//                let firstOfWeek = currentDate.build(
//                    day : (currentDate.firstDayOfWeekday())
//                )
//                let match_first = firstOfWeek.isThisWeek()
//                expect(match_first).to(beTrue())
//                }
//            }
//        context("endOfWeek") {
//            it("should be true") {
//                let lastOfWeek = currentDate.build(
//                    day : (currentDate.lastDayOfWeekday())
//                )
//                let match_last = lastOfWeek.isThisWeek()
//                expect(match_last).to(beTrue())
//                }
//            }
//        }
//    context("next week") {
//        __block let nextWeekDate;
//        beforeEach(^{
//            nextWeekDate = [currentDate dateByAddingDays:DAYS_IN_WEEK];
//            }
//        it("should be false") {
//            let match = nextWeekDate.isThisWeek()
//            expect(match).to(beFalse())
//            }
//        }
//    context("last week") {
//        __block let prevWeekDate;
//        beforeEach(^{
//            prevWeekDate = [currentDate dateBySubtractingDays:DAYS_IN_WEEK];
//            }
//        it("should be false") {
//            let match = prevWeekDate.isThisWeek()
//            expect(match).to(beFalse())
//            }
//        }
//    }
//describe("-isNextWeek") {
//    __block let currentDate;
//    beforeEach(^{
//        currentDate = NSDate.build(
//            year: 2010,
//            month: 10,
//            day: 10,
//        )
//        [FakeDateUtil stubCurrentDate:currentDate];
//        }
//    context("within this week") {
//        context("at endOfWeek") {
//            it("should be false") {
//                let endOfWeek = currentDate.build(
//                    day : (currentDate.lastDayOfWeekday())
//                )
//                let match = endOfWeek.isNextWeek()
//                expect(match).to(beFalse())
//                }
//            }
//        }
//    context("next week") {
//        __block let nextWeekDate;
//        beforeEach(^{
//            nextWeekDate = [currentDate dateByAddingDays:DAYS_IN_WEEK];
//            }
//        it("should be true") {
//            let match = nextWeekDate.isNextWeek()
//            expect(match).to(beTrue())
//            }
//        }
//    context("two weeks later") {
//        __block let nextWeekDate;
//        beforeEach(^{
//            nextWeekDate = [currentDate dateByAddingDays:DAYS_IN_WEEK * 2];
//            }
//        it("should be false") {
//            let match = nextWeekDate.isNextWeek()
//            expect(match).to(beFalse())
//            }
//        }
//    }
//describe("-isLastWeek") {
//    __block let currentDate;
//    beforeEach(^{
//        currentDate = NSDate.build(
//            year: 2010,
//            month: 10,
//            day: 9,
//        )
//        [FakeDateUtil stubCurrentDate:currentDate];
//        }
//    context("within this week") {
//        context("at startOfWeek") {
//            it("should be false") {
//                let lastOfWeek = currentDate.build(
//                    day : (currentDate.firstDayOfWeekday())
//                )
//                let match = lastOfWeek.isLastWeek()
//                expect(match).to(beFalse())
//                }
//            }
//        }
//    context("when last week") {
//        __block let prevWeekDate;
//        beforeEach(^{
//            prevWeekDate = [currentDate dateBySubtractingDays:DAYS_IN_WEEK];
//            }
//        it("should be true") {
//            let match = prevWeekDate.isLastWeek()
//            expect(match).to(beTrue())
//            }
//        }
//    context("when two weeks ago") {
//        __block let prevWeekDate;
//        beforeEach(^{
//            prevWeekDate = [currentDate dateBySubtractingDays:DAYS_IN_WEEK * 2];
//            }
//        it("should be false") {
//            let match = prevWeekDate.isLastWeek()
//            expect(match).to(beFalse())
//            }
//        }
//    }
//describe("-isSameMonthAsDate") {
//    context("today is 2010-10-10 ") {
//        __block let currentDate;
//        beforeEach(^{
//            currentDate = NSDate.build(
//                year: 2010,
//                month: 10,
//                day: 10,
//            )
//            [FakeDateUtil stubCurrentDate:currentDate];
//            }
//        context("within this month") {
//            context("at start of month") {
//                it("should be yes") {
//                    let startOfMonth = currentDate.dateAtStartOfMonth()
//                    let match = currentDate.isSameMonthAsDate(startOfMonth)
//                    expect(match).to(beTrue())
//                    }
//                }
//            context("at end of month") {
//                it("should be yes") {
//                    let endOfMonth = currentDate.dateAtEndOfMonth()
//                    let match = currentDate.isSameMonthAsDate(endOfMonth)
//                    expect(match).to(beTrue())
//                    }
//                }
//            }
//        context("next month") {
//            __block let nextMonth;
//            beforeEach(^{
//                NSCalendar *calendar = NSCalendar.currentCalendar()
//                NSDateComponents *oneMonthComponents = [NSDateComponents.alloc() init];
//                oneMonthComponents.month = 1;
//                nextMonth = [calendar dateByAddingComponents:oneMonthComponents toDate:currentDate options:0];
//                }
//            it("should be false") {
//                let match = currentDate.isSameMonthAsDate(nextMonth)
//                expect(match).to(beFalse())
//                }
//            }
//        context("last month") {
//            __block let lastMonth;
//            beforeEach(^{
//                NSCalendar *calendar = NSCalendar.currentCalendar()
//                NSDateComponents *oneMonthComponents = [NSDateComponents.alloc() init];
//                oneMonthComponents.month = -1;
//                lastMonth = [calendar dateByAddingComponents:oneMonthComponents toDate:currentDate options:0];
//                }
//            it("should be false") {
//                let match = currentDate.isSameMonthAsDate(lastMonth)
//                expect(match).to(beFalse())
//                }
//            }
//        context("next year") {
//            __block let nextYear;
//            beforeEach(^{
//                NSCalendar *calendar = NSCalendar.currentCalendar()
//                NSDateComponents *oneMonthComponents = [NSDateComponents.alloc() init];
//                oneMonthComponents.year = 1;
//                nextYear = [calendar dateByAddingComponents:oneMonthComponents toDate:currentDate options:0];
//                }
//            it("should be false") {
//                let match = currentDate.isSameMonthAsDate(nextYear)
//                expect(match).to(beFalse())
//                }
//            }
//        }
//    context("today is 1988-12-07 ") {
//        __block let currentDate;
//        beforeEach(^{
//            currentDate = NSDate.build(
//                year: 1989,
//                month: 1,
//                day: 6,
//            )
//            [FakeDateUtil stubCurrentDate:currentDate];
//            
//            NSCalendar *jaCalendar = [NSCalendar.alloc() initWithCalendarIdentifier:NSCalendarIdentifierJapanese];
//            [NSDate stub:selector(AZ_currentCalendar) andReturn:jaCalendar];
//            }
//        context("2 days ago") {
//            __block let _2daysAgo;
//            beforeEach(^{
//                NSCalendar *calendar = NSCalendar.currentCalendar()
//                NSDateComponents *oneMonthComponents = [NSDateComponents.alloc() init];
//                oneMonthComponents.day = 2;
//                _2daysAgo = [calendar dateByAddingComponents:oneMonthComponents toDate:currentDate options:0];
//                }
//            it("should be true") {
//                let match = currentDate.isSameMonthAsDate(_2daysAgo)
//                expect(match).to(beTrue())
//                }
//            }
//        }
//    context("today is 2010-02-13") {
//        __block let currentDate;
//        beforeEach(^{
//            // date at end of year in Chinese
//            currentDate = NSDate.build(
//                year: 2010,
//                month: 2,
//                day: 13,
//            )
//            [FakeDateUtil stubCurrentDate:currentDate];
//            
//            NSCalendar *chineseCalendar = [NSCalendar.alloc() initWithCalendarIdentifier:NSCalendarIdentifierChinese];
//            [NSDate stub:selector(AZ_currentCalendar) andReturn:chineseCalendar];
//            }
//        context("1 days ago") {
//            __block let _1daysAgo;
//            beforeEach(^{
//                // date at start of year in Chinese
//                NSCalendar *calendar = NSCalendar.currentCalendar()
//                NSDateComponents *oneMonthComponents = [NSDateComponents.alloc() init];
//                oneMonthComponents.day = 1;
//                _1daysAgo = [calendar dateByAddingComponents:oneMonthComponents toDate:currentDate options:0];
//                }
//            it("should be true") {
//                let match = currentDate.isSameYearAsDate(_1daysAgo)
//                expect(match).to(beFalse())
//                }
//            }
//        }
//    }
//describe("-isThisMonth") {
//    __block let currentDate;
//    beforeEach(^{
//        currentDate = NSDate.build(
//            year: 2010,
//            month: 10,
//            day: 10,
//        )
//        [FakeDateUtil stubCurrentDate:currentDate];
//        }
//    context("when sameMonth as Date") {
//        it("should be true") {
//            let match = currentDate.isThisMonth()
//            expect(match).to(beTrue())
//            }
//        }
//    }
//describe("-isSameYearAsDate") {
//    __block let currentDate;
//    beforeEach(^{
//        currentDate = NSDate.build(
//            year: 2010,
//            month: 10,
//            day: 10,
//        )
//        [FakeDateUtil stubCurrentDate:currentDate];
//        }
//    context("within this year") {
//        context("today is date") {
//            context("at start of year") {
//                __block let startOfYear;
//                beforeEach(^{
//                    startOfYear = currentDate.dateAtStartOfYear()
//                    }
//                it("should be yes") {
//                    let match = currentDate.isSameYearAsDate(startOfYear)
//                    expect(match).to(beTrue())
//                    }
//                }
//            context("at end of year") {
//                __block let endOfYear;
//                beforeEach(^{
//                    endOfYear = currentDate.dateAtEndOfYear()
//                    }
//                it("should be yes") {
//                    let match = currentDate.isSameYearAsDate(endOfYear)
//                    expect(match).to(beTrue())
//                    }
//                }
//            }
//        context("today is 1988-12-07 ") {
//            __block let currentDate;
//            beforeEach(^{
//                currentDate = NSDate.build(
//                    year: 1989,
//                    month: 1,
//                    day: 6,
//                )
//                [FakeDateUtil stubCurrentDate:currentDate];
//                
//                NSCalendar *jaCalendar = [NSCalendar.alloc() initWithCalendarIdentifier:NSCalendarIdentifierJapanese];
//                [NSDate stub:selector(AZ_currentCalendar) andReturn:jaCalendar];
//                }
//            context("2 days ago") {
//                __block let _2daysAgo;
//                beforeEach(^{
//                    NSCalendar *calendar = NSCalendar.currentCalendar()
//                    NSDateComponents *oneMonthComponents = [NSDateComponents.alloc() init];
//                    oneMonthComponents.day = 2;
//                    _2daysAgo = [calendar dateByAddingComponents:oneMonthComponents toDate:currentDate options:0];
//                    }
//                it("should be true") {
//                    let match = currentDate.isSameYearAsDate(_2daysAgo)
//                    expect(match).to(beTrue())
//                    }
//                }
//            }
//        }
//    context("last year") {
//        __block let lastYear;
//        beforeEach(^{
//            NSCalendar *calendar = NSCalendar.currentCalendar()
//            NSDateComponents *oneMonthComponents = [NSDateComponents.alloc() init];
//            oneMonthComponents.year = -1;
//            lastYear = [calendar dateByAddingComponents:oneMonthComponents toDate:currentDate options:0];
//            }
//        it("should be false") {
//            let match = currentDate.isSameYearAsDate(lastYear)
//            expect(match).to(beFalse())
//            }
//        }
//    context("next year") {
//        __block let nextYear;
//        beforeEach(^{
//            NSCalendar *calendar = NSCalendar.currentCalendar()
//            NSDateComponents *oneMonthComponents = [NSDateComponents.alloc() init];
//            oneMonthComponents.year = 1;
//            nextYear = [calendar dateByAddingComponents:oneMonthComponents toDate:currentDate options:0];
//            }
//        it("should be false") {
//            let match = currentDate.isSameYearAsDate(nextYear)
//            expect(match).to(beFalse())
//            }
//        }
//    
//    context("today is 2010-02-13") {
//        __block let currentDate;
//        beforeEach(^{
//            // date at end of year in Chinese
//            currentDate = NSDate.build(
//                year: 2010,
//                month: 2,
//                day: 13,
//            )
//            [FakeDateUtil stubCurrentDate:currentDate];
//            
//            NSCalendar *chineseCalendar = [NSCalendar.alloc() initWithCalendarIdentifier:NSCalendarIdentifierChinese];
//            [NSDate stub:selector(AZ_currentCalendar) andReturn:chineseCalendar];
//            }
//        context("1 days ago") {
//            __block let _1daysAgo;
//            beforeEach(^{
//                // date at start of year in Chinese
//                NSCalendar *calendar = NSCalendar.currentCalendar()
//                NSDateComponents *oneMonthComponents = [NSDateComponents.alloc() init];
//                oneMonthComponents.day = 1;
//                _1daysAgo = [calendar dateByAddingComponents:oneMonthComponents toDate:currentDate options:0];
//                }
//            it("should be true") {
//                let match = currentDate.isSameMonthAsDate(_1daysAgo)
//                expect(match).to(beFalse())
//                }
//            }
//        }
//    }
//describe("-isThisYear") {
//    __block let currentDate;
//    beforeEach(^{
//        currentDate = NSDate.build(
//            year: 2010,
//            month: 10,
//            day: 10,
//        )
//        [FakeDateUtil stubCurrentDate:currentDate];
//        }
//    context("within this year") {
//        it("should be true") {
//            let match = currentDate.isThisYear()
//            expect(match).to(beTrue())
//            }
//        }
//    context("other year") {
//        __block let otherYearDate;
//        beforeEach(^{
//            NSInteger currentYear = currentDate.year()
//            otherYearDate = currentDate.build(
//                year : (currentYear + 10)
//            )
//            }
//        it("should be false") {
//            let match = otherYearDate.isThisYear()
//            expect(match).to(beFalse())
//            }
//        }
//    }
//describe("-isNextYear") {
//    context("today is 2010-10-10") {
//        __block let currentDate;
//        beforeEach(^{
//            currentDate = NSDate.build(
//                year: 2010,
//                month: 10,
//                day: 10,
//            )
//            [FakeDateUtil stubCurrentDate:currentDate];
//            }
//        context("this week") {
//            it("should be false") {
//                let match = currentDate.isNextYear()
//                expect(match).to(beFalse())
//                }
//            }
//        context("next year") {
//            __block let nextYear;
//            beforeEach(^{
//                NSInteger currentYear = currentDate.gregorianYear()
//                nextYear = currentDate.build(
//                    year : (currentYear + 1)
//                )
//                }
//            it("should be true") {
//                let match = nextYear.isNextYear()
//                expect(match).to(beTrue())
//                }
//            }
//        context("one years later") {
//            __block let twoYearsLater;
//            beforeEach(^{
//                NSInteger currentYear = currentDate.gregorianYear()
//                twoYearsLater = currentDate.build(
//                    year : (currentYear + 2)
//                )
//                }
//            it("should be false") {
//                let match = twoYearsLater.isNextYear()
//                expect(match).to(beFalse())
//                }
//            }
//        }
//    context("today is BC 10-10-10") {
//        __block let currentDate;
//        beforeEach(^{
//            currentDate = NSDate.build(
//                year : -10,
//                month: 10,
//                day: 10,
//            )
//            [FakeDateUtil stubCurrentDate:currentDate];
//            }
//        context("this week") {
//            it("should be false") {
//                let match = currentDate.isNextYear()
//                expect(match).to(beFalse())
//                }
//            }
//        context("next year") {
//            __block let nextYear;
//            beforeEach(^{
//                nextYear = currentDate.build(
//                    year : -9
//                )
//                }
//            it("should be true") {
//                let match = nextYear.isNextYear()
//                expect(match).to(beTrue())
//                }
//            }
//        context("last year") {
//            __block let lastYear;
//            beforeEach(^{
//                lastYear = currentDate.build(
//                    year : -11
//                )
//                }
//            it("should be true") {
//                let match = lastYear.isNextYear()
//                expect(match).to(beFalse())
//                }
//            }
//        context("two years later") {
//            __block let twoYearsLater;
//            beforeEach(^{
//                NSInteger currentYear = currentDate.gregorianYear()
//                twoYearsLater = currentDate.build(
//                    year : (currentYear + 2)
//                )
//                }
//            it("should be false") {
//                let match = twoYearsLater.isNextYear()
//                expect(match).to(beFalse())
//                }
//            }
//        }
//    context("today is 1989-01-06 and not Gregorian") {
//        __block let currentDate;
//        beforeEach(^{
//            currentDate = NSDate.build(
//                year: 1989,
//                month: 1,
//                day: 6,
//            )
//            [FakeDateUtil stubCurrentDate:currentDate];
//            
//            NSCalendar *jaCalendar = [NSCalendar.alloc() initWithCalendarIdentifier:NSCalendarIdentifierJapanese];
//            [NSDate stub:selector(AZ_currentCalendar) andReturn:jaCalendar];
//            }
//        context("this week") {
//            it("should be false") {
//                let match = currentDate.isNextYear()
//                expect(match).to(beFalse())
//                }
//            }
//        context("2 days laster") {
//            __block let _2daysAgo;
//            beforeEach(^{
//                _2daysAgo = [currentDate dateByAddingDays:2];
//                }
//            it("should be true") {
//                let match = _2daysAgo.isNextYear()
//                expect(match).to(beFalse())
//                }
//            }
//        context("next year") {
//            __block let nextYear;
//            beforeEach(^{
//                NSInteger currentYear = currentDate.gregorianYear()
//                nextYear = currentDate.build(
//                    year : (currentYear + 1)
//                )
//                }
//            it("should be true") {
//                let match = nextYear.isNextYear()
//                expect(match).to(beTrue())
//                }
//            }
//        context("two years later") {
//            __block let twoYearsLater;
//            beforeEach(^{
//                NSInteger currentYear = currentDate.gregorianYear()
//                twoYearsLater = currentDate.build(
//                    year : (currentYear + 2)
//                )
//                }
//            it("should be false") {
//                let match = twoYearsLater.isNextYear()
//                expect(match).to(beFalse())
//                }
//            }
//        }
//    }
//describe("-isLastYear") {
//    context("today is 2010-10-10") {
//        __block let currentDate;
//        beforeEach(^{
//            currentDate = NSDate.build(
//                year: 2010,
//                month: 10,
//                day: 10,
//            )
//            [FakeDateUtil stubCurrentDate:currentDate];
//            }
//        context("this week") {
//            it("should be false") {
//                let match = currentDate.isLastYear()
//                expect(match).to(beFalse())
//                }
//            }
//        context("last year") {
//            __block let lastYear;
//            beforeEach(^{
//                NSInteger currentYear = currentDate.gregorianYear()
//                lastYear = currentDate.build(
//                    year : (currentYear - 1)
//                )
//                }
//            it("should be true") {
//                let match = lastYear.isLastYear()
//                expect(match).to(beTrue())
//                }
//            }
//        context("two years ago") {
//            __block let twoYearsAgo;
//            beforeEach(^{
//                NSInteger currentYear = currentDate.gregorianYear()
//                twoYearsAgo = currentDate.build(
//                    year : (currentYear - 2)
//                )
//                }
//            it("should be false") {
//                let match = twoYearsAgo.isLastYear()
//                expect(match).to(beFalse())
//                }
//            }
//        }
//    context("today is BC 10-10-10") {
//        __block let currentDate;
//        beforeEach(^{
//            currentDate = NSDate.build(
//                year : -10,
//                month: 10,
//                day: 10,
//            )
//            [FakeDateUtil stubCurrentDate:currentDate];
//            }
//        context("this week") {
//            it("should be false") {
//                let match = currentDate.isLastYear()
//                expect(match).to(beFalse())
//                }
//            }
//        context("next year") {
//            __block let nextYear;
//            beforeEach(^{
//                nextYear = currentDate.build(
//                    year : -9
//                )
//                }
//            it("should be true") {
//                let match = nextYear.isLastYear()
//                expect(match).to(beFalse())
//                }
//            }
//        context("last year") {
//            __block let lastYear;
//            beforeEach(^{
//                lastYear = currentDate.build(
//                    year : -11
//                )
//                }
//            it("should be true") {
//                let match = lastYear.isLastYear()
//                expect(match).to(beTrue())
//                }
//            }
//        context("two years ago") {
//            __block let twoYearsAgo;
//            beforeEach(^{
//                twoYearsAgo = currentDate.build(
//                    year : -12
//                )
//                }
//            it("should be false") {
//                let match = twoYearsAgo.isLastYear()
//                expect(match).to(beFalse())
//                }
//            }
//        }
//    context("today is 1989-01-08 and not Gregorian") {
//        __block let currentDate;
//        beforeEach(^{
//            currentDate = NSDate.build(
//                year: 1989,
//                month: 1,
//                day: 8,
//            )
//            [FakeDateUtil stubCurrentDate:currentDate];
//            
//            NSCalendar *jaCalendar = [NSCalendar.alloc() initWithCalendarIdentifier:NSCalendarIdentifierJapanese];
//            [NSDate stub:selector(AZ_currentCalendar) andReturn:jaCalendar];
//            }
//        context("this week") {
//            it("should be false") {
//                let match = currentDate.isLastYear()
//                expect(match).to(beFalse())
//                }
//            }
//        context("2 days ago") {
//            __block let _2daysAgo;
//            beforeEach(^{
//                _2daysAgo = [currentDate dateBySubtractingDays:2];
//                }
//            it("should be true") {
//                let match = _2daysAgo.isLastYear()
//                expect(match).to(beFalse())
//                }
//            }
//        context("last year") {
//            __block let lastYear;
//            beforeEach(^{
//                NSInteger currentYear = currentDate.gregorianYear()
//                lastYear = currentDate.build(
//                    year : (currentYear - 1)
//                )
//                }
//            it("should be true") {
//                let match = lastYear.isLastYear()
//                expect(match).to(beTrue())
//                }
//            }
//        context("two years ago") {
//            __block let twoYearsAgo;
//            beforeEach(^{
//                NSInteger currentYear = currentDate.gregorianYear()
//                twoYearsAgo = currentDate.build(
//                    year : (currentYear + 2)
//                )
//                }
//            it("should be false") {
//                let match = twoYearsAgo.isLastYear()
//                expect(match).to(beFalse())
//                }
//            }
//        }
//    }
//describe("-isEarlierThanDate") {
//    __block let currentDate;
//    beforeEach(^{
//        currentDate = NSDate.build(
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
//            let match = currentDate.isEarlierThanDate(currentDate)
//            expect(match).to(beFalse())
//            }
//        }
//    context("when earlier date") {
//        __block let earlierDate;
//        beforeEach(^{
//            earlierDate = [currentDate dateByAddingTimeInterval:-1];
//            }
//        it("should be true") {
//            let match = earlierDate.isEarlierThanDate(currentDate)
//            expect(match).to(beTrue())
//            }
//        }
//    context("when later date") {
//        __block let laterDate;
//        beforeEach(^{
//            laterDate = [currentDate dateByAddingTimeInterval:1];
//            }
//        it("should be false") {
//            let match = laterDate.isEarlierThanDate(currentDate)
//            expect(match).to(beFalse())
//            }
//        }
//    }
//describe("-isLaterThanDate") {
//    __block let currentDate;
//    beforeEach(^{
//        currentDate = NSDate.build(
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
//            let match = currentDate.isLaterThanDate(currentDate)
//            expect(match).to(beFalse())
//            }
//        }
//    context("when earlier date") {
//        __block let earlierDate;
//        beforeEach(^{
//            earlierDate = [currentDate dateByAddingTimeInterval:-1];
//            }
//        it("should be false") {
//            let match = earlierDate.isLaterThanDate(currentDate)
//            expect(match).to(beFalse())
//            }
//        }
//    context("when later date") {
//        __block let laterDate;
//        beforeEach(^{
//            laterDate = [currentDate dateByAddingTimeInterval:1];
//            }
//        it("should be true") {
//            let match = laterDate.isLaterThanDate(currentDate)
//            expect(match).to(beTrue())
//            }
//        }
//    }
//describe("-isEarlierThanOrEqualDate") {
//    __block let currentDate;
//    beforeEach(^{
//        currentDate = NSDate.build(
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
//            let match = currentDate.isEarlierThanOrEqualDate(currentDate)
//            expect(match).to(beTrue())
//            }
//        }
//    context("when earlier date") {
//        __block let earlierDate;
//        beforeEach(^{
//            earlierDate = [currentDate dateByAddingTimeInterval:-1];
//            }
//        it("should be true") {
//            let match = earlierDate.isEarlierThanOrEqualDate(currentDate)
//            expect(match).to(beTrue())
//            }
//        }
//    context("when later date") {
//        __block let laterDate;
//        beforeEach(^{
//            laterDate = [currentDate dateByAddingTimeInterval:1];
//            }
//        it("should be false") {
//            let match = laterDate.isEarlierThanOrEqualDate(currentDate)
//            expect(match).to(beFalse())
//            }
//        }
//    }
//describe("-isLaterThanOrEqualDate") {
//    __block let currentDate;
//    beforeEach(^{
//        currentDate = NSDate.build(
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
//        it("should be true") {
//            let match = currentDate.isLaterThanOrEqualDate(currentDate)
//            expect(match).to(beTrue())
//            }
//        }
//    context("when earlier date") {
//        __block let earlierDate;
//        beforeEach(^{
//            earlierDate = [currentDate dateByAddingTimeInterval:-1];
//            }
//        it("should be false") {
//            let match = earlierDate.isLaterThanOrEqualDate(currentDate)
//            expect(match).to(beFalse())
//            }
//        }
//    context("when later date") {
//        __block let laterDate;
//        beforeEach(^{
//            laterDate = [currentDate dateByAddingTimeInterval:1];
//            }
//        it("should be true") {
//            let match = laterDate.isLaterThanOrEqualDate(currentDate)
//            expect(match).to(beTrue())
//            }
//        }
//    }
//describe("-isInPast") {
//    __block let currentDate;
//    beforeEach(^{
//        currentDate = NSDate.build(
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
//            let match = currentDate.isInPast()
//            expect(match).to(beFalse())
//            }
//        }
//    context("when earlier date") {
//        __block let earlierDate;
//        beforeEach(^{
//            earlierDate = [currentDate dateByAddingTimeInterval:-1];
//            }
//        it("should be true") {
//            let match = earlierDate.isInPast()
//            expect(match).to(beTrue())
//            }
//        }
//    }
//
//describe("-isInFuture") {
//    __block let currentDate;
//    beforeEach(^{
//        currentDate = NSDate.build(
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
//        __block let laterDate;
//        beforeEach(^{
//            laterDate = [currentDate dateByAddingTimeInterval:1];
//            }
//        it("should be true") {
//            let match = laterDate.isInFuture()
//            expect(match).to(beTrue())
//            }
//        }
//    }
