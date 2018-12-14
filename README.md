# NSDate-Escort [![Build Status](https://travis-ci.org/azu/NSDate-Escort.png?branch=master)](https://travis-ci.org/azu/NSDate-Escort)

A NSDate Category library.

Current Status : **RELEASE**

## Proposal

- [NSDate-Extensions](https://github.com/erica/NSDate-Extensions "NSDate-Extensions") Compatible API
- Cache & Fast implement
- [[![Build Status](https://travis-ci.org/azu/NSDate-Escort.png?branch=master)](https://travis-ci.org/azu/NSDate-Escort)] Test Test Test!
- Test multiple languages
- MIT License

## Installation

### CocoaPods

1. ``pod 'NSDate-Escort'``

### D&D

1. Drag and drop the `NSDate-Escort` folder into your project.

## Usage

``` objc
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
- (NSDate *)dateByAddingSeconds:(NSInteger) dSeconds;
- (NSDate *)dateBySubtractingSeconds:(NSInteger) dSeconds;
- (NSDate *)dateAtStartOfDay;
- (NSDate *)dateAtStartOfNextDay;
- (NSDate *)dateAtStartOfWeek;
- (NSDate *)dateAtStartOfNextWeek;
- (NSDate *)dateAtStartOfMonth;
- (NSDate *)dateAtStartOfNextMonth;
- (NSDate *)dateAtStartOfYear;
- (NSDate *)dateAtStartOfNextYear;

#pragma mark - Retrieving intervals
- (NSInteger)secondsAfterDate:(NSDate *) aDate;
- (NSInteger)secondsBeforeDate:(NSDate *) aDate;
- (NSInteger)minutesAfterDate:(NSDate *) aDate;
- (NSInteger)minutesBeforeDate:(NSDate *) aDate;
- (NSInteger)hoursAfterDate:(NSDate *) aDate;
- (NSInteger)hoursBeforeDate:(NSDate *) aDate;
- (NSInteger)daysAfterDate:(NSDate *) aDate;
- (NSInteger)daysBeforeDate:(NSDate *) aDate;
- (NSInteger)monthsAfterDate:(NSDate *) aDate;
- (NSInteger)monthsBeforeDate:(NSDate *) aDate;
- (NSInteger)distanceInDaysToDate:(NSDate *) aDate;

#pragma mark amount

- (NSInteger)hoursOfDay;
- (NSInteger)daysOfMonth;
- (NSInteger)daysOfYear;
- (NSInteger)monthsOfYear;

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

NS_ASSUME_NONNULL_END

```

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## Note

### What's the difference with [NSDate-Extensions](https://github.com/erica/NSDate-Extensions "NSDate-Extensions")?

This library has

* many test codes
* some additional methods.
* safely implements
* cache system

## Additional methods?

You should see `NSDate-Escort.h` :

``` objc
+ (NSString *)AZ_defaultCalendarIdentifier;
+ (void)AZ_setDefaultCalendarIdentifier:(NSString *)calendarIdentifier;

- (NSDate *)dateAtEndOfDay;
- (NSDate *)dateAtStartOfMonth;
- (NSDate *)dateAtEndOfMonth;
- (NSDate *)dateByAddingYears:(NSInteger) dYears;
- (NSDate *)dateBySubtractingYears:(NSInteger) dYears;
- (NSDate *)dateByAddingMonths:(NSInteger) dMonths;
- (NSDate *)dateBySubtractingMonths:(NSInteger) dMonths;
- (BOOL)isEarlierThanOrEqualDate:(NSDate *) aDate;
- (BOOL)isLaterThanOrEqualDate:(NSDate *) aDate;
- (NSInteger)monthsAfterDate:(NSDate *) aDate;
- (NSInteger)monthsBeforeDate:(NSDate *) aDate;
@property(readonly) NSInteger firstDayOfWeekday;
@property(readonly) NSInteger lastDayOfWeekday;
```

## Changelog

See [Releases · azu/NSDate-Escort](https://github.com/azu/NSDate-Escort/releases "Releases · azu/NSDate-Escort")

## License

MIT
