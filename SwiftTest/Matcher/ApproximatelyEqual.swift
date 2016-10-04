//
//  ApproximatelyEqual.swift
//  NSDate-Escort
//
//  Created by akuraru on 2016/10/04.
//
//

import Foundation
import Nimble

public func approximatelyEqual(_ expectedValue: Date) -> NonNilMatcherFunc<Date> {
    return NonNilMatcherFunc { actualExpression, failureMessage in
        failureMessage.postfixMessage = "approximately equal <\(stringify(expectedValue))>"
        let actualValue = try actualExpression.evaluate()!
        return expectedValue.add(second: -5) <= actualValue &&
            actualValue < expectedValue.add(second: 5)
    }
}
