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


public func approximatelyEqual(_ expectedValue: Date) -> NonNilMatcherFunc<Date> {
    return NonNilMatcherFunc { actualExpression, failureMessage in
        failureMessage.postfixMessage = "approximately equal <\(stringify(expectedValue))>"
        let actualValue = try actualExpression.evaluate()!
        return expectedValue.add(second: -5) <= actualValue &&
            actualValue < expectedValue.add(second: 5)
    }
}

let SECONDS_IN_DAY: TimeInterval = 24 * 60 * 60

class EscortComparingSpec: QuickSpec {
    override func spec() {
        describe("+dateTomorrow") {
            context("when today is new time") {
                let currentDate = Date()
                it("should return tomorrow") {
                    let expectDate = currentDate.addingTimeInterval(SECONDS_IN_DAY)
                    let tomorrow = Date.tomorrow()
                    expect(tomorrow).to(approximatelyEqual(expectDate))
                }
            }
        }
        describe("+dateYesterday") {
            context("when today is new time") {
                let currentDate = Date()
                it("should return yesterday") {
                    let expectDate = currentDate.addingTimeInterval(-SECONDS_IN_DAY)
                    let yesterday = Date.yesterday()
                    expect(yesterday).to(approximatelyEqual(expectDate))
                }
            }
        }
    }
}
