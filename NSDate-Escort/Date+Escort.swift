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
    
    public var era: Int {
        get { return type(of: self).currentCalendar.dateComponents([.era], from: self).era! }
    }
    
    public var year: Int {
        get { return type(of: self).currentCalendar.dateComponents([.year], from: self).year! }
    }
    
    public var month: Int {
        get { return type(of: self).currentCalendar.dateComponents([.month], from: self).month! }
    }
    
    public var day: Int {
        get { return type(of: self).currentCalendar.dateComponents([.day], from: self).day! }
    }
    
    public var hour: Int {
        get { return type(of: self).currentCalendar.dateComponents([.hour], from: self).hour! }
    }
    
    public var minute: Int {
        get { return type(of: self).currentCalendar.dateComponents([.minute], from: self).minute! }
    }
    
    public var second: Int {
        get { return type(of: self).currentCalendar.dateComponents([.second], from: self).second! }
    }
    
    public var weekday: Int {
        get { return type(of: self).currentCalendar.dateComponents([.weekday], from: self).weekday! }
    }
    
    public var weekdayOrdinal: Int {
        get { return type(of: self).currentCalendar.dateComponents([.weekdayOrdinal], from: self).weekdayOrdinal! }
    }
    
    public var quarter: Int {
        get { return type(of: self).currentCalendar.dateComponents([.quarter], from: self).quarter! }
    }
    
    public var weekOfMonth: Int {
        get { return type(of: self).currentCalendar.dateComponents([.weekOfMonth], from: self).weekOfMonth! }
    }
    
    public var weekOfYear: Int {
        get { return type(of: self).currentCalendar.dateComponents([.weekOfYear], from: self).weekOfYear! }
    }
    
    public var yearForWeekOfYear: Int {
        get { return type(of: self).currentCalendar.dateComponents([.yearForWeekOfYear], from: self).yearForWeekOfYear! }
    }
    
    public var nanosecond: Int {
        get { return type(of: self).currentCalendar.dateComponents([.nanosecond], from: self).nanosecond! }
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
