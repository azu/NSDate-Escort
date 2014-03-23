//
// Created by azu on 2013/01/28.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSDate+AZDateBuilder.h"

const struct AZDateBuilderUnit AZ_DateUnit = {
    .era = @"era",
    .year = @"year",
    .month = @"month",
    .day = @"day",
    .hour = @"hour",
    .minute = @"minute",
    .second = @"second",
    .week = @"week",
    .weekday = @"weekday",
    .weekdayOrdinal = @"weekdayOrdinal",
    .quarter = @"quarter",
    .weekOfMonth = @"weekOfMonth",
    .weekOfYear = @"weekOfYear",
    .yearForWeekOfYear = @"yearForWeekOfYear"
};
#define DATE_COMPONENTS (NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekCalendarUnit |  NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit)

@implementation NSDate (AZDateBuilder)

+ (NSDate *)dateByUnit:(NSDictionary *) builderUnit {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.calendar = calendar;
    for (NSString *key in [builderUnit allKeys]) {
        NSNumber *number = builderUnit[key];
        NSAssert([number isKindOfClass:[NSNumber class]], @"%@ is not kind of NSNumber Class", number);
        [dateComponents setValue:number forKey:key];
    }
    return [calendar dateFromComponents:dateComponents];
}


- (NSDate *)dateByUnit:(NSDictionary *) builderUnit {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *dateComponents = [calendar components:DATE_COMPONENTS fromDate:self];
    dateComponents.calendar = calendar;
    for (NSString *key in [builderUnit allKeys]) {
        NSNumber *number = builderUnit[key];
        NSAssert([number isKindOfClass:[NSNumber class]], @"%@ is not kind of NSNumber Class", number);
        [dateComponents setValue:number forKey:key];
    }
    return [calendar dateFromComponents:dateComponents];
}
@end