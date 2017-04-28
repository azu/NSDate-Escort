#import "Kiwi.h"
#import "NSDate+AZDateBuilder.h"
#import "NSDate+Escort.h"

@interface NSDate ()
+ (NSCalendar *)AZ_currentCalendar;
@end

SPEC_BEGIN(EscortAmountOfSpecs)
    registerMatchers(@"AZ");// NSDate Custom Matcher
    
    describe(@"-daysAmountOfMonth", ^{
        it(@"2010-10 is 31 days", ^{
            NSDate *currentDate = [NSDate AZ_dateByUnit:@{
                AZ_DateUnit.year: @2010,
                AZ_DateUnit.month: @10,
                AZ_DateUnit.day: @10,
            }];
            
            NSInteger days = [currentDate daysAmountOfMonth];
            [[theValue(days) should] equal:theValue(31)];
        });
        it(@"2010-11 is 30 days", ^{
            NSDate *currentDate = [NSDate AZ_dateByUnit:@{
                AZ_DateUnit.year: @2010,
                AZ_DateUnit.month: @11,
                AZ_DateUnit.day: @10,
            }];
            
            NSInteger days = [currentDate daysAmountOfMonth];
            [[theValue(days) should] equal:theValue(30)];
        });
        it(@"2010-02 is 28 days", ^{
            NSDate *currentDate = [NSDate AZ_dateByUnit:@{
                AZ_DateUnit.year: @2010,
                AZ_DateUnit.month: @2,
                AZ_DateUnit.day: @10,
            }];
            
            NSInteger days = [currentDate daysAmountOfMonth];
            [[theValue(days) should] equal:theValue(28)];
        });
        it(@"2012-02 is 29 days", ^{
            NSDate *currentDate = [NSDate AZ_dateByUnit:@{
                AZ_DateUnit.year: @2012,
                AZ_DateUnit.month: @2,
                AZ_DateUnit.day: @10,
            }];
            
            NSInteger days = [currentDate daysAmountOfMonth];
            [[theValue(days) should] equal:theValue(29)];
        });
    });
SPEC_END
