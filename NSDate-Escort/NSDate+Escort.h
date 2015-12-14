// LICENSE : MIT

#import <Foundation/Foundation.h>

@interface NSDate (Escort)

#pragma mark - Setting default calendar

/**
 Returns the calendarIdentifier of calendars that is used by this library for date calculation.
 @see AZ_setDefaultCalendarIdentifier: for more details.
 */
+ (NSString * _Nullable)AZ_defaultCalendarIdentifier;
/**
 Sets the calendarIdentifier of calendars that is used by this library for date calculation.
 You can specify any calendarIdentifiers predefined by NSLocale. If you provide nil, the library uses
 [NSCalendar currentCalendar]. Default value is nil.
 
 You can't provide individual calendars for individual date objects. If you need to perform such
 complicated date calculations, you should rather create calendars on your own.
 */
+ (void)AZ_setDefaultCalendarIdentifier:(NSString * _Nullable)calendarIdentifier;

#pragma mark - Relative dates from the current date
+ (NSDate * _Nonnull)dateTomorrow;

+ (NSDate * _Nonnull)dateYesterday;

+ (NSDate * _Nonnull)dateWithDaysFromNow:(NSInteger) dDays;

+ (NSDate * _Nonnull)dateWithDaysBeforeNow:(NSInteger) dDays;

+ (NSDate * _Nonnull)dateWithHoursFromNow:(NSInteger) dHours;

+ (NSDate * _Nonnull)dateWithHoursBeforeNow:(NSInteger) dHours;

+ (NSDate * _Nonnull)dateWithMinutesFromNow:(NSInteger) dMinutes;

+ (NSDate * _Nonnull)dateWithMinutesBeforeNow:(NSInteger) dMinutes;

#pragma mark - Comparing dates

- (BOOL)isEqualToDateIgnoringTime:(NSDate * _Nonnull) otherDate;

- (BOOL)isToday;

- (BOOL)isTomorrow;

- (BOOL)isYesterday;

- (BOOL)isSameWeekAsDate:(NSDate * _Nonnull) aDate;

- (BOOL)isThisWeek;

- (BOOL)isNextWeek;

- (BOOL)isLastWeek;

- (BOOL)isSameMonthAsDate:(NSDate * _Nonnull) aDate;

- (BOOL)isThisMonth;

- (BOOL)isSameYearAsDate:(NSDate * _Nonnull) aDate;

- (BOOL)isThisYear;

- (BOOL)isNextYear;

- (BOOL)isLastYear;

- (BOOL)isEarlierThanDate:(NSDate * _Nonnull) aDate;

- (BOOL)isLaterThanDate:(NSDate * _Nonnull) aDate;

- (BOOL)isEarlierThanOrEqualDate:(NSDate * _Nonnull) aDate;

- (BOOL)isLaterThanOrEqualDate:(NSDate * _Nonnull) aDate;

- (BOOL)isInFuture;

- (BOOL)isInPast;

#pragma mark - Date roles

- (BOOL)isTypicallyWorkday;

- (BOOL)isTypicallyWeekend;

#pragma mark - Adjusting dates
- (NSDate * _Nonnull)dateByAddingYears:(NSInteger) dYears;

- (NSDate * _Nonnull)dateBySubtractingYears:(NSInteger) dYears;

- (NSDate * _Nonnull)dateByAddingMonths:(NSInteger) dMonths;

- (NSDate * _Nonnull)dateBySubtractingMonths:(NSInteger) dMonths;

- (NSDate * _Nonnull)dateByAddingDays:(NSInteger) dDays;

- (NSDate * _Nonnull)dateBySubtractingDays:(NSInteger) dDays;

- (NSDate * _Nonnull)dateByAddingHours:(NSInteger) dHours;

- (NSDate * _Nonnull)dateBySubtractingHours:(NSInteger) dHours;

- (NSDate * _Nonnull)dateByAddingMinutes:(NSInteger) dMinutes;

- (NSDate * _Nonnull)dateBySubtractingMinutes:(NSInteger) dMinutes;

- (NSDate * _Nonnull)dateByAddingSeconds:(NSInteger) dSeconds;

- (NSDate * _Nonnull)dateBySubtractingSeconds:(NSInteger) dSeconds;

- (NSDate * _Nonnull)dateAtStartOfDay;

- (NSDate * _Nonnull)dateAtEndOfDay;

- (NSDate * _Nonnull)dateAtStartOfWeek;

- (NSDate * _Nonnull)dateAtEndOfWeek;

- (NSDate * _Nonnull)dateAtStartOfMonth;

- (NSDate * _Nonnull)dateAtEndOfMonth;

- (NSDate * _Nonnull)dateAtStartOfYear;

- (NSDate * _Nonnull)dateAtEndOfYear;

#pragma mark - Retrieving intervals
- (NSInteger)secondsAfterDate:(NSDate * _Nonnull) aDate;

- (NSInteger)secondsBeforeDate:(NSDate * _Nonnull) aDate;

- (NSInteger)minutesAfterDate:(NSDate * _Nonnull) aDate;

- (NSInteger)minutesBeforeDate:(NSDate * _Nonnull) aDate;

- (NSInteger)hoursAfterDate:(NSDate * _Nonnull) aDate;

- (NSInteger)hoursBeforeDate:(NSDate * _Nonnull) aDate;

- (NSInteger)daysAfterDate:(NSDate * _Nonnull) aDate;

- (NSInteger)daysBeforeDate:(NSDate * _Nonnull) aDate;

- (NSInteger)monthsAfterDate:(NSDate * _Nonnull) aDate;

- (NSInteger)monthsBeforeDate:(NSDate * _Nonnull) aDate;

/**
* return distance days
*/
- (NSInteger)distanceInDaysToDate:(NSDate * _Nonnull) aDate;

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
