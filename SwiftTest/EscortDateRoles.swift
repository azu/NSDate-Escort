//
//  EscortDateRoles.swift
//  NSDate-Escort
//
//  Created by akuraru on 2016/10/13.
//
//

import Foundation
import Quick
import Nimble

class EscortDateRoles: QuickSpec {
    override func spec() {
        describe("-isTypicallyWorkday") {
            let currentDate;
             = Date.build(
                    year: 2010,
                    month: 10,
                    day: 10
                )
                FakeDateUtil.stubCurrentDate(currentDate)
                }
            context("when Workday is first") {
                let firstDayOfWeek;
                 = [currentDate AZ_dateByUnit:{
                        weekday: 1
                    )
                it("should be false") {
                    BOOL match = [firstDayOfWeek isTypicallyWorkday];
                    [[match should] beNo];
                    }
                }
            context("when Workday is last") {
                let lastDayOfWeek;
                 = [currentDate AZ_dateByUnit:{
                        weekday: 7
                    )
                it("should be false") {
                    BOOL match = [lastDayOfWeek isTypicallyWorkday];
                    [[match should] beNo];
                    }
                }
            context("when Workday is typically workday") {
                NSRange weekdayRange;
                 calendar = Calendar.current
                    weekdayRange = calendar.maximumRangeOfUnit(NSCalendarUnitWeekday)
                    }
                it("should be true") {
                    let checkDate;
                    NSUInteger length = weekdayRange.location + weekdayRange.length - 1;
                    for (NSUInteger weekday = weekdayRange.location + 1; weekday < length; weekday++) {
                        checkDate = [[currentDate AZ_dateByUnit:{
                            weekday: 1,
                        }] dateByAddingDays:weekday - 1];
                        BOOL match = checkDate.isTypicallyWorkday()
                        [[match should] beTrue];
                    }
                    }
                }
            }
        describe("-isTypicallyWeekend") {
            let currentDate;
             = Date.build(
                    year: 2010,
                    month: 10,
                    day: 10
                )
                FakeDateUtil.stubCurrentDate(currentDate)
                }
            context("when Weekday is first") {
                let firstDayOfWeek;
                 = [currentDate AZ_dateByUnit:{
                        weekday: 1
                    )
                it("should be true") {
                    BOOL match = [firstDayOfWeek isTypicallyWeekend];
                    [[match should] beYes];
                    }
                }
            context("when Weekday is last") {
                let lastDayOfWeek;
                 = [currentDate AZ_dateByUnit:{
                        weekday: 7
                    )
                it("should be true") {
                    BOOL match = [lastDayOfWeek isTypicallyWeekend];
                    [[match should] beYes];
                    }
                }
            context("when Weekday is typically workday") {
                NSRange weekdayRange;
                 calendar = Calendar.current
                    weekdayRange = calendar.maximumRangeOfUnit(NSCalendarUnitWeekday)
                    }
                it("should be true") {
                    let checkDate;
                    NSUInteger length = weekdayRange.location + weekdayRange.length - 1;
                    for (NSUInteger weekday = weekdayRange.location + 1; weekday < length; weekday++) {
                        checkDate = [[currentDate AZ_dateByUnit:{
                            weekday: 1,
                        }] dateByAddingDays:weekday - 1];
                        BOOL match = checkDate.isTypicallyWeekend()
                        [[match should] beNo];
                    }
                    }
                }
            }
    }
}
