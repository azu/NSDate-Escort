//
//  SwiftTest.swift
//  SwiftTest
//
//  Created by akuraru on 2016/09/29.
//
//

import XCTest
import Quick
import Nimble
import NSDate_Escort

class BuildSpec: QuickSpec {
    override func spec() {
        let date = NSDate.az_date(byUnit: [
            AZ_DateUnit.year.takeRetainedValue(): 2010,
            AZ_DateUnit.month.takeRetainedValue(): 10,
            AZ_DateUnit.day.takeRetainedValue(): 10,
            AZ_DateUnit.hour.takeRetainedValue(): 11,
            AZ_DateUnit.minute.takeRetainedValue(): 12,
            AZ_DateUnit.second.takeRetainedValue(): 13
        ])!
        describe("static build") {
            it("2010/10/10 11:12:13") {
                let result = Date.build(
                    year: 2010,
                    month: 10,
                    day: 10,
                    hour: 11,
                    minute: 12,
                    second: 13
                )
                expect(result).to(equal(date))
            }
            it ("2010 42w Sunday 11:12:13") {
                let result = Date.build(
                    year: 2010,
                    hour: 11,
                    minute: 12,
                    second: 13,
                    weekday: 1,
                    weekOfYear: 42
                )
                expect(result).to(equal(date))
            }
        }
        describe("build") {
            let currentDate = Date()
            it("None") {
                expect(currentDate).toNot(equal(date))
            }
            it("2010/10/10 11:12:13") {
                let result = currentDate.build(
                    year: 2010,
                    month: 10,
                    day: 10,
                    hour: 11,
                    minute: 12,
                    second: 13,
                    nanosecond: 0
                )
                expect(result).to(equal(date))
            }
        }
        describe("add") {
            describe("adding 0 year") {
                let subject = date.add(year: 0)
                it("should return 2010-10-10") {
                    expect(subject).to(equal(date))
                }
            }
            describe("adding 1 year") {
                let subject = date.add(year: 1)
                it("should return 2011-10-10") {
                    let expectDate = Date.build(year: 2011, month: 10, day: 10, hour: 11, minute: 12, second: 13)
                    expect(subject).to(equal(expectDate))
                }
            }
            describe("adding -1 year") {
                let subject = date.add(year: -1)
                it("should return 2011-10-10") {
                    let expectDate = Date.build(year: 2009, month: 10, day: 10, hour: 11, minute: 12, second: 13)
                    expect(subject).to(equal(expectDate))
                }
            }
        }
    }
}
