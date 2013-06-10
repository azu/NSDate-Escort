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

+ (NSDate *)dateWithDaysFromNow:(NSInteger) dDays {
    NSTimeInterval timeInterval = [NSDate timeIntervalSinceReferenceDate] + (SECONDS_IN_DAY * dDays);
    return [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
}

+ (NSDate *)dateWithDaysBeforeNow:(NSInteger) dDays {
    NSTimeInterval timeInterval = [NSDate timeIntervalSinceReferenceDate] - (SECONDS_IN_DAY * dDays);
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
    return (components1.year == components2.year) &&
        (components1.month == components2.month) &&
        (components1.day == components2.day);
}

- (BOOL)isToday {
    return [self isEqualToDateIgnoringTime:[NSDate date]];
}

- (BOOL)isTomorrow {
    return [self isEqualToDateIgnoringTime:[NSDate dateTomorrow]];
}

- (BOOL)isYesterday {
    return [self isEqualToDateIgnoringTime:[NSDate dateYesterday]];
}

- (BOOL)isSameWeekAsDate:(NSDate *) aDate {
    NSCalendar *calendar = [NSDate AZ_currentCalendar];
    NSDateComponents *components1 = [calendar components:NSWeekCalendarUnit fromDate:self];
    NSDateComponents *components2 = [calendar components:NSWeekCalendarUnit fromDate:aDate];
    if (components1.week != components2.week) {
        return NO;
    }
    return (fabs([self timeIntervalSinceDate:aDate]) < (SECONDS_IN_DAY * DAYS_IN_WEEK));
}

- (BOOL)isThisWeek {
    return [self isSameWeekAsDate:[NSDate date]];
}

- (BOOL)isNextWeek {
    NSDate *nextWeek = [NSDate dateWithDaysFromNow:DAYS_IN_WEEK];
    return [self isSameWeekAsDate:nextWeek];
}

- (BOOL)isLastWeek {
    NSDate *lastWeek = [NSDate dateWithDaysBeforeNow:DAYS_IN_WEEK];
    return [self isSameWeekAsDate:lastWeek];
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
    NSTimeInterval timeInterval = [self timeIntervalSinceReferenceDate] + (SECONDS_IN_DAY * dDays);
    return [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
}

- (NSDate *)dateBySubtractingDays:(NSInteger) dDays {
    NSTimeInterval timeInterval = [self timeIntervalSinceReferenceDate] - (SECONDS_IN_DAY * dDays);
    return [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
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
    NSDateComponents *components = [[NSDate AZ_currentCalendar] components:NSWeekCalendarUnit fromDate:self];
    return [components week];
}

- (NSInteger)weekday {
    NSDateComponents *components = [[NSDate AZ_currentCalendar] components:NSWeekdayCalendarUnit fromDate:self];
    return [components weekday];
}

- (NSInteger)firstDayOfWeekday {
    CFCalendarRef currentCalendar = CFCalendarCopyCurrent();
    NSDateComponents *components = [[NSDate AZ_currentCalendar] components:NSDayCalendarUnit | NSWeekdayCalendarUnit fromDate:self];
    [components setDay:([components day] -
        ([components weekday] - CFCalendarGetFirstWeekday(currentCalendar)))];
    CFRelease(currentCalendar);
    return [components day];
}

- (NSInteger)lastDayOfWeekday {
    return [self firstDayOfWeekday] + (DAYS_IN_WEEK - 1);
}

- (NSInteger)nthWeekday {
    return 0;
}

- (NSInteger)year {
    NSDateComponents *components = [[NSDate AZ_currentCalendar] components:NSYearCalendarUnit fromDate:self];
    return [components year];
}

@end