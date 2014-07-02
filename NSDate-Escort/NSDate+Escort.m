#import "NSDate+Escort.h"

// TODO: Must be calculated using AZ_currentCalendar rather than fixed values
//       (For example, length of day varies when you use NSChineseCalendar, NSHebrewCalendar, and so on)
//       These fixed value only guaranteed to be valid for NSGregorianCalendar
//
//       Strategy:
//       - If the current calendar is NSGregorianCalendar (which is 99% of case), all units are
//         guaranteed to be fixed (except for leap seconds) so we can immediately return fixed values.
//       - Some of calendars other than NSGregorianCalendar, such as NSJapaneseCalendar, uses
//         same soloar calendar as NSGregorianCalendar. Those known calendars can also use fixed values.
//       - For the lest of calendars, those units might be dynamic by day because of its lunar calendar.
//         We must calculate units for each days/calendars thus no caches are available.
//
#define SECONDS_IN_MINUTE 60
#define MINUTES_IN_HOUR 60
#define DAYS_IN_WEEK 7
#define SECONDS_IN_HOUR (SECONDS_IN_MINUTE * MINUTES_IN_HOUR)
#define HOURS_IN_DAY 24
#define SECONDS_IN_DAY (HOURS_IN_DAY * SECONDS_IN_HOUR)

@implementation NSDate (Escort)

static NSString * AZ_DefaultCalendarIdentifier = nil;
static NSLock * AZ_DefaultCalendarIdentifierLock = nil;
static dispatch_once_t AZ_DefaultCalendarIdentifierLock_onceToken;

#pragma mark - private
+ (NSCalendar *)AZ_currentCalendar {
    NSString *key = @"AZ_currentCalendar_";
    NSString *calendarIdentifier = [NSDate AZ_defaultCalendarIdentifier];
    if (calendarIdentifier) {
        key = [key stringByAppendingString:calendarIdentifier];
    }
    NSMutableDictionary *dictionary = [[NSThread currentThread] threadDictionary];
    NSCalendar *currentCalendar = [dictionary objectForKey:key];
    if (currentCalendar == nil) {
        if (calendarIdentifier == nil) {
            currentCalendar = [NSCalendar currentCalendar];
        } else {
            currentCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:calendarIdentifier];
            NSAssert(currentCalendar != nil, @"NSDate-Escort failed to create a calendar since the provided calendarIdentifier is invalid.");
        }
        [dictionary setObject:currentCalendar forKey:key];
    }
    return currentCalendar;
}
#pragma mark - Setting default calendar
+ (NSString *)AZ_defaultCalendarIdentifier {
    dispatch_once(&AZ_DefaultCalendarIdentifierLock_onceToken, ^{
        AZ_DefaultCalendarIdentifierLock = [[NSLock alloc] init];
    });
    NSString *string;
    [AZ_DefaultCalendarIdentifierLock lock];
    string = AZ_DefaultCalendarIdentifier;
    [AZ_DefaultCalendarIdentifierLock unlock];
    return string;
}
+ (void)AZ_setDefaultCalendarIdentifier:(NSString *)calendarIdentifier {
    dispatch_once(&AZ_DefaultCalendarIdentifierLock_onceToken, ^{
        AZ_DefaultCalendarIdentifierLock = [[NSLock alloc] init];
    });
    [AZ_DefaultCalendarIdentifierLock lock];
    AZ_DefaultCalendarIdentifier = calendarIdentifier;
    [AZ_DefaultCalendarIdentifierLock unlock];
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
    NSCalendarUnit unitFlags = NSEraCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    NSDateComponents *components1 = [currentCalendar components:unitFlags fromDate:self];
    NSDateComponents *components2 = [currentCalendar components:unitFlags fromDate:otherDate];
    return (components1.era == components2.era) &&
        (components1.year == components2.year) &&
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
    NSCalendar *calendar = [NSDate AZ_currentCalendar];
    NSDateComponents *componentsSelf = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:self];
    NSDateComponents *componentsArgs = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:aDate];
    if (componentsSelf.year != componentsArgs.year || componentsSelf.month != componentsArgs.month) {
        return NO;
    }
    return YES;
}

- (BOOL)isThisMonth {
    return [self isSameMonthAsDate:[NSDate date]];
}

- (BOOL)isSameYearAsDate:(NSDate *) aDate {
    NSCalendar *calendar = [NSDate AZ_currentCalendar];
    NSDateComponents *componentsSelf = [calendar components:NSYearCalendarUnit fromDate:self];
    NSDateComponents *componentsArgs = [calendar components:NSYearCalendarUnit fromDate:aDate];
    if (componentsSelf.year != componentsArgs.year) {
        return NO;
    }
    return YES;
}

- (BOOL)isThisYear {
    return [self isSameYearAsDate:[NSDate date]];
}

- (BOOL)isNextYear {
    NSCalendar *calendar = [NSDate AZ_currentCalendar];
    NSDateComponents *componentsSelf = [calendar components:NSYearCalendarUnit fromDate:self];
    NSDateComponents *componentsNextYear = [calendar components:NSYearCalendarUnit fromDate:[NSDate date]];
    componentsNextYear.year += 1;
    if (componentsSelf.year != componentsNextYear.year) {
        return NO;
    }
    return YES;
}

- (BOOL)isLastYear {
    NSCalendar *calendar = [NSDate AZ_currentCalendar];
    NSDateComponents *componentsSelf = [calendar components:NSYearCalendarUnit fromDate:self];
    NSDateComponents *componentsLastYear = [calendar components:NSYearCalendarUnit fromDate:[NSDate date]];
    componentsLastYear.year -= 1;
    if (componentsSelf.year != componentsLastYear.year) {
        return NO;
    }
    return YES;
}

- (BOOL)isEarlierThanDate:(NSDate *) aDate {
    return ([self compare:aDate] == NSOrderedAscending);
}

- (BOOL)isLaterThanDate:(NSDate *) aDate {
    return ([self compare:aDate] == NSOrderedDescending);
}

- (BOOL)isEarlierThanOrEqualDate:(NSDate *) aDate {
    NSComparisonResult comparisonResult = [self compare:aDate];
    return (comparisonResult == NSOrderedAscending) || (comparisonResult == NSOrderedSame);
}

- (BOOL)isLaterThanOrEqualDate:(NSDate *) aDate {
    NSComparisonResult comparisonResult = [self compare:aDate];
    return (comparisonResult == NSOrderedDescending) || (comparisonResult == NSOrderedSame);
}

- (BOOL)isInPast {
    return [self isEarlierThanDate:[NSDate date]];
}

- (BOOL)isInFuture {
    return [self isLaterThanDate:[NSDate date]];
}


#pragma mark - Date roles
// https://github.com/erica/NSDate-Extensions/issues/12
- (BOOL)isTypicallyWorkday {
    return ([self isTypicallyWeekend] == NO);
}

- (BOOL)isTypicallyWeekend {
    NSCalendar *calendar = [NSDate AZ_currentCalendar];
    NSRange weekdayRange = [calendar maximumRangeOfUnit:NSWeekdayCalendarUnit];
    NSDateComponents *components = [calendar components:NSWeekdayCalendarUnit fromDate:self];
    NSInteger weekdayOfDate = [components weekday];
    if (weekdayOfDate == weekdayRange.location || weekdayOfDate == weekdayRange.length) {
        return YES;
    }
    return NO;
}

#pragma mark - Adjusting dates
- (NSDate *)dateByAddingYears:(NSInteger) dYears {
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.year = dYears;
    NSCalendar *calendar = [NSDate AZ_currentCalendar];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)dateBySubtractingYears:(NSInteger) dYears {
    return [self dateByAddingYears:-dYears];
}

- (NSDate *)dateByAddingMonths:(NSInteger) dMonths {
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.month = dMonths;
    NSCalendar *calendar = [NSDate AZ_currentCalendar];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)dateBySubtractingMonths:(NSInteger) dMonths {
    return [self dateByAddingMonths:-dMonths];
}

- (NSDate *)dateByAddingDays:(NSInteger) dDays {
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.day = dDays;
    NSCalendar *calendar = [NSDate AZ_currentCalendar];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)dateBySubtractingDays:(NSInteger) dDays {
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.day = -dDays;
    NSCalendar *calendar = [NSDate AZ_currentCalendar];
    return [calendar dateByAddingComponents:components toDate:self options:0];

}

- (NSDate *)dateByAddingHours:(NSInteger) dHours {
    return [self dateByAddingTimeInterval:(SECONDS_IN_HOUR * dHours)];
}

- (NSDate *)dateBySubtractingHours:(NSInteger) dHours {
    return [self dateByAddingTimeInterval:-(SECONDS_IN_HOUR * dHours)];
}

- (NSDate *)dateByAddingMinutes:(NSInteger) dMinutes {
    return [self dateByAddingTimeInterval:(SECONDS_IN_MINUTE * dMinutes)];
}

- (NSDate *)dateBySubtractingMinutes:(NSInteger) dMinutes {
    return [self dateByAddingTimeInterval:-(SECONDS_IN_MINUTE * dMinutes)];
}

- (NSDate *)dateAtStartOfDay {
    NSCalendar *calendar = [NSDate AZ_currentCalendar];
    NSDateComponents *components = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit fromDate:self];
    components.hour = 0;
    components.minute = 0;
    components.second = 0;
    return [calendar dateFromComponents:components];
}

- (NSDate *)dateAtEndOfDay {
    NSCalendar *calendar = [NSDate AZ_currentCalendar];
    NSDateComponents *components = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit fromDate:self];
    components.hour = 23;
    components.minute = 59;
    components.second = 59;
    return [calendar dateFromComponents:components];
}

- (NSDate *)dateAtStartOfWeek
{
    NSDate *startOfWeek = nil;
    [[NSDate AZ_currentCalendar] rangeOfUnit:NSWeekCalendarUnit startDate:&startOfWeek interval:NULL forDate:self];
    return startOfWeek;
}

- (NSDate *)dateAtEndOfWeek
{
    NSCalendar *calendar = [NSDate AZ_currentCalendar];
    NSDateComponents *components = [calendar components:NSYearForWeekOfYearCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSWeekdayCalendarUnit | NSWeekCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit fromDate:self];
    NSRange range = [calendar rangeOfUnit:NSDayCalendarUnit inUnit:NSWeekCalendarUnit forDate:self];
    components.weekday = range.length;
    return [calendar dateFromComponents:components];
}
- (NSDate *)dateAtStartOfMonth {
    NSCalendar *calendar = [NSDate AZ_currentCalendar];
    NSDateComponents *components = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit fromDate:self];
    NSRange range = [calendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:self];
    components.day = range.location;
    return [calendar dateFromComponents:components];
}

- (NSDate *)dateAtEndOfMonth {
    NSCalendar *calendar = [NSDate AZ_currentCalendar];
    NSDateComponents *components = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit fromDate:self];
    NSRange range = [calendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:self];
    components.day = range.length;
    return [calendar dateFromComponents:components];
}

- (NSDate *)dateAtStartOfYear {
    NSCalendar *calendar = [NSDate AZ_currentCalendar];
    NSDateComponents *components = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit fromDate:self];
    NSRange monthRange = [calendar rangeOfUnit:NSMonthCalendarUnit inUnit:NSYearCalendarUnit forDate:self];
    NSRange dayRange = [calendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:self];
    components.day = dayRange.location;
    components.month = monthRange.location;
    NSDate *startOfYear = [calendar dateFromComponents:components];
    return startOfYear;
}

- (NSDate *)dateAtEndOfYear {
    NSCalendar *calendar = [NSDate AZ_currentCalendar];
    NSDateComponents *components = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit fromDate:self];
    NSRange monthRange = [calendar rangeOfUnit:NSMonthCalendarUnit inUnit:NSYearCalendarUnit forDate:self];
    components.month = monthRange.length;

    NSDate *endMonthOfYear = [calendar dateFromComponents:components];
    NSRange dayRange = [calendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:endMonthOfYear];
    components.day = dayRange.length;
    NSDate *endOfYear = [calendar dateFromComponents:components];
    return endOfYear;
}


#pragma mark - Retrieving intervals
- (NSInteger)minutesAfterDate:(NSDate *) aDate {
    NSTimeInterval timeIntervalSinceDate = [self timeIntervalSinceDate:aDate];
    return (NSInteger)(timeIntervalSinceDate / SECONDS_IN_MINUTE);
}

- (NSInteger)minutesBeforeDate:(NSDate *) aDate {
    NSTimeInterval timeIntervalSinceDate = [aDate timeIntervalSinceDate:self];
    return (NSInteger)(timeIntervalSinceDate / SECONDS_IN_MINUTE);
}

- (NSInteger)hoursAfterDate:(NSDate *) aDate {
    NSTimeInterval timeIntervalSinceDate = [self timeIntervalSinceDate:aDate];
    return (NSInteger)(timeIntervalSinceDate / SECONDS_IN_HOUR);
}

- (NSInteger)hoursBeforeDate:(NSDate *) aDate {
    NSTimeInterval timeIntervalSinceDate = [aDate timeIntervalSinceDate:self];
    return (NSInteger)(timeIntervalSinceDate / SECONDS_IN_HOUR);
}

- (NSInteger)daysAfterDate:(NSDate *) aDate {
    NSTimeInterval timeIntervalSinceDate = [self timeIntervalSinceDate:aDate];
    return (NSInteger)(timeIntervalSinceDate / SECONDS_IN_DAY);
}

- (NSInteger)daysBeforeDate:(NSDate *) aDate {
    NSTimeInterval timeIntervalSinceDate = [aDate timeIntervalSinceDate:self];
    return (NSInteger)(timeIntervalSinceDate / SECONDS_IN_DAY);
}

- (NSInteger)monthsAfterDate:(NSDate *) aDate {
    NSInteger result = (self.gregorianYear - aDate.gregorianYear) * 12 + (self.month - aDate.month);

    if (result == 0) {
        return 0;
    } else if (0 < result) {
        if (aDate.day < self.day || (aDate.day == self.day && [self timeIntervalIgnoringDay:aDate] <= 0)) {
            return result;
        } else {
            return result - 1;
        }
    } else {
        if (self.day < aDate.day || (self.day == aDate.day && 0 <= [self timeIntervalIgnoringDay:aDate])) {
            return result;
        } else {
            return result + 1;
        }
    }
}

- (NSInteger)monthsBeforeDate:(NSDate *) aDate {
    return -[self monthsAfterDate:aDate];
}

- (NSTimeInterval)timeIntervalIgnoringDay:(NSDate *) aDate {
    NSCalendar *calendar = [NSDate AZ_currentCalendar];
    enum NSCalendarUnit unitFlags = NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *components = [calendar components:unitFlags fromDate:aDate];
    NSDateComponents *components1 = [calendar components:unitFlags fromDate:self];
    return [[calendar dateFromComponents:components] timeIntervalSinceDate:[calendar dateFromComponents:components1]];
}

- (NSInteger)distanceInDaysToDate:(NSDate *) aDate {
    NSCalendar *calendar = [NSDate AZ_currentCalendar];
    NSDateComponents *dateComponents = [calendar
        components:NSDayCalendarUnit fromDate:self toDate:aDate options:0];
    return [dateComponents day];
}
#pragma mark - Decomposing dates
// NSDate-Utilities API is broken?
- (NSInteger)nearestHour {
    NSCalendar *calendar = [NSDate AZ_currentCalendar];
    NSRange minuteRange = [calendar rangeOfUnit:NSMinuteCalendarUnit inUnit:NSHourCalendarUnit forDate:self];
    // always 30...
    NSInteger halfMinuteInHour = minuteRange.length / 2;
    NSInteger currentMinute = self.minute;
    if (currentMinute < halfMinuteInHour) {
        return self.hour;
    } else {
        NSDate *anHourLater = [self dateByAddingHours:1];
        return [anHourLater hour];
    }
}

- (NSInteger)hour {
    NSDateComponents *components = [[NSDate AZ_currentCalendar] components:NSHourCalendarUnit fromDate:self];
    return [components hour];
}

- (NSInteger)minute {
    NSDateComponents *components = [[NSDate AZ_currentCalendar] components:NSMinuteCalendarUnit fromDate:self];
    return [components minute];
}

- (NSInteger)seconds {
    NSDateComponents *components = [[NSDate AZ_currentCalendar] components:NSSecondCalendarUnit fromDate:self];
    return [components second];
}

- (NSInteger)day {
    NSDateComponents *components = [[NSDate AZ_currentCalendar] components:NSDayCalendarUnit fromDate:self];
    return [components day];
}

- (NSInteger)month {
    NSDateComponents *components = [[NSDate AZ_currentCalendar] components:NSMonthCalendarUnit fromDate:self];
    return [components month];
}

- (NSInteger)week {
    NSDateComponents *components = [[NSDate AZ_currentCalendar] components:NSWeekCalendarUnit fromDate:self];
    return [components week];
}

- (NSInteger)weekday {
    NSDateComponents *components = [[NSDate AZ_currentCalendar] components:NSWeekdayCalendarUnit fromDate:self];
    return [components weekday];
}

// http://stackoverflow.com/questions/11681815/current-week-start-and-end-date
- (NSInteger)firstDayOfWeekday {
    NSDate *startOfTheWeek;
    NSTimeInterval interval;
    [[NSDate AZ_currentCalendar] rangeOfUnit:NSWeekCalendarUnit
                                 startDate:&startOfTheWeek
                                 interval:&interval
                                 forDate:self];
    return [startOfTheWeek day];
}

- (NSInteger)lastDayOfWeekday {
    return [self firstDayOfWeekday] + (DAYS_IN_WEEK - 1);
}

- (NSInteger)nthWeekday {
    NSDateComponents *components = [[NSDate AZ_currentCalendar] components:NSWeekdayOrdinalCalendarUnit fromDate:self];
    return [components weekdayOrdinal];
}

- (NSInteger)year {
    NSDateComponents *components = [[NSDate AZ_currentCalendar] components:NSYearCalendarUnit fromDate:self];
    return [components year];
}
- (NSInteger)gregorianYear {
    NSCalendar *currentCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [currentCalendar components:NSEraCalendarUnit | NSYearCalendarUnit fromDate:self];
    return [components year];
}

@end
