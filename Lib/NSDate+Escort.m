#import "NSDate+Escort.h"

@implementation NSDate (Escort)
#pragma mark - private
+ (NSCalendar *)AZ_currentCalendar {
    NSMutableDictionary *dictionary = [[NSThread currentThread] threadDictionary];
    NSCalendar *currentCalendar = [dictionary objectForKey:@"SCDateReader"];
    if (currentCalendar == nil) {
        currentCalendar = [NSCalendar currentCalendar];
    }
    return currentCalendar;
}
#pragma mark - Relative dates from the current date
+ (NSDate *)dateTomorrow {
    NSTimeInterval timeInterval = [NSDate timeIntervalSinceReferenceDate] + (SECONDS_IN_DAY * 1);
    return [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
}

+ (NSDate *)dateYesterday {
    NSTimeInterval timeInterval = [NSDate timeIntervalSinceReferenceDate] - (SECONDS_IN_DAY * 1);
    return [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
}

+ (NSDate *)dateWithDaysFromNow:(NSInteger) days {
    NSTimeInterval timeInterval = [NSDate timeIntervalSinceReferenceDate] + (SECONDS_IN_DAY * days);
    return [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
}

+ (NSDate *)dateWithDaysBeforeNow:(NSInteger) days {
    NSTimeInterval timeInterval = [NSDate timeIntervalSinceReferenceDate] - (SECONDS_IN_DAY * days);
    return [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
}

+ (NSDate *)dateWithHoursFromNow:(NSInteger) dHours {
    NSTimeInterval timeInterval = [NSDate timeIntervalSinceReferenceDate] + (SECONDS_IN_HOUR * dHours);
    return [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
}

+ (NSDate *)dateWithHoursBeforeNow:(NSInteger) dHours {
    NSTimeInterval timeInterval = [NSDate timeIntervalSinceReferenceDate] - (SECONDS_IN_HOUR * dHours);
    return [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
}

+ (NSDate *)dateWithMinutesFromNow:(NSInteger) dMinutes {
    NSTimeInterval timeInterval = [NSDate timeIntervalSinceReferenceDate] + (SECONDS_IN_MINUTE * dMinutes);
    return [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
}

+ (NSDate *)dateWithMinutesBeforeNow:(NSInteger) dMinutes {
    NSTimeInterval timeInterval = [NSDate timeIntervalSinceReferenceDate] - (SECONDS_IN_MINUTE * dMinutes);
    return [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
}

#pragma mark - Comparing dates
- (BOOL)isEqualToDateIgnoringTime:(NSDate *) otherDate {
    NSCalendar *currentCalendar = [NSDate AZ_currentCalendar];
    NSCalendarUnit unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    NSDateComponents *components1 = [currentCalendar components:unitFlags fromDate:self];
    NSDateComponents *components2 = [currentCalendar components:unitFlags fromDate:otherDate];
    return ((components1.year == components2.year) &&
        (components1.month == components2.month) &&
        (components1.day == components2.day));
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

#pragma mark - Date roles
- (BOOL)isTypicallyWorkday {
    return NO;
}

- (BOOL)isTypicallyWeekend {
    return NO;
}

#pragma mark - Adjusting dates
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

#pragma mark - Retrieving intervals
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
#pragma mark - Decomposing dates
- (NSInteger)nearestHour {
    return 0;
}

- (NSInteger)hour {
    return 0;
}

- (NSInteger)minute {
    return 0;
}

- (NSInteger)seconds {
    return 0;
}

- (NSInteger)day {
    NSDateComponents *components = [[NSDate AZ_currentCalendar] components:NSDayCalendarUnit fromDate:self];
    return [components day];
}

- (NSInteger)month {
    return 0;
}

- (NSInteger)week {
    return 0;
}

- (NSInteger)weekday {
    return 0;
}

- (NSInteger)nthWeekday {
    return 0;
}

- (NSInteger)year {
    return 0;
}

@end