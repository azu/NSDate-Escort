//
// Created by azu on 2013/06/09.
//


#import "FakeDateUtil.h"
#import "NSObject+KiwiStubAdditions.h"
#import "Kiwi.h"

@implementation FakeDateUtil {

}
+ (void)stubCurrentDate:(NSDate *) date {
    // +date
    [NSDate stub:@selector(date) andReturn:date];
    // +timeIntervalSinceReferenceDate
    [NSDate stub:@selector(timeIntervalSinceReferenceDate) andReturn:theValue([date timeIntervalSinceReferenceDate])];
}
@end