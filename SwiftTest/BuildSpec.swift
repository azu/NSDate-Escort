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
        describe("2010/10/10 11:12:13") {
            let date = NSDate.az_date(byUnit: [
                AZ_DateUnit.year.takeRetainedValue() : 2010,
                AZ_DateUnit.month.takeRetainedValue() : 10,
                AZ_DateUnit.day.takeRetainedValue() : 10,
                AZ_DateUnit.hour.takeRetainedValue() : 11,
                AZ_DateUnit.minute.takeRetainedValue() : 12,
                AZ_DateUnit.second.takeRetainedValue() : 13
            ])!
            
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
        }
    }
}
