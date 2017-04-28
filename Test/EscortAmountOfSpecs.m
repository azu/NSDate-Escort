#import "Kiwi.h"
#import "NSDate+AZDateBuilder.h"
#import "NSDate+Escort.h"

@interface NSDate ()
+ (NSCalendar *)AZ_currentCalendar;
@end

SPEC_BEGIN(EscortOfSpecs)
    registerMatchers(@"AZ");// NSDate Custom Matcher
    
    describe(@"-daysOfMonth", ^{
        it(@"2010-10 is 31 days", ^{
            NSDate *currentDate = [NSDate AZ_dateByUnit:@{
                AZ_DateUnit.year: @2010,
                AZ_DateUnit.month: @10,
                AZ_DateUnit.day: @10,
            }];
            
            NSInteger days = [currentDate daysOfMonth];
            [[theValue(days) should] equal:theValue(31)];
        });
        it(@"2010-11 is 30 days", ^{
            NSDate *currentDate = [NSDate AZ_dateByUnit:@{
                AZ_DateUnit.year: @2010,
                AZ_DateUnit.month: @11,
                AZ_DateUnit.day: @10,
            }];
            
            NSInteger days = [currentDate daysOfMonth];
            [[theValue(days) should] equal:theValue(30)];
        });
        it(@"2010-02 is 28 days", ^{
            NSDate *currentDate = [NSDate AZ_dateByUnit:@{
                AZ_DateUnit.year: @2010,
                AZ_DateUnit.month: @2,
                AZ_DateUnit.day: @10,
            }];
            
            NSInteger days = [currentDate daysOfMonth];
            [[theValue(days) should] equal:theValue(28)];
        });
        it(@"2012-02 is 29 days", ^{
            NSDate *currentDate = [NSDate AZ_dateByUnit:@{
                AZ_DateUnit.year: @2012,
                AZ_DateUnit.month: @2,
                AZ_DateUnit.day: @10,
            }];
            
            NSInteger days = [currentDate daysOfMonth];
            [[theValue(days) should] equal:theValue(29)];
        });
    });
    
    describe(@"-monthsOfYesr", ^{
        it(@"2010 is 12 months", ^{
            NSDate *currentDate = [NSDate AZ_dateByUnit:@{
                AZ_DateUnit.year: @2010,
                AZ_DateUnit.month: @10,
                AZ_DateUnit.day: @10,
            }];
            
            NSInteger days = [currentDate monthsOfYear];
            [[theValue(days) should] equal:theValue(12)];
        });
        it(@"2011 is 12 months", ^{
            NSDate *currentDate = [NSDate AZ_dateByUnit:@{
                AZ_DateUnit.year: @2011,
                AZ_DateUnit.month: @10,
                AZ_DateUnit.day: @10,
            }];
            
            NSInteger days = [currentDate monthsOfYear];
            [[theValue(days) should] equal:theValue(12)];
        });
    });
    
    describe(@"-daysOfYear", ^{
        it(@"2010 is 365 days", ^{
            NSDate *currentDate = [NSDate AZ_dateByUnit:@{
                AZ_DateUnit.year: @2010,
                AZ_DateUnit.month: @10,
                AZ_DateUnit.day: @10,
            }];
            
            NSInteger days = [currentDate daysOfYear];
            [[theValue(days) should] equal:theValue(365)];
        });
        it(@"2012 is 366 days", ^{
            NSDate *currentDate = [NSDate AZ_dateByUnit:@{
                AZ_DateUnit.year: @2012,
                AZ_DateUnit.month: @10,
                AZ_DateUnit.day: @10,
            }];
            
            NSInteger days = [currentDate daysOfYear];
            [[theValue(days) should] equal:theValue(366)];
        });
    });
    
    describe(@"-hoursOfDay", ^{
        context(@"at japan", ^{
            beforeAll(^{
                NSTimeZone *timeZone = [NSTimeZone timeZoneWithAbbreviation:@"JST"];
                [NSTimeZone stub:@selector(localTimeZone) andReturn:timeZone];
            });
            it(@"2012-10-10 is 24 hours", ^{
                NSDate *currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year: @2010,
                    AZ_DateUnit.month: @10,
                    AZ_DateUnit.day: @10,
                }];
                
                NSInteger days = [currentDate hoursOfDay];
                [[theValue(days) should] equal:theValue(24)];
            });
            it(@"2012-10-10 is 24 hours", ^{
                NSDate *currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year: @2012,
                    AZ_DateUnit.month: @10,
                    AZ_DateUnit.day: @10,
                }];
                
                NSInteger days = [currentDate hoursOfDay];
                [[theValue(days) should] equal:theValue(24)];
            });
        });
        context(@"at united kingdom", ^{
            beforeEach(^{
                NSTimeZone *timeZone = [NSTimeZone timeZoneWithAbbreviation:@"BST"];
                [NSTimeZone stub:@selector(localTimeZone) andReturn:timeZone];
                [NSTimeZone stub:@selector(defaultTimeZone) andReturn:timeZone];
            });
            // DST started
            it(@"2017-03-26 is 24 hours", ^{
                NSDate *currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year: @2017,
                    AZ_DateUnit.month: @3,
                    AZ_DateUnit.day: @26,
                }];
                
                NSInteger days = [currentDate hoursOfDay];
                [[theValue(days) should] equal:theValue(24)];
            });
            // DST end
            it(@"2017-10-29 is 24 hours", ^{
                NSDate *currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year: @2017,
                    AZ_DateUnit.month: @10,
                    AZ_DateUnit.day: @29
                    ,
                }];
                
                NSInteger days = [currentDate hoursOfDay];
                [[theValue(days) should] equal:theValue(24)];
            });
        });
    });
SPEC_END
