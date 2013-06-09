//
// Created by azu on 2013/01/28.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

extern const struct AZDateBuilderUnit {
    __unsafe_unretained NSString *era;
    __unsafe_unretained NSString *year;
    __unsafe_unretained NSString *month;
    __unsafe_unretained NSString *day;
    __unsafe_unretained NSString *hour;
    __unsafe_unretained NSString *minute;
    __unsafe_unretained NSString *second;
    __unsafe_unretained NSString *week;
    __unsafe_unretained NSString *weekday;
    __unsafe_unretained NSString *weekdayOrdinal;
    __unsafe_unretained NSString *quarter;
    __unsafe_unretained NSString *weekOfMonth;
    __unsafe_unretained NSString *weekOfYear;
    __unsafe_unretained NSString *yearForWeekOfYear;
} AZ_DateUnit;

@interface NSDate (AZDateBuilder)

+ (NSDate *)dateByUnit:(NSDictionary *) builderUnit;

- (NSDate *)dateByUnit:(NSDictionary *) builderUnit;
@end