# NSDate-Escort [![Build Status](https://travis-ci.org/azu/NSDate-Escort.png?branch=master)](https://travis-ci.org/azu/NSDate-Escort) [![Coverage Status](https://coveralls.io/repos/azu/NSDate-Escort/badge.png?branch=master)](https://coveralls.io/r/azu/NSDate-Escort?branch=master)

A NSDate Category library.

Current Status : **RELEASE**

## Proposal

- [✔] [NSDate-Extensions](https://github.com/erica/NSDate-Extensions "NSDate-Extensions") Compatible API
- [✔] Cache & Fast implement
- [[![Build Status](https://travis-ci.org/azu/NSDate-Escort.png?branch=master)](https://travis-ci.org/azu/NSDate-Escort)] Test Test Test!
- [] Test multiple languages
- [[![Coverage Status](https://coveralls.io/repos/azu/NSDate-Escort/badge.png?branch=master)](https://coveralls.io/r/azu/NSDate-Escort?branch=master)] 100% Code Coverage
- [✔] MIT License

## Installation

### CocoaPods

1. ``pod 'NSDate-Escort', :git => 'https://github.com/azu/NSDate-Escort.git'``

### D&D

1. Drag and drop the `NSDate-Escort` folder into your project.

## Usage

``` objc
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

- (BOOL)isInFuture;

- (BOOL)isInPast;

#pragma mark - Date roles
// https://github.com/erica/NSDate-Extensions/issues/12
- (BOOL)isTypicallyWorkday;

- (BOOL)isTypicallyWeekend;

#pragma mark - Adjusting dates
- (NSDate *)dateByAddingDays:(NSInteger) dDays;

- (NSDate *)dateBySubtractingDays:(NSInteger) dDays;

- (NSDate *)dateByAddingHours:(NSInteger) dHours;

- (NSDate *)dateBySubtractingHours:(NSInteger) dHours;

- (NSDate *)dateByAddingMinutes:(NSInteger) dMinutes;

- (NSDate *)dateBySubtractingMinutes:(NSInteger) dMinutes;

- (NSDate *)dateAtStartOfDay;

// add

- (NSDate *)dateAtEndOfDay;

- (NSDate *)dateAtStartOfMonth;

- (NSDate *)dateAtEndOfMonth;

#pragma mark - Retrieving intervals
- (NSDate *)dateAtStartOfYear;

- (NSDate *)dateAtEndOfYear;

- (NSInteger)minutesAfterDate:(NSDate *) aDate;

- (NSInteger)minutesBeforeDate:(NSDate *) aDate;

- (NSInteger)hoursAfterDate:(NSDate *) aDate;

- (NSInteger)hoursBeforeDate:(NSDate *) aDate;

- (NSInteger)daysAfterDate:(NSDate *) aDate;

- (NSInteger)daysBeforeDate:(NSDate *) aDate;

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
@property(readonly) NSInteger nthWeekday; // e.g. 2nd Tuesday of the month == 2
@property(readonly) NSInteger year;
@end
```

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## License

MIT