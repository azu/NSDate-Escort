//
// Created by azu on 2013/06/09.
// License MIT
//


#import <XCTest/XCTest.h>

@interface BenchMakeFormReferenceDate : XCTestCase
@end

@implementation BenchMakeFormReferenceDate {
}

- (void)test_timeIntervalSinceReferenceDate {
    [self measureBlock:^{
        NSTimeInterval timeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + 1000;
        [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
    }];
}

- (void)test_class_timeIntervalSinceReferenceDate {
    [self measureBlock:^{
        NSTimeInterval timeInterval = [NSDate timeIntervalSinceReferenceDate] + 1000;
        [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
    }];
}

- (void)test_dateWithTimeIntervalSinceNow {
    [self measureBlock:^{
        [NSDate dateWithTimeIntervalSinceNow:1000];
    }];
}

- (void)test_dateByAddingTimeInterval {
    NSDate *date = [NSDate date];
    [self measureBlock:^{
        [date dateByAddingTimeInterval:1000];
    }];
}

- (void)test_dateByAddingComponents {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *oneDayComponents = [[NSDateComponents alloc] init];
    oneDayComponents.day = 1000;
    [self measureBlock:^{
        [calendar dateByAddingComponents:oneDayComponents toDate:[NSDate date] options:0];
    }];
}

- (void)test_calendar {
    NSDateComponents *oneDayComponents = [[NSDateComponents alloc] init];
    oneDayComponents.day = 1000;
    [self measureBlock:^{
        for (int i = 0; i < 1000 * 1000; i++ ) {
            NSCalendar *calendar = [NSCalendar currentCalendar];
            [calendar dateByAddingComponents:oneDayComponents toDate:[NSDate date] options:0];
        }
    }];
}

- (void)test_calendar_timezone {
    NSDateComponents *oneDayComponents = [[NSDateComponents alloc] init];
    oneDayComponents.day = 1000;
    [self measureBlock:^{
        for (int i = 0; i < 1000 * 1000; i++ ) {
            NSCalendar *calendar = [NSCalendar currentCalendar];
//            calendar.timeZone = [NSTimeZone systemTimeZone];
            [calendar dateByAddingComponents:oneDayComponents toDate:[NSDate date] options:0];
        }
    }];
}

- (void)test_cache_calendar_timezone {
    NSDateComponents *oneDayComponents = [[NSDateComponents alloc] init];
    oneDayComponents.day = 1000;
    [self measureBlock:^{
        NSCalendar *calendar = [NSCalendar currentCalendar];
        for (int i = 0; i < 1000 * 1000; i++ ) {
            calendar.timeZone = [NSTimeZone systemTimeZone];
            [calendar dateByAddingComponents:oneDayComponents toDate:[NSDate date] options:0];
        }
    }];
}

- (void)test_cache_calendar_reset_timezone {
    NSDateComponents *oneDayComponents = [[NSDateComponents alloc] init];
    oneDayComponents.day = 1000;
    [self measureBlock:^{
        NSCalendar *calendar = [NSCalendar currentCalendar];
        for (int i = 0; i < 1000 * 1000; i++ ) {
            [NSTimeZone resetSystemTimeZone];
            calendar.timeZone = [NSTimeZone systemTimeZone];
            [calendar dateByAddingComponents:oneDayComponents toDate:[NSDate date] options:0];
        }
    }];
}

- (void)test_cache_calendar_local_timezone {
    NSDateComponents *oneDayComponents = [[NSDateComponents alloc] init];
    oneDayComponents.day = 1000;
    [self measureBlock:^{
        NSCalendar *calendar = [NSCalendar currentCalendar];
        for (int i = 0; i < 1000 * 1000; i++ ) {
            calendar.timeZone = [NSTimeZone localTimeZone];
            [calendar dateByAddingComponents:oneDayComponents toDate:[NSDate date] options:0];
        }
    }];
}

- (void)test_cache_calendar_cache_timezone {
    NSDateComponents *oneDayComponents = [[NSDateComponents alloc] init];
    oneDayComponents.day = 1000;
    [self measureBlock:^{
        NSCalendar *calendar = [NSCalendar currentCalendar];
        calendar.timeZone = [NSTimeZone systemTimeZone];
        for (int i = 0; i < 1000 * 1000; i++ ) {
            [calendar dateByAddingComponents:oneDayComponents toDate:[NSDate date] options:0];
        }
    }];
}
@end
