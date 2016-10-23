//// LICENSE : MIT

import Foundation

fileprivate struct AZ_DateCalendar {
    private static var AZ_DefaultCalendarIdentifierLock = NSLock()
    private static var AZ_DefaultCalendarIdentifier: Calendar.Identifier?;
    
    static func AZ_defaultCalendarIdentifier() -> Calendar.Identifier? {
        var string: Calendar.Identifier?
        AZ_DefaultCalendarIdentifierLock.lock()
        string = AZ_DefaultCalendarIdentifier
        AZ_DefaultCalendarIdentifierLock.unlock()
        return string
    }
    static func AZ_setDefault(_ calendarIdentifier: Calendar.Identifier) {
        AZ_DefaultCalendarIdentifierLock.lock()
        AZ_DefaultCalendarIdentifier = calendarIdentifier;
        AZ_DefaultCalendarIdentifierLock.unlock()
    }
}

// Setting default calendar
extension Date {
    fileprivate static func AZ_currentCalendar() -> Calendar {
        var key = "AZ_currentCalendar_"
        let calendarIdentifier = AZ_DateCalendar.AZ_defaultCalendarIdentifier()
        if let calendarIdentifier = calendarIdentifier {
            key = key + String(calendarIdentifier.hashValue)
        }
        var dictionary = Thread.current.threadDictionary
        var currentCalendar = dictionary[key] as! Calendar?
        if currentCalendar == nil {
            if let calendarIdentifier = calendarIdentifier {
                currentCalendar = Calendar(identifier: calendarIdentifier) as Calendar?
                assert(currentCalendar != nil, "NSDate-Escort failed to create a calendar since the provided calendarIdentifier is invalid.")
            } else {
                currentCalendar = Calendar.current
            }
            dictionary[key] = currentCalendar
        }
        currentCalendar!.timeZone = NSTimeZone.local
        return currentCalendar!
    }
    /**
     Returns the calendarIdentifier of calendars that is used by this library for date calculation.
     @see AZ_setDefaultCalendarIdentifier: for more details.
     */
    public static func defaultCalendarIdentifer() -> Calendar.Identifier? {
        return AZ_DateCalendar.AZ_defaultCalendarIdentifier()
    }
    /**
     Sets the calendarIdentifier of calendars that is used by this library for date calculation.
     You can specify any calendarIdentifiers predefined by NSLocale. If you provide nil, the library uses
     [NSCalendar currentCalendar]. Default value is nil.
     
     You can't provide individual calendars for individual date objects. If you need to perform such
     complicated date calculations, you should rather create calendars on your own.
     */
    public static func setDefault(_ calendarIdentifier: Calendar.Identifier) {
        AZ_DateCalendar.AZ_setDefault(calendarIdentifier)
    }
}

extension Date {
    public static func build(
        era: Int? = nil,
        year: Int? = nil,
        month: Int? = nil,
        day: Int? = nil,
        hour: Int? = nil,
        minute: Int? = nil,
        second: Int? = nil,
        weekday: Int? = nil,
        weekdayOrdinal: Int? = nil,
        quarter: Int? = nil,
        weekOfMonth: Int? = nil,
        weekOfYear: Int? = nil,
        yearForWeekOfYear: Int? = nil,
        nanosecond: Int? = nil
        ) -> Date {
        return self.build(unit: [
            .era: era,
            .year: year,
            .month: month,
            .day: day,
            .hour: hour,
            .minute: minute,
            .second: second,
            .weekday: weekday,
            .weekdayOrdinal: weekdayOrdinal,
            .quarter: quarter,
            .weekOfMonth: weekOfMonth,
            .weekOfYear: weekOfYear,
            .yearForWeekOfYear: yearForWeekOfYear,
            .nanosecond: nanosecond,
            ])
    }
    public static func build(unit: [Calendar.Component: Int?]) -> Date {
        let calendar = Calendar(identifier: .gregorian)
        var dateComponents = DateComponents()
        dateComponents.calendar = calendar
        for key in unit.keys {
            let number = unit[key]!;
            if let number = number {
                dateComponents.setValue(number, for: key)
            }
        }
        return calendar.date(from: dateComponents)!
    }
    public func build(
        era: Int? = nil,
        year: Int? = nil,
        month: Int? = nil,
        day: Int? = nil,
        hour: Int? = nil,
        minute: Int? = nil,
        second: Int? = nil,
        nanosecond: Int? = nil
        ) -> Date {
        return self.build(unit: [
            .era: era,
            .year: year,
            .month: month,
            .day: day,
            .hour: hour,
            .minute: minute,
            .second: second,
            .nanosecond: nanosecond,
            ])
    }
    public func build(unit: [Calendar.Component: Int?]) -> Date {
        let calendar = Calendar(identifier: .gregorian)
        var dateComponents = calendar.dateComponents([.era, .year, .month, .day, .hour, .minute, .second, .nanosecond,], from: self)
        dateComponents.calendar = calendar
        for key in unit.keys {
            let number = unit[key]!;
            if let number = number {
                dateComponents.setValue(number, for: key)
            }
        }
        return calendar.date(from: dateComponents)!;
    }
    public func add(
        era: Int? = nil,
        year: Int? = nil,
        month: Int? = nil,
        day: Int? = nil,
        hour: Int? = nil,
        minute: Int? = nil,
        second: Int? = nil,
        nanosecond: Int? = nil
        ) -> Date {
        return self.add(unit: [
            .era: era,
            .year: year,
            .month: month,
            .day: day,
            .hour: hour,
            .minute: minute,
            .second: second,
            .nanosecond: nanosecond,
            ])
    }
    public func add(unit: [Calendar.Component: Int?]) -> Date {
        let calendar = Calendar(identifier: .gregorian)
        var dateComponents = calendar.dateComponents([.era, .year, .month, .day, .hour, .minute, .second, .nanosecond,], from: self)
        dateComponents.calendar = calendar
        for key in unit.keys {
            let number = unit[key]!;
            if let number = number {
                dateComponents.setValue(dateComponents.value(for: key)! + number, for: key)
            }
        }
        return calendar.date(from: dateComponents)!;
    }
    
    public static func tomorrow() -> Date {
        return Date().add(day: 1)
    }
    public static func yesterday() -> Date {
        return Date().add(day: -1)
    }
    public func isEqualToDateIgnoringTime(_ date: Date) -> Bool {
        return self.ignoreingTime() == date.ignoreingTime()
    }
    public func ignoreingTime() -> Date {
        return self.build(hour: 0, minute: 0, second: 0, nanosecond: 0)
    }
    public func isToday() -> Bool {
        return self.ignoreingTime() == Date().ignoreingTime()
    }
    public func isTomorrow() -> Bool {
        return self.ignoreingTime() == Date.tomorrow().ignoreingTime()
    }
    public func isYesterday() -> Bool {
        return self.ignoreingTime() == Date.yesterday().ignoreingTime()
    }
    public func isSameWeek(as aDate: Date) -> Bool {
        let currentCalendar = Date.AZ_currentCalendar()
        let leftWeekday = self.weekday() + ((self.weekday() < currentCalendar.firstWeekday) ? 7 : 0);
        let left = self.add(day: -leftWeekday)
        let rightWeekday = aDate.weekday() + ((aDate.weekday() < currentCalendar.firstWeekday) ? 7 : 0);
        let right = aDate.add(day: -rightWeekday)
        return left.isEqualToDateIgnoringTime(right)
    }
    public func isThisWeek() -> Bool {
        return self.isSameWeek(as: Date())
    }
    public func isNextWeek() -> Bool {
        return self.isSameWeek(as: Date().add(day: self.numberOfDaysInWeek()))
    }
    public func isLastWeek() -> Bool {
        return self.isSameWeek(as: Date().add(day: -self.numberOfDaysInWeek()))
    }
    public func isSameMonth(as date: Date) -> Bool {
        return self.startOfMonth().isEqualToDateIgnoringTime(date.startOfMonth())
    }
    public func isThisMonth() -> Bool {
        return self.isSameMonth(as: Date())
    }
    public func isSameYear(as date: Date) -> Bool {
        return self.startOfYear().isSameMonth(as: date.startOfYear())
    }
    public func isThisYear() -> Bool {
        return self.isSameYear(as: Date())
    }
    public func isNextYear() -> Bool {
        return self.isSameYear(as: Date().add(year: 1))
    }
    public func isLastYear() -> Bool {
        return self.isSameYear(as: Date().add(year: -1))
    }
    public func isEarlier(than date: Date) -> Bool {
        return (self.compare(date) == .orderedAscending)
    }
    public func isLater(than date: Date) -> Bool {
        return (self.compare(date) == .orderedDescending)
    }
    public func isEarlier(thanOrEqual date: Date) -> Bool {
        return (self.compare(date) != .orderedDescending)
    }
    public func isLater(thanOrEqual date: Date) -> Bool {
        return (self.compare(date) != .orderedAscending)
    }
    public func isInPast() -> Bool {
        return self.isEarlier(than: Date())
    }
    public func isInFuture() -> Bool {
        return self.isLater(than: Date())
    }
    public func isTypicallyWorkday() -> Bool {
        return isTypicallyWeekend() == false
    }
    public func isTypicallyWeekend() -> Bool {
        let calendar = Date.AZ_currentCalendar()
        let weekdayRange = calendar.maximumRange(of: .weekday)!
        let components = calendar.dateComponents([.weekday], from: self)
        let weekdayOfDate = components.weekday!
        return (weekdayOfDate == weekdayRange.lowerBound || weekdayOfDate == weekdayRange.lowerBound + weekdayRange.upperBound - 1)
    }
    
    public func gregorianYear() -> Int {
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([.year], from: self)
        return components.year!
    }
    public func year() -> Int {
        let components = Date.AZ_currentCalendar().dateComponents([.year], from: self)
        return components.year!
    }
    public func month() -> Int {
        let components = Date.AZ_currentCalendar().dateComponents([.month], from: self)
        return components.month!
    }
    public func day() -> Int {
        let components = Date.AZ_currentCalendar().dateComponents([.day], from: self)
        return components.day!
    }
    public func week() -> Int {
        let components = Date.AZ_currentCalendar().dateComponents([.weekOfMonth], from: self)
        return components.weekOfMonth!
    }
    public func weekday() -> Int {
        let components = Date.AZ_currentCalendar().dateComponents([.weekday], from: self)
        return components.weekday!
    }
    public func nthWeekday() -> Int {
        let components = Date.AZ_currentCalendar().dateComponents([.weekdayOrdinal], from:self)
        return components.weekdayOrdinal!
    }
    public func hour() -> Int {
        let components = Date.AZ_currentCalendar().dateComponents([.hour], from: self)
        return components.hour!
    }
    public func nearestHour() -> Int {
        let calendar = Date.AZ_currentCalendar()
        let minuteRange = calendar.range(of: .minute, in: .hour, for: self)!
        // always 30...
        let halfMinuteInHour = (minuteRange.upperBound - minuteRange.lowerBound) / 2;
        let currentMinute = self.minute();
        if currentMinute < halfMinuteInHour {
            return self.hour();
        } else {
            let anHourLater = self.add(hour: 1)
            return anHourLater.hour()
        }
    }
    public func minute() -> Int {
        let components = Date.AZ_currentCalendar().dateComponents([.minute], from: self)
        return components.minute!
    }
    public func seconds() -> Int {
        let components = Date.AZ_currentCalendar().dateComponents([.second], from: self)
        return components.second!
    }
    
    public func firstDayOfWeekday() -> Int {
        var startOfTheWeek: NSDate?
        var interval: TimeInterval = 0
        (Date.AZ_currentCalendar() as NSCalendar).range(of: NSCalendar.Unit.weekOfMonth, start: &startOfTheWeek, interval: &interval, for: self)
        return (startOfTheWeek! as Date).day()
    }
    public func lastDayOfWeekday() -> Int {
        return self.firstDayOfWeekday() + (self.numberOfDaysInWeek() - 1);
    }
    public func numberOfDaysInWeek() -> Int {
        let range = Date.AZ_currentCalendar().maximumRange(of: .weekday)!
        return range.upperBound - range.lowerBound
    }
    
    public func startOfDay() -> Date {
        let calendar = Date.AZ_currentCalendar()
        var components = calendar.dateComponents([.era, .year, .month, .day, .hour, .minute, .second], from: self)
        components.hour = 0;
        components.minute = 0;
        components.second = 0;
        components.timeZone = calendar.timeZone;
        return calendar.date(from: components)!
    }
    public func endOfDay() -> Date {
        let calendar = Date.AZ_currentCalendar()
        var components = calendar.dateComponents([.era, .year, .month, .day, .hour, .minute, .second], from: self)
        components.hour = 23;
        components.minute = 59;
        components.second = 59;
        components.timeZone = calendar.timeZone;
        return calendar.date(from: components)!
    }
    public func startOfWeek() -> Date {
        var startOfWeek: NSDate?
        (Date.AZ_currentCalendar() as NSCalendar).range(of: .weekOfMonth, start: &startOfWeek, interval: nil, for: self)
        return startOfWeek as! Date;
    }
    
    public func endOfWeek() -> Date {
        let calendar = Date.AZ_currentCalendar()
        var components = calendar.dateComponents([.weekday, .era, .year, .month, .day, .hour, .minute, .second], from: self)
        let diffDay = self.numberOfDaysInWeek() - components.weekday!
        components.day! += diffDay
        return calendar.date(from: components)!
    }
    
    public func startOfMonth() -> Date {
        let calendar = Date.AZ_currentCalendar()
        var components = calendar.dateComponents([.era, .year, .month, .day, .hour, .minute, .second], from: self)
        let range = calendar.range(of: .day, in: .month, for: self)!
        components.day = range.lowerBound;
        return calendar.date(from: components)!
    }
    public func endOfMonth() -> Date {
        let calendar = Date.AZ_currentCalendar()
        var components = calendar.dateComponents([.era, .year, .month, .day, .hour, .minute, .second], from: self)
        let range = calendar.range(of: .day, in: .month, for: self)!
        components.day = range.upperBound - range.lowerBound;
        return calendar.date(from: components)!
    }
    public func startOfYear() -> Date {
        let calendar = Date.AZ_currentCalendar()
        var components = calendar.dateComponents([.era, .year, .month, .day, .hour, .minute, .second], from: self)
        let monthRange = calendar.range(of: .month, in: .year, for: self)!
        let dayRange = calendar.range(of: .day, in: .month, for: self)!
        components.day = dayRange.lowerBound;
        components.month = monthRange.lowerBound;
        return calendar.date(from: components)!
    }
    public func endOfYear() -> Date {
        let calendar = Date.AZ_currentCalendar()
        var components = calendar.dateComponents([.era, .year, .month, .day, .hour, .minute, .second], from: self)
        let monthRange = calendar.range(of: .month, in: .year, for: self)!
        components.month = monthRange.upperBound - monthRange.lowerBound;
        let endMonthOfYear = calendar.date(from: components)!
        
        let dayRange = calendar.range(of: .day, in: .month, for: endMonthOfYear)!
        components.day = dayRange.upperBound - dayRange.lowerBound;
        let endOfYear = calendar.date(from: components)
        return endOfYear!
    }
    
    public func seconds(after date: Date) -> Int {
        let components = (Date.AZ_currentCalendar() as NSCalendar).components(.second, from: date, to: self, options: NSCalendar.Options.init(rawValue: 0))
        return components.second!
    }
    public func seconds(before date: Date) -> Int {
        return -seconds(after: date)
    }
    
    public func minutes(after date: Date) -> Int {
        let components = (Date.AZ_currentCalendar() as NSCalendar).components(.minute, from: date, to: self, options: NSCalendar.Options.init(rawValue: 0))
        return components.minute!
    }
    public func minutes(before date: Date) -> Int {
        return -minutes(after: date)
    }
    
    public func hours(after date: Date) -> Int {
        let components = (Date.AZ_currentCalendar() as NSCalendar).components(.hour, from: date, to: self, options: NSCalendar.Options.init(rawValue: 0))
        return components.hour!
    }
    public func hours(before date: Date) -> Int {
        return -hours(after: date)
    }
    
    public func days(after date: Date) -> Int {
        let components = (Date.AZ_currentCalendar() as NSCalendar).components(.day, from: date, to: self, options: NSCalendar.Options.init(rawValue: 0))
        return components.day!
    }
    public func days(before date: Date) -> Int {
        return -days(after: date)
    }
    
    public func months(after date: Date) -> Int {
        let components = (Date.AZ_currentCalendar() as NSCalendar).components(.month, from: date, to: self, options: NSCalendar.Options.init(rawValue: 0))
        return components.month!
    }
    public func months(before date: Date) -> Int {
        return -months(after: date)
    }
    
    public func distanceInDays(to date: Date) -> Int {
        let calendar = Date.AZ_currentCalendar()
        let components = (Date.AZ_currentCalendar() as NSCalendar).components([.day], from: self, to: date, options: .init(rawValue: 0))
        return components.day!
    }
}

//
//@interface NSDate (Escort)
//
//
//
//#pragma mark - Comparing dates
//
//- (BOOL)isEqualToDateIgnoringTime:(NSDate * _Nonnull) otherDate;
//
//- (BOOL)isToday;
//
//- (BOOL)isTomorrow;
//
//- (BOOL)isYesterday;
//
//- (BOOL)isSameWeekAsDate:(NSDate * _Nonnull) aDate;
//
//- (BOOL)isThisWeek;
//
//- (BOOL)isNextWeek;
//
//- (BOOL)isLastWeek;
//
//- (BOOL)isSameMonthAsDate:(NSDate * _Nonnull) aDate;
//
//- (BOOL)isThisMonth;
//
//- (BOOL)isSameYearAsDate:(NSDate * _Nonnull) aDate;
//
//- (BOOL)isThisYear;
//
//- (BOOL)isNextYear;
//
//- (BOOL)isLastYear;
//
//- (BOOL)isEarlierThanDate:(NSDate * _Nonnull) aDate;
//
//- (BOOL)isLaterThanDate:(NSDate * _Nonnull) aDate;
//
//- (BOOL)isEarlierThanOrEqualDate:(NSDate * _Nonnull) aDate;
//
//- (BOOL)isLaterThanOrEqualDate:(NSDate * _Nonnull) aDate;
//
//- (BOOL)isInFuture;
//
//- (BOOL)isInPast;
//
//#pragma mark - Date roles
//
//- (BOOL)isTypicallyWorkday;
//
//- (BOOL)isTypicallyWeekend;
//
//#pragma mark - Adjusting dates
//- (NSDate * _Nonnull)dateByAddingYears:(NSInteger) dYears;
//
//- (NSDate * _Nonnull)dateBySubtractingYears:(NSInteger) dYears;
//
//- (NSDate * _Nonnull)dateByAddingMonths:(NSInteger) dMonths;
//
//- (NSDate * _Nonnull)dateBySubtractingMonths:(NSInteger) dMonths;
//
//- (NSDate * _Nonnull)dateByAddingDays:(NSInteger) dDays;
//
//- (NSDate * _Nonnull)dateBySubtractingDays:(NSInteger) dDays;
//
//- (NSDate * _Nonnull)dateByAddingHours:(NSInteger) dHours;
//
//- (NSDate * _Nonnull)dateBySubtractingHours:(NSInteger) dHours;
//
//- (NSDate * _Nonnull)dateByAddingMinutes:(NSInteger) dMinutes;
//
//- (NSDate * _Nonnull)dateBySubtractingMinutes:(NSInteger) dMinutes;
//
//- (NSDate * _Nonnull)dateByAddingSeconds:(NSInteger) dSeconds;
//
//- (NSDate * _Nonnull)dateBySubtractingSeconds:(NSInteger) dSeconds;
//
//- (NSDate * _Nonnull)dateAtStartOfDay;
//
//- (NSDate * _Nonnull)dateAtEndOfDay;
//
//- (NSDate * _Nonnull)dateAtStartOfWeek;
//
//- (NSDate * _Nonnull)dateAtEndOfWeek;
//
//- (NSDate * _Nonnull)dateAtStartOfMonth;
//
//- (NSDate * _Nonnull)dateAtEndOfMonth;
//
//- (NSDate * _Nonnull)dateAtStartOfYear;
//
//- (NSDate * _Nonnull)dateAtEndOfYear;
//
//#pragma mark - Retrieving intervals
//- (NSInteger)secondsAfterDate:(NSDate * _Nonnull) aDate;
//
//- (NSInteger)secondsBeforeDate:(NSDate * _Nonnull) aDate;
//
//- (NSInteger)minutesAfterDate:(NSDate * _Nonnull) aDate;
//
//- (NSInteger)minutesBeforeDate:(NSDate * _Nonnull) aDate;
//
//- (NSInteger)hoursAfterDate:(NSDate * _Nonnull) aDate;
//
//- (NSInteger)hoursBeforeDate:(NSDate * _Nonnull) aDate;
//
//- (NSInteger)daysAfterDate:(NSDate * _Nonnull) aDate;
//
//- (NSInteger)daysBeforeDate:(NSDate * _Nonnull) aDate;
//
//- (NSInteger)monthsAfterDate:(NSDate * _Nonnull) aDate;
//
//- (NSInteger)monthsBeforeDate:(NSDate * _Nonnull) aDate;
//
///**
//* return distance days
//*/
//- (NSInteger)distanceInDaysToDate:(NSDate * _Nonnull) aDate;
//
//#pragma mark - Decomposing dates
///**
//* return nearest hour
//*/
//@property(readonly) NSInteger nearestHour;
//@property(readonly) NSInteger hour;
//@property(readonly) NSInteger minute;
//@property(readonly) NSInteger seconds;
//@property(readonly) NSInteger day;
//@property(readonly) NSInteger month;
//@property(readonly) NSInteger week;
////  in the Gregorian calendar, n is 7 and Sunday is represented by 1.
//@property(readonly) NSInteger weekday;
//@property(readonly) NSInteger firstDayOfWeekday;
//@property(readonly) NSInteger lastDayOfWeekday;
//// e.g. 2nd Tuesday of the month == 2
//@property(readonly) NSInteger nthWeekday;
//@property(readonly) NSInteger year;
//@property(readonly) NSInteger gregorianYear;
//@end
