#import "Kiwi.h"
#import "NSDate+Escort.h"
#import "FakeDateUtil.h"
#import "NSDate+AZDateBuilder.h"

SPEC_BEGIN(EscortDecomposingSpec)

    registerMatchers(@"AZ");// NSDate Custom Matcher
    describe(@"-day", ^{
        context(@"when the date 2010-10-10", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                }];
            });
            it(@"should return 10", ^{
                NSInteger day = [currentDate day];
                [[theValue(day) should] equal:theValue(10)];
            });
        });
    });

    SPEC_END
