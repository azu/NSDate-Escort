//
// Created by azu on 2013/06/23.
// License MIT
//


#import <SenTestingKit/SenTestingKit.h>
#import "NSDate+Escort.h"


#define SECONDS_IN_MINUTE 60
#define MINUTES_IN_HOUR 60
#define DAYS_IN_WEEK 7
#define SECONDS_IN_HOUR (SECONDS_IN_MINUTE * MINUTES_IN_HOUR)
#define HOURS_IN_DAY 24
#define SECONDS_IN_DAY (HOURS_IN_DAY * SECONDS_IN_HOUR)

// Test large Adding days
#define kAddingDays 10000

@interface dateByAddingTimeIntervalTests : SenTestCase
@end

@implementation dateByAddingTimeIntervalTests {
}

- (void)testDateByAddingTimeInterval {
    NSDate *currentDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSTimeInterval addingTimeInterval = SECONDS_IN_DAY * kAddingDays;
    NSDate *aHundredDays = [currentDate dateByAddingTimeInterval:addingTimeInterval];
    NSDateComponents *diffComponents = [calendar components:NSDayCalendarUnit fromDate:currentDate toDate:aHundredDays options:0];
    STAssertEquals([diffComponents day], kAddingDays, @"diff is %ddays", kAddingDays);
}

- (void)testDateByAddingComponents {
    NSDate *currentDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *aHundredDaysComponents = [[NSDateComponents alloc] init];
    aHundredDaysComponents.day = kAddingDays;
    NSDate *aHundredDays = [calendar dateByAddingComponents:aHundredDaysComponents toDate:currentDate options:0];
    NSDateComponents *diffComponents = [calendar components:NSDayCalendarUnit fromDate:currentDate toDate:aHundredDays options:0];
    STAssertEquals([diffComponents day], kAddingDays, @"diff is %ddays", kAddingDays);
}

@end
