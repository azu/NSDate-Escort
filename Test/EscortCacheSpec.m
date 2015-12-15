//
// Created by azu on 2013/06/29.
//


#import "Kiwi.h"
#import "NSDate+Escort.h"

@interface NSDate (EscortMock)
+ (NSCalendar *)AZ_currentCalendar;
@end

/*
    ``AZ_currentCalendar`` is cached NSCalendar
    typically used by Decomposing dates property methods.
 */
SPEC_BEGIN(EscortCache)
    describe(@"Decomposing dates", ^{
        context(@"calling from multithread", ^{
            it(@"should not raise", ^{
                [[theBlock(^{
                    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
                    [queue setMaxConcurrentOperationCount:8];
                    NSDate *date = [NSDate date];
                    for (int i = 0; i < 100; i++) {
                        [queue addOperationWithBlock:^{
                            NSString *calendarIdentifier = (i%2) ? nil : NSCalendarIdentifierGregorian;
                            [NSDate AZ_setDefaultCalendarIdentifier:calendarIdentifier];
                            NSInteger year = date.year;
                            NSInteger month = date.month;
                            NSInteger day = date.day;
                            NSInteger hour = date.hour;
                            NSInteger minute = date.minute;
                            NSInteger seconds = date.seconds;
                            [NSString stringWithFormat:@"%li-%li-%li %li:%li:%li", (long)year, (long)month, (long)day, (long)hour, (long)minute, (long)seconds];
                        }];
                    }
                    [queue waitUntilAllOperationsAreFinished];
                }) shouldNot] raise];
            });
        });
    });
    SPEC_END