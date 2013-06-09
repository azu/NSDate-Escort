//
// Created by azu on 2013/05/12.
//


#import "RAIIBenchmark.h"


@implementation RAIIBenchmark {
}

- (id)init {
    self = [super init];
    if (self == nil) {
        return nil;
    }

    _startDate = [NSDate date];

    return self;
}

- (void)outputReport {
    NSTimeInterval timeInterval = -[self.startDate timeIntervalSinceNow];
    if (self.numberOfRun != nil) {
        NSLog(@"%@ \n└ Total :%.5fs | Average: %.5fs", self.benchName, timeInterval,
            timeInterval / [self.numberOfRun integerValue]);
    } else {
        NSLog(@"%@ \n└ %.3fs", self.benchName, timeInterval);
    }
}

- (void)dealloc {
    [self outputReport];
}

@end