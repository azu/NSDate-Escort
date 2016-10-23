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
        beforeEach {
            let calendarIdentifier = Calendar.Identifier.gregorian
            Date.setDefault(calendarIdentifier)
        }
        describe("-isTypicallyWorkday") {
            let currentDate = Date.build(
                year: 2010,
                month: 10,
                day: 10
            )
            context("when Workday is first") {
                let firstDayOfWeek = currentDate
                it("should be false") {
                    let match = firstDayOfWeek.isTypicallyWorkday()
                    expect(match).to(beFalse())
                }
            }
            context("when Workday is last") {
                let lastDayOfWeek = currentDate.add(day: currentDate.numberOfDaysInWeek() - 1)
                it("should be false") {
                    let match = lastDayOfWeek.isTypicallyWorkday()
                    expect(match).to(beFalse())
                }
            }
            context("when Workday is typically workday") {
                let calendar = Calendar.current
                let weekdayRange = calendar.maximumRange(of: .weekday)!
                it("should be true") {
                    let range = (weekdayRange.lowerBound + 1)..<(weekdayRange.upperBound - 1)
                    for weekday in range {
                        let checkDate = currentDate.add(day: weekday - 1)
                        let match = checkDate.isTypicallyWorkday()
                        expect(match).to(beTrue())
                    }
                }
            }
        }
        describe("-isTypicallyWeekend") {
            let currentDate = Date.build(
                year: 2010,
                month: 10,
                day: 10
            )
            context("when Weekday is first") {
                let firstDayOfWeek = currentDate
                it("should be true") {
                    let match = firstDayOfWeek.isTypicallyWeekend()
                    expect(match).to(beTrue())
                }
            }
            context("when Weekday is last") {
                let lastDayOfWeek = currentDate.add(
                    day: currentDate.numberOfDaysInWeek() - 1
                )
                it("should be true") {
                    let match = lastDayOfWeek.isTypicallyWeekend()
                    expect(match).to(beTrue())
                }
            }
            context("when Weekday is typically workday") {
                let calendar = Calendar.current
                let weekdayRange = calendar.maximumRange(of: .weekday)!
                it("should be true") {
                    for weekday in (weekdayRange.lowerBound + 1)..<(weekdayRange.upperBound - 1) {
                        let checkDate = currentDate.add(day: weekday - 1)
                        let match = checkDate.isTypicallyWeekend()
                        expect(match).to(beFalse())
                    }
                }
            }
        }
    }
}
