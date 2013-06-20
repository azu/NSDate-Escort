//
// Created by azu on 2013/06/09.
// License MIT
//


#import <SenTestingKit/SenTestingKit.h>
#import "RAIIBenchmark.h"

@interface BenchMakeFormReferenceDate : SenTestCase
@end

@implementation BenchMakeFormReferenceDate {
}

- (void)test_timeIntervalSinceReferenceDate {
    beginBenchLoop(@"test_timeIntervalSinceReferenceDate", 10000, {
        NSTimeInterval timeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + 1000;
        [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
    })
}

- (void)test_class_timeIntervalSinceReferenceDate {
    beginBenchLoop(@"test_class_timeIntervalSinceReferenceDate", 10000, {
        NSTimeInterval timeInterval = [NSDate timeIntervalSinceReferenceDate] + 1000;
        [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
    })
}

- (void)test_dateWithTimeIntervalSinceNow {
    beginBenchLoop(@"test_dateWithTimeIntervalSinceNow", 10000, {
        [NSDate dateWithTimeIntervalSinceNow:1000];
    })
}

- (void)test_dateByAddingTimeInterval {
    NSDate *date = [NSDate date];
    beginBenchLoop(@"test_dateByAddingTimeInterval", 10000, {
        [date dateByAddingTimeInterval:1000];
    })
}

- (void)test_dateByAddingComponents {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *oneDayComponents = [[NSDateComponents alloc] init];
    oneDayComponents.day = 1000;
    beginBenchLoop(@"test_dateByAddingComponents", 10000, {
        [calendar dateByAddingComponents:oneDayComponents toDate:[NSDate date] options:0];
    })
}
@end
