//
// Created by azu on 2013/06/09.
// License MIT


#import <Foundation/Foundation.h>
#import "KWMatcher.h"

typedef NS_ENUM(NSUInteger, KWDateInequalityType){
    KWDateInequalityTypeEqualToDateIgnoringTime,// ≒
};

/*  How to Use
    Put Your Spec File:

    registerMatchers(@"AZ");// NSDate Custom Matcher
 */
@interface AZNSDateKiwiMatcher : KWMatcher
- (void)equalToDateIgnoringTime:(NSDate *) otherDate;
@end