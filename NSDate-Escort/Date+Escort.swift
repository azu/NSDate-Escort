import Foundation

extension Date {
    static var _currentCalendar: Calendar?
    public static var currentCalendar: Calendar {
        get {
            if _currentCalendar == nil || _currentCalendar?.identifier != identifier {
                if let identifier = defaultCalendarIdentifier {
                    _currentCalendar = Calendar(identifier: identifier)
                } else {
                    _currentCalendar = Calendar.current
                }
            }
            _currentCalendar!.timeZone = NSTimeZone.local
            return _currentCalendar!
        }
    }
    
    static var lock = NSLock()
    static var identifier: Calendar.Identifier?
    public static var defaultCalendarIdentifier: Calendar.Identifier? {
        get {
            lock.lock()
            let i = identifier
            lock.unlock()
            return i
        }
        set {
            lock.lock()
            identifier = newValue
            lock.unlock()
        }
    }
    
    //
    public static func tomorrow() -> Date {
        return Date.dateFormNow(day: 1)
    }
    
    public static func yesterday() -> Date {
        return Date.dateFormNow(day: -1)
    }
    
    public static func dateFormNow(day: Int) -> Date {
        return Date().add(day: day)
    }
    
    // comparing
    public func isEqual(ignoringTime date: Date) -> Bool {
        let calendar = type(of: self).currentCalendar
        let components: Set<Calendar.Component> = [.era, .year, .month, .day]
        let left = calendar.dateComponents(components, from: self)
        let right = calendar.dateComponents(components, from: date)
        return left.era == right.era
            && left.year == right.year
            && left.month == right.month
            && left.day == right.day
    }
    
    public func isToday() -> Bool {
        return self.isEqual(ignoringTime: Date())
    }
    
    public func isTomorrow() -> Bool {
        return self.isEqual(ignoringTime: Date.tomorrow())
    }
    
    public func isYesterday() -> Bool {
        return self.isEqual(ignoringTime: Date.yesterday())
    }
    
    public func add(day: Int? = nil, hour: Int? = nil) -> Date {
        var components = DateComponents()
        components.day = day
        components.hour = hour
        let calendar = type(of: self).currentCalendar
        return calendar.date(byAdding: components, to: self)!
    }
    
    // decomposing
    public var era: Int {
        get { return type(of: self).currentCalendar.component(.era, from: self) }
    }
    
    public var year: Int {
        get { return type(of: self).currentCalendar.component(.year, from: self) }
    }
    
    public var month: Int {
        get { return type(of: self).currentCalendar.component(.month, from: self) }
    }
    
    public var day: Int {
        get { return type(of: self).currentCalendar.component(.day, from: self) }
    }
    
    public var hour: Int {
        get { return type(of: self).currentCalendar.component(.hour, from: self) }
    }
    
    public var minute: Int {
        get { return type(of: self).currentCalendar.component(.minute, from: self) }
    }
    
    public var second: Int {
        get { return type(of: self).currentCalendar.component(.second, from: self) }
    }
    
    public var weekday: Int {
        get { return type(of: self).currentCalendar.component(.weekday, from: self) }
    }
    
    public var weekdayOrdinal: Int {
        get { return type(of: self).currentCalendar.component(.weekdayOrdinal, from: self) }
    }
    
    public var quarter: Int {
        get { return type(of: self).currentCalendar.component(.quarter, from: self) }
    }
    
    public var weekOfMonth: Int {
        get { return type(of: self).currentCalendar.component(.weekOfMonth, from: self) }
    }
    
    public var weekOfYear: Int {
        get { return type(of: self).currentCalendar.component(.weekOfYear, from: self) }
    }
    
    public var yearForWeekOfYear: Int {
        get { return type(of: self).currentCalendar.component(.yearForWeekOfYear, from: self) }
    }
    
    public var nanosecond: Int {
        get { return type(of: self).currentCalendar.component(.nanosecond, from: self) }
    }
    
    public var gregorianYear: Int {
        get {
            var calendar = Calendar(identifier: .gregorian)
            calendar.timeZone = NSTimeZone.local
            return calendar.dateComponents([.year], from: self).year!
        }
        
    }
    
    public var nearestHour: Int {
        get {
            let calendar = type(of: self).currentCalendar
            let minuteRange = calendar.range(of: .minute, in: .hour, for: self)!
            // always 30...
            let halfMinuteInHour = (minuteRange.upperBound - minuteRange.lowerBound) / 2
            if (minute < halfMinuteInHour) {
                return hour
            } else {
                let anHourLater = self.add(hour: 1)
                return anHourLater.hour
            }
        }
    }
}
