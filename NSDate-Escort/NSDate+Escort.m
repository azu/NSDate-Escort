#import "NSDate+Escort.h"

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
- (NSInteger)numberOfDaysInWeek {
    return [[NSDate AZ_currentCalendar] maximumRangeOfUnit:NSCalendarUnitWeekday].length;
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
    return [NSDate dateWithDaysFromNow:1];
}

+ (NSDate *)dateYesterday {
    return [NSDate dateWithDaysBeforeNow:1];
}

+ (NSDate *)dateWithDaysFromNow:(NSInteger) dDays {
    return [[NSDate date] dateByAddingDays:dDays];
}

+ (NSDate *)dateWithDaysBeforeNow:(NSInteger) dDays {
    return [[NSDate date] dateBySubtractingDays:dDays];
}

+ (NSDate *)dateWithHoursFromNow:(NSInteger) dHours {
    return [[NSDate date] dateByAddingHours:dHours];
}

+ (NSDate *)dateWithHoursBeforeNow:(NSInteger) dHours {
    return [[NSDate date] dateBySubtractingHours:dHours];
}

+ (NSDate *)dateWithMinutesFromNow:(NSInteger) dMinutes {
    return [[NSDate date] dateByAddingMinutes:dMinutes];
}

+ (NSDate *)dateWithMinutesBeforeNow:(NSInteger) dMinutes {
    return [[NSDate date] dateBySubtractingMinutes:dMinutes];
}

#pragma mark - Comparing dates
- (BOOL)isEqualToDateIgnoringTime:(NSDate *) otherDate {
    NSCalendar *currentCalendar = [NSDate AZ_currentCalendar];
    NSCalendarUnit unitFlags = NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
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
    NSDate *left = [self dateBySubtractingDays:self.weekday];
    NSDate *right = [aDate dateBySubtractingDays:aDate.weekday];
    return [left isEqualToDateIgnoringTime:right];
}

- (BOOL)isThisWeek {
    return [self isSameWeekAsDate:[NSDate date]];
}

- (BOOL)isNextWeek {
    NSDate *nextWeek = [NSDate dateWithDaysFromNow:[self numberOfDaysInWeek]];
    return [self isSameWeekAsDate:nextWeek];
}

- (BOOL)isLastWeek {
    NSDate *lastWeek = [NSDate dateWithDaysBeforeNow:[self numberOfDaysInWeek]];
    return [self isSameWeekAsDate:lastWeek];
}

- (BOOL)isSameMonthAsDate:(NSDate *) aDate {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *componentsSelf = [calendar components:NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth fromDate:self];
    NSDateComponents *componentsArgs = [calendar components:NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth fromDate:aDate];
    return (componentsSelf.era == componentsArgs.era && componentsSelf.year == componentsArgs.year && componentsSelf.month == componentsArgs.month);
}

- (BOOL)isThisMonth {
    return [self isSameMonthAsDate:[NSDate date]];
}

- (BOOL)isSameYearAsDate:(NSDate *) aDate {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *componentsSelf = [calendar components:NSCalendarUnitEra | NSCalendarUnitYear fromDate:self];
    NSDateComponents *componentsArgs = [calendar components:NSCalendarUnitEra | NSCalendarUnitYear fromDate:aDate];
    return (componentsSelf.era == componentsArgs.era && componentsSelf.year == componentsArgs.year);
}

- (BOOL)isThisYear {
    return [self isSameYearAsDate:[NSDate date]];
}

- (BOOL)isNextYear {
    NSDate *nextYear = [[NSDate date] dateByAddingYears:1];
    return [self isSameYearAsDate:nextYear];
}

- (BOOL)isLastYear {
    NSDate *lastYear = [[NSDate date] dateBySubtractingYears:1];
    return [self isSameYearAsDate:lastYear];
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
    NSRange weekdayRange = [calendar maximumRangeOfUnit:NSCalendarUnitWeekday];
    NSDateComponents *components = [calendar components:NSCalendarUnitWeekday fromDate:self];
    NSInteger weekdayOfDate = [components weekday];
    return (weekdayOfDate == weekdayRange.location || weekdayOfDate == weekdayRange.location + weekdayRange.length - 1);
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
    return [self dateByAddingDays:-dDays];
}

- (NSDate *)dateByAddingHours:(NSInteger) dHours {
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.hour = dHours;
    NSCalendar *calendar = [NSDate AZ_currentCalendar];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)dateBySubtractingHours:(NSInteger) dHours {
    return [self dateByAddingHours:-dHours];
}

- (NSDate *)dateByAddingMinutes:(NSInteger) dMinutes {
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.minute = dMinutes;
    NSCalendar *calendar = [NSDate AZ_currentCalendar];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)dateBySubtractingMinutes:(NSInteger) dMinutes {
    return [self dateByAddingMinutes:-dMinutes];
}

- (NSDate *)dateAtStartOfDay {
    NSCalendar *calendar = [NSDate AZ_currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:self];
    components.hour = 0;
    components.minute = 0;
    components.second = 0;
    return [calendar dateFromComponents:components];
}

- (NSDate *)dateAtEndOfDay {
    NSCalendar *calendar = [NSDate AZ_currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:self];
    components.hour = 23;
    components.minute = 59;
    components.second = 59;
    return [calendar dateFromComponents:components];
}

- (NSDate *)dateAtStartOfWeek
{
    NSDate *startOfWeek = nil;
    [[NSDate AZ_currentCalendar] rangeOfUnit:NSCalendarUnitWeekOfMonth startDate:&startOfWeek interval:NULL forDate:self];
    return startOfWeek;
}

- (NSDate *)dateAtEndOfWeek
{
    NSCalendar *calendar = [NSDate AZ_currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitWeekday | NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:self];
    components.day += [self numberOfDaysInWeek] - components.weekday;
    return [calendar dateFromComponents:components];
}
- (NSDate *)dateAtStartOfMonth {
    NSCalendar *calendar = [NSDate AZ_currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:self];
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self];
    components.day = range.location;
    return [calendar dateFromComponents:components];
}

- (NSDate *)dateAtEndOfMonth {
    NSCalendar *calendar = [NSDate AZ_currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:self];
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self];
    components.day = range.length;
    return [calendar dateFromComponents:components];
}

- (NSDate *)dateAtStartOfYear {
    NSCalendar *calendar = [NSDate AZ_currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:self];
    NSRange monthRange = [calendar rangeOfUnit:NSCalendarUnitMonth inUnit:NSCalendarUnitYear forDate:self];
    NSRange dayRange = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self];
    components.day = dayRange.location;
    components.month = monthRange.location;
    NSDate *startOfYear = [calendar dateFromComponents:components];
    return startOfYear;
}

- (NSDate *)dateAtEndOfYear {
    NSCalendar *calendar = [NSDate AZ_currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:self];
    NSRange monthRange = [calendar rangeOfUnit:NSCalendarUnitMonth inUnit:NSCalendarUnitYear forDate:self];
    components.month = monthRange.length;

    NSDate *endMonthOfYear = [calendar dateFromComponents:components];
    NSRange dayRange = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:endMonthOfYear];
    components.day = dayRange.length;
    NSDate *endOfYear = [calendar dateFromComponents:components];
    return endOfYear;
}


#pragma mark - Retrieving intervals
- (NSInteger)minutesAfterDate:(NSDate *) aDate {
    NSDateComponents *components = [[NSDate AZ_currentCalendar] components:NSCalendarUnitMinute fromDate:aDate toDate:self options:0];
    return [components minute];
}

- (NSInteger)minutesBeforeDate:(NSDate *) aDate {
    NSDateComponents *components = [[NSDate AZ_currentCalendar] components:NSCalendarUnitMinute fromDate:self toDate:aDate options:0];
    return [components minute];
}

- (NSInteger)hoursAfterDate:(NSDate *) aDate {
    NSDateComponents *components = [[NSDate AZ_currentCalendar] components:NSCalendarUnitHour fromDate:aDate toDate:self options:0];
    return [components hour];
}

- (NSInteger)hoursBeforeDate:(NSDate *) aDate {
    NSDateComponents *components = [[NSDate AZ_currentCalendar] components:NSCalendarUnitHour fromDate:self toDate:aDate options:0];
    return [components hour];
}

- (NSInteger)daysAfterDate:(NSDate *) aDate {
    NSDateComponents *components = [[NSDate AZ_currentCalendar] components:NSCalendarUnitDay fromDate:aDate toDate:self options:0];
    return [components day];
}

- (NSInteger)daysBeforeDate:(NSDate *) aDate {
    NSDateComponents *components = [[NSDate AZ_currentCalendar] components:NSCalendarUnitDay fromDate:self toDate:aDate options:0];
    return [components day];
}

- (NSInteger)monthsAfterDate:(NSDate *) aDate {
    NSDateComponents *components = [[NSDate AZ_currentCalendar] components:NSCalendarUnitMonth fromDate:aDate toDate:self options:0];
    return [components month];
}

- (NSInteger)monthsBeforeDate:(NSDate *) aDate {
    NSDateComponents *components = [[NSDate AZ_currentCalendar] components:NSCalendarUnitMonth fromDate:self toDate:aDate options:0];
    return [components month];
}

- (NSTimeInterval)timeIntervalIgnoringDay:(NSDate *) aDate {
    NSCalendar *calendar = [NSDate AZ_currentCalendar];
    NSCalendarUnit unitFlags = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *components = [calendar components:unitFlags fromDate:aDate];
    NSDateComponents *components1 = [calendar components:unitFlags fromDate:self];
    return [[calendar dateFromComponents:components] timeIntervalSinceDate:[calendar dateFromComponents:components1]];
}

- (NSInteger)distanceInDaysToDate:(NSDate *) aDate {
    NSCalendar *calendar = [NSDate AZ_currentCalendar];
    NSDateComponents *dateComponents = [calendar
        components:NSCalendarUnitDay fromDate:self toDate:aDate options:0];
    return [dateComponents day];
}
#pragma mark - Decomposing dates
// NSDate-Utilities API is broken?
- (NSInteger)nearestHour {
    NSCalendar *calendar = [NSDate AZ_currentCalendar];
    NSRange minuteRange = [calendar rangeOfUnit:NSCalendarUnitMinute inUnit:NSCalendarUnitHour forDate:self];
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
    NSDateComponents *components = [[NSDate AZ_currentCalendar] components:NSCalendarUnitHour fromDate:self];
    return [components hour];
}

- (NSInteger)minute {
    NSDateComponents *components = [[NSDate AZ_currentCalendar] components:NSCalendarUnitMinute fromDate:self];
    return [components minute];
}

- (NSInteger)seconds {
    NSDateComponents *components = [[NSDate AZ_currentCalendar] components:NSCalendarUnitSecond fromDate:self];
    return [components second];
}

- (NSInteger)day {
    NSDateComponents *components = [[NSDate AZ_currentCalendar] components:NSCalendarUnitDay fromDate:self];
    return [components day];
}

- (NSInteger)month {
    NSDateComponents *components = [[NSDate AZ_currentCalendar] components:NSCalendarUnitMonth fromDate:self];
    return [components month];
}

- (NSInteger)week {
    NSDateComponents *components = [[NSDate AZ_currentCalendar] components:NSCalendarUnitWeekOfMonth fromDate:self];
    return [components weekOfMonth];
}

- (NSInteger)weekday {
    NSDateComponents *components = [[NSDate AZ_currentCalendar] components:NSCalendarUnitWeekday fromDate:self];
    return [components weekday];
}

// http://stackoverflow.com/questions/11681815/current-week-start-and-end-date
- (NSInteger)firstDayOfWeekday {
    NSDate *startOfTheWeek;
    NSTimeInterval interval;
    [[NSDate AZ_currentCalendar] rangeOfUnit:NSCalendarUnitWeekOfMonth
                                 startDate:&startOfTheWeek
                                 interval:&interval
                                 forDate:self];
    return [startOfTheWeek day];
}

- (NSInteger)lastDayOfWeekday {
    return [self firstDayOfWeekday] + ([self numberOfDaysInWeek] - 1);
}

- (NSInteger)nthWeekday {
    NSDateComponents *components = [[NSDate AZ_currentCalendar] components:NSCalendarUnitWeekdayOrdinal fromDate:self];
    return [components weekdayOrdinal];
}

- (NSInteger)year {
    NSDateComponents *components = [[NSDate AZ_currentCalendar] components:NSCalendarUnitYear fromDate:self];
    return [components year];
}
- (NSInteger)gregorianYear {
    NSCalendar *currentCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [currentCalendar components:NSCalendarUnitEra | NSCalendarUnitYear fromDate:self];
    return [components year];
}

@end
