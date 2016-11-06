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
        let value = expectedValue.timeIntervalSince1970
        let actualValue = try actualExpression.evaluate()!.timeIntervalSince1970
        
        return value - 5 <= actualValue &&
            actualValue < value + 5
    }
}
