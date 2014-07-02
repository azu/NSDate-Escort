// LICENSE : MIT

#import <Foundation/Foundation.h>

@interface NSDate (Escort)

#pragma mark - Setting default calendar

/**
 Returns the calendarIdentifier of calendars that is used by this library for date calculation.
 @see AZ_setDefaultCalendarIdentifier: for more details.
 */
+ (NSString *)AZ_defaultCalendarIdentifier;
/**
 Sets the calendarIdentifier of calendars that is used by this library for date calculation.
 You can specify any calendarIdentifiers predefined by NSLocale. If you provide nil, the library uses
 [NSCalendar currentCalendar]. Default value is nil.
 
 You can't provide individual calendars for individual date objects. If you need to perform such
 complicated date calculations, you should rather create calendars on your own.
 */
+ (void)AZ_setDefaultCalendarIdentifier:(NSString *)calendarIdentifier;

#pragma mark - Relative dates from the current date
+ (NSDate *)dateTomorrow;

+ (NSDate *)dateYesterday;

+ (NSDate *)dateWithDaysFromNow:(NSInteger) dDays;

+ (NSDate *)dateWithDaysBeforeNow:(NSInteger) dDays;

+ (NSDate *)dateWithHoursFromNow:(NSInteger) dHours;

+ (NSDate *)dateWithHoursBeforeNow:(NSInteger) dHours;

+ (NSDate *)dateWithMinutesFromNow:(NSInteger) dMinutes;

+ (NSDate *)dateWithMinutesBeforeNow:(NSInteger) dMinutes;

#pragma mark - Comparing dates

- (BOOL)isEqualToDateIgnoringTime:(NSDate *) otherDate;

- (BOOL)isToday;

- (BOOL)isTomorrow;

- (BOOL)isYesterday;

- (BOOL)isSameWeekAsDate:(NSDate *) aDate;

- (BOOL)isThisWeek;

- (BOOL)isNextWeek;

- (BOOL)isLastWeek;

- (BOOL)isSameMonthAsDate:(NSDate *) aDate;

- (BOOL)isThisMonth;

- (BOOL)isSameYearAsDate:(NSDate *) aDate;

- (BOOL)isThisYear;

- (BOOL)isNextYear;

- (BOOL)isLastYear;

- (BOOL)isEarlierThanDate:(NSDate *) aDate;

- (BOOL)isLaterThanDate:(NSDate *) aDate;

- (BOOL)isEarlierThanOrEqualDate:(NSDate *) aDate;

- (BOOL)isLaterThanOrEqualDate:(NSDate *) aDate;

- (BOOL)isInFuture;

- (BOOL)isInPast;

#pragma mark - Date roles

- (BOOL)isTypicallyWorkday;

- (BOOL)isTypicallyWeekend;

#pragma mark - Adjusting dates
- (NSDate *)dateByAddingYears:(NSInteger) dYears;

- (NSDate *)dateBySubtractingYears:(NSInteger) dYears;

- (NSDate *)dateByAddingMonths:(NSInteger) dMonths;

- (NSDate *)dateBySubtractingMonths:(NSInteger) dMonths;

- (NSDate *)dateByAddingDays:(NSInteger) dDays;

- (NSDate *)dateBySubtractingDays:(NSInteger) dDays;

- (NSDate *)dateByAddingHours:(NSInteger) dHours;

- (NSDate *)dateBySubtractingHours:(NSInteger) dHours;

- (NSDate *)dateByAddingMinutes:(NSInteger) dMinutes;

- (NSDate *)dateBySubtractingMinutes:(NSInteger) dMinutes;

- (NSDate *)dateAtStartOfDay;

- (NSDate *)dateAtEndOfDay;

- (NSDate *)dateAtStartOfWeek;

- (NSDate *)dateAtEndOfWeek;

- (NSDate *)dateAtStartOfMonth;

- (NSDate *)dateAtEndOfMonth;

- (NSDate *)dateAtStartOfYear;

- (NSDate *)dateAtEndOfYear;

#pragma mark - Retrieving intervals

- (NSInteger)minutesAfterDate:(NSDate *) aDate;

- (NSInteger)minutesBeforeDate:(NSDate *) aDate;

- (NSInteger)hoursAfterDate:(NSDate *) aDate;

- (NSInteger)hoursBeforeDate:(NSDate *) aDate;

- (NSInteger)daysAfterDate:(NSDate *) aDate;

- (NSInteger)daysBeforeDate:(NSDate *) aDate;

- (NSInteger)monthsAfterDate:(NSDate *) aDate;

- (NSInteger)monthsBeforeDate:(NSDate *) aDate;

/**
* return distance days
*/
- (NSInteger)distanceInDaysToDate:(NSDate *) aDate;

#pragma mark - Decomposing dates
/**
* return nearest hour
*/
@property(readonly) NSInteger nearestHour;
@property(readonly) NSInteger hour;
@property(readonly) NSInteger minute;
@property(readonly) NSInteger seconds;
@property(readonly) NSInteger day;
@property(readonly) NSInteger month;
@property(readonly) NSInteger week;
//  in the Gregorian calendar, n is 7 and Sunday is represented by 1.
@property(readonly) NSInteger weekday;
@property(readonly) NSInteger firstDayOfWeekday;
@property(readonly) NSInteger lastDayOfWeekday;
// e.g. 2nd Tuesday of the month == 2
@property(readonly) NSInteger nthWeekday;
@property(readonly) NSInteger year;
@property(readonly) NSInteger gregorianYear;
@end
