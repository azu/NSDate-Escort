//
// Created by azu on 2013/06/09.
//


#import "FakeDateUtil.h"
#import "NSObject+KiwiStubAdditions.h"


@implementation FakeDateUtil {

}
+ (void)stubCurrentDate:(NSDate *) date {
    [NSDate stub:@selector(date) andReturn:date];
}
@end