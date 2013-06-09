#import "NSDate+Escort.h"

@implementation NSDate (Escort)
+ (NSDate *)dateTomorrow {
    return [[NSDate date] dateByAddingTimeInterval:SECONDS_IN_DAY];
}

+ (NSDate *)dateYesterday {
    return [[NSDate date] dateByAddingTimeInterval:-SECONDS_IN_DAY];
}

+ (NSDate *)dateWithDaysFromNow:(NSInteger) days {

    return [[NSDate date] dateByAddingTimeInterval:SECONDS_IN_DAY * days];
}

+ (NSDate *)dateWithDaysBeforeNow:(NSInteger) days {
    [[NSDate date] timeIntervalSinceReferenceDate];
    return nil;
}

+ (NSDate *)dateWithHoursFromNow:(NSInteger) dHours {
    [NSDate timeIntervalSinceReferenceDate]
    return nil;
}

+ (NSDate *)dateWithHoursBeforeNow:(NSInteger) dHours {
    return nil;
}

+ (NSDate *)dateWithMinutesFromNow:(NSInteger) dMinutes {
    return nil;
}

+ (NSDate *)dateWithMinutesBeforeNow:(NSInteger) dMinutes {
    return nil;
}

- (BOOL)isEqualToDateIgnoringTime:(NSDate *) other {
    return NO;
}

- (BOOL)isToday {
    return NO;
}

- (BOOL)isTomorrow {
    return NO;
}

- (BOOL)isYesterday {
    return NO;
}

- (BOOL)isSameWeekAsDate:(NSDate *) aDate {
    return NO;
}

- (BOOL)isThisWeek {
    return NO;
}

- (BOOL)isNextWeek {
    return NO;
}

- (BOOL)isLastWeek {
    return NO;
}

- (BOOL)isSameMonthAsDate:(NSDate *) aDate {
    return NO;
}

- (BOOL)isThisMonth {
    return NO;
}

- (BOOL)isSameYearAsDate:(NSDate *) aDate {
    return NO;
}

- (BOOL)isThisYear {
    return NO;
}

- (BOOL)isNextYear {
    return NO;
}

- (BOOL)isLastYear {
    return NO;
}

- (BOOL)isEarlierThanDate:(NSDate *) aDate {
    return NO;
}

- (BOOL)isLaterThanDate:(NSDate *) aDate {
    return NO;
}

- (BOOL)isInFuture {
    return NO;
}

- (BOOL)isInPast {
    return NO;
}

- (BOOL)isTypicallyWorkday {
    return NO;
}

- (BOOL)isTypicallyWeekend {
    return NO;
}

- (NSDate *)dateByAddingDays:(NSInteger) dDays {
    return nil;
}

- (NSDate *)dateBySubtractingDays:(NSInteger) dDays {
    return nil;
}

- (NSDate *)dateByAddingHours:(NSInteger) dHours {
    return nil;
}

- (NSDate *)dateBySubtractingHours:(NSInteger) dHours {
    return nil;
}

- (NSDate *)dateByAddingMinutes:(NSInteger) dMinutes {
    return nil;
}

- (NSDate *)dateBySubtractingMinutes:(NSInteger) dMinutes {
    return nil;
}

- (NSDate *)dateAtStartOfDay {
    return nil;
}

- (NSInteger)minutesAfterDate:(NSDate *) aDate {
    return 0;
}

- (NSInteger)minutesBeforeDate:(NSDate *) aDate {
    return 0;
}

- (NSInteger)hoursAfterDate:(NSDate *) aDate {
    return 0;
}

- (NSInteger)hoursBeforeDate:(NSDate *) aDate {
    return 0;
}

- (NSInteger)daysAfterDate:(NSDate *) aDate {
    return 0;
}

- (NSInteger)daysBeforeDate:(NSDate *) aDate {
    return 0;
}

- (NSInteger)distanceInDaysToDate:(NSDate *) anotherDate {
    return 0;
}

@end