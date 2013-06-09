//
// Created by azu on 2013/05/12.
//


#import <Foundation/Foundation.h>

#define beginBench(name, exec) { \
    RAIIBenchmark *benchmark = [[RAIIBenchmark alloc] init];\
    benchmark.benchName = name;\
    exec\
}

#define beginBenchLoop(name, times, exec) { \
    RAIIBenchmark *benchmark = [[RAIIBenchmark alloc] init];\
    benchmark.benchName = name;\
    benchmark.numberOfRun = @(times);\
    for(int i=0;i<times;i++)\
exec\
}

@interface RAIIBenchmark : NSObject
@property(nonatomic, strong) NSDate *startDate;
@property(nonatomic, strong) NSDate *benchName;
@property(nonatomic, strong) NSNumber *numberOfRun;
@end