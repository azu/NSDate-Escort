#import "Kiwi.h"
#import "NSDate+Escort.h"


#define SECONDS_IN_MINUTE 60
#define MINUTES_IN_HOUR 60
#define SECONDS_IN_HOUR (SECONDS_IN_MINUTE * MINUTES_IN_HOUR)
#define HOURS_IN_DAY 24
#define SECONDS_IN_DAY (HOURS_IN_DAY * SECONDS_IN_HOUR)

SPEC_BEGIN(EscortSpec)

    describe(@"#dateTomorrow", ^{
        NSDate *currentDate = [NSDate date];
        beforeEach(^{
            [NSDate stub:@selector(date) andReturn:currentDate];
        });
        it(@"return Tomorrow", ^{
            NSDate *expectDate = [currentDate dateByAddingTimeInterval:SECONDS_IN_DAY];
            NSDate *tomorrow = [NSDate dateTomorrow];
            [[tomorrow should] equal:expectDate];
        });
    });

    SPEC_END
