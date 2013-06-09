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
    describe(@"-week", ^{
        context(@"when the date 2010-01-01", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @1,
                    AZ_DateUnit.day : @1,
                }];
            });
            it(@"should return 1", ^{
                NSInteger weekValue = [currentDate week];
                [[theValue(weekValue) should] equal:theValue(1)];
            });
        });
    });
    describe(@"-weekday", ^{
        // unfortunately NSCalendar$setFirstWeekday is not configurable...
        context(@"when the date 2010-01-01(Fri)", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @1,
                    AZ_DateUnit.day : @1,
                }];
            });
            it(@"should return 6", ^{
                NSInteger weekdayValue = [currentDate weekday];
                [[theValue(weekdayValue) should] equal:theValue(6)];
            });
        });
    });
    SPEC_END
