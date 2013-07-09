//
// Created by azu on 2013/06/29.
//


#import "Kiwi.h"
#import "NSDate+Escort.h"

@interface EscortCacheUtil : NSObject
+ (NSCalendar *)AZ_currentCalendar;
@end

@implementation EscortCacheUtil
+ (NSCalendar *)AZ_currentCalendar {
    // call private method
    return [NSDate performSelector:@selector(AZ_currentCalendar)];
}
@end

/*
    ``AZ_currentCalendar`` is cached NSCalendar
    typically used by Decomposing dates property methods.
 */
SPEC_BEGIN(EscortCache)
    describe(@"+AZ_currentCalendar", ^{
        context(@"when thread is same", ^{
            it(@"should return same calendar object", ^{
                // call at once
                [[[NSCalendar currentCalendar] should] receiveWithCount:1];
                [EscortCacheUtil AZ_currentCalendar];
                [EscortCacheUtil AZ_currentCalendar];
            });
        });
        context(@"thead at differet time", ^{
            it(@"should return different calendar object", ^{
                // call twice
                [[[NSCalendar currentCalendar] should] receiveWithCount:2];
                NSOperationQueue *queue = [[NSOperationQueue alloc] init];
                [queue setMaxConcurrentOperationCount:2];
                [queue addOperationWithBlock:^{
                    [EscortCacheUtil AZ_currentCalendar];
                }];
                [queue addOperationWithBlock:^{
                    [EscortCacheUtil AZ_currentCalendar];
                }];
                [queue waitUntilAllOperationsAreFinished];
            });
        });
    });
    describe(@"Decomposing dates", ^{
        context(@"calling from multithread", ^{
            it(@"should not raise", ^{
                [[theBlock(^{
                    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
                    [queue setMaxConcurrentOperationCount:4];
                    NSDate *date = [NSDate date];
                    for (int i = 0; i < 100; i++) {
                        [queue addOperationWithBlock:^{
                            NSInteger year = date.year;
                            NSInteger month = date.month;
                            NSInteger day = date.day;
                            NSInteger hour = date.hour;
                            NSInteger minute = date.minute;
                            NSInteger seconds = date.seconds;
                            [NSString stringWithFormat:@"%i-%i-%i %i:%i:%i", year, month, day, hour, minute, seconds];
                        }];
                    }
                    [queue waitUntilAllOperationsAreFinished];
                }) shouldNot] raise];
            });
        });
    });
    SPEC_END