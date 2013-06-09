#import "Kiwi.h"
#import "NSDate+Escort.h"
#import "FakeDateUtil.h"
#import "NSDate+AZDateBuilder.h"

SPEC_BEGIN(EscortComparingSpec)
    registerMatchers(@"AZ");// NSDate Custom Matcher
    describe(@"-isEqualToDateIgnoringTime", ^{
        NSDate *currentDate = [NSDate date];
        beforeEach(^{
            [FakeDateUtil stubCurrentDate:currentDate];
        });
        context(@"when same the date", ^{
            it(@"should be true", ^{
                BOOL isMatch = [currentDate isEqualToDateIgnoringTime:currentDate];
                [[theValue(isMatch) should] beYes];
            });

        });
        context(@"when the date is today", ^{
            it(@"should be true", ^{
                NSDate *beginOfDate = [currentDate dateByUnit:@{
                    AZ_DateUnit.hour : @0,
                    AZ_DateUnit.minute : @0,
                    AZ_DateUnit.second : @0,
                }];
                NSDate *endOfDate = [currentDate dateByUnit:@{
                    AZ_DateUnit.hour : @23,
                    AZ_DateUnit.minute : @59,
                    AZ_DateUnit.second : @59,
                }];
                BOOL isMatch_begin = [beginOfDate isEqualToDateIgnoringTime:currentDate];
                BOOL isMatch_end = [endOfDate isEqualToDateIgnoringTime:currentDate];
                [[theValue(isMatch_begin) should] beYes];
                [[theValue(isMatch_end) should] beYes];
            });
        });
        context(@"at a later day", ^{
            it(@"should be false", ^{
                NSDate *laterDate = [currentDate dateByUnit:@{
                    AZ_DateUnit.day : @([currentDate day] + 1),
                    AZ_DateUnit.hour : @0,
                    AZ_DateUnit.minute : @0,
                    AZ_DateUnit.second : @0,
                }];
                BOOL isMatch = [laterDate isEqualToDateIgnoringTime:currentDate];
                [[theValue(isMatch) should] beNo];
            });
        });
        context(@"at a earler day", ^{
            it(@"should be false", ^{
                NSDate *laterDate = [currentDate dateByUnit:@{
                    AZ_DateUnit.day : @([currentDate day] - 1),
                    AZ_DateUnit.hour : @23,
                    AZ_DateUnit.minute : @59,
                    AZ_DateUnit.second : @59,
                }];
                BOOL isMatch = [laterDate isEqualToDateIgnoringTime:currentDate];
                [[theValue(isMatch) should] beNo];
            });
        });
    });

    SPEC_END
