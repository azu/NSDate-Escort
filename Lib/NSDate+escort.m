#import "NSDate+Escort.h"

@implementation NSDate (Escort)
+ (NSDate *)dateTomorrow {
    return [[NSDate date] dateByAddingTimeInterval:24 * 60 * 60];
}

+ (NSDate *)dateYesterday {
    return nil;
}


@end