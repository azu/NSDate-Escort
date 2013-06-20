#import "Kiwi.h"
#import "FakeDateUtil.h"
#import "NSDate+AZDateBuilder.h"
#import "NSDate+Escort.h"

SPEC_BEGIN(EscortRetrievingIntervals)
    registerMatchers(@"AZ");// NSDate Custom Matcher

    describe(@"-minutesAfterDate", ^{
        context(@"the date is 2010-10-10 10:10:10", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                    AZ_DateUnit.hour : @10,
                    AZ_DateUnit.minute : @10,
                    AZ_DateUnit.second : @10,
                }];
                [FakeDateUtil stubCurrentDate:currentDate];
            });
            context(@"when 10 minutes ago", ^{
                int tenMinutes = 10;
                __block NSDate *theOtherDate;
                beforeEach(^{
                    theOtherDate = [currentDate dateBySubtractingMinutes:tenMinutes];
                });
                it(@"should return 10", ^{
                    NSInteger minutes = [currentDate minutesAfterDate:theOtherDate];
                    [[theValue(minutes) should] equal:theValue(tenMinutes)];
                });
            });
            context(@"when 1 hour ago", ^{
                int oneHour = 1;
                __block NSDate *theOtherDate;
                beforeEach(^{
                    theOtherDate = [currentDate dateBySubtractingHours:oneHour];
                });
                it(@"should return 60", ^{
                    NSInteger minutes = [currentDate minutesAfterDate:theOtherDate];
                    [[theValue(minutes) should] equal:theValue(60)];
                });
            });
            context(@"when 10 minutes later", ^{
                int tenMinutes = 10;
                __block NSDate *theOtherDate;
                beforeEach(^{
                    theOtherDate = [currentDate dateByAddingMinutes:tenMinutes];
                });
                it(@"should return -10", ^{
                    NSInteger minutes = [currentDate minutesAfterDate:theOtherDate];
                    [[theValue(minutes) should] equal:theValue(-tenMinutes)];
                });
            });
        });
    });

    describe(@"-minutesBeforeDate", ^{
        context(@"the date is 2010-10-10 10:10:10", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                    AZ_DateUnit.hour : @10,
                    AZ_DateUnit.minute : @10,
                    AZ_DateUnit.second : @10,
                }];
                [FakeDateUtil stubCurrentDate:currentDate];
            });
            context(@"when 10 minutes later", ^{
                int tenMinutes = 10;
                __block NSDate *theOtherDate;
                beforeEach(^{
                    theOtherDate = [currentDate dateByAddingMinutes:tenMinutes];
                });
                it(@"should return 10", ^{
                    NSInteger minutes = [currentDate minutesBeforeDate:theOtherDate];
                    [[theValue(minutes) should] equal:theValue(tenMinutes)];
                });
            });
            context(@"when 1 hour later", ^{
                int oneHour = 1;
                __block NSDate *theOtherDate;
                beforeEach(^{
                    theOtherDate = [currentDate dateByAddingHours:oneHour];
                });
                it(@"should return 60", ^{
                    NSInteger minutes = [currentDate minutesBeforeDate:theOtherDate];
                    [[theValue(minutes) should] equal:theValue(60)];
                });
            });
            context(@"when 10 minutes ago", ^{
                int tenMinutes = 10;
                __block NSDate *theOtherDate;
                beforeEach(^{
                    theOtherDate = [currentDate dateBySubtractingMinutes:tenMinutes];
                });
                it(@"should return -10", ^{
                    NSInteger minutes = [currentDate minutesBeforeDate:theOtherDate];
                    [[theValue(minutes) should] equal:theValue(-tenMinutes)];
                });
            });
        });
    });

    describe(@"-hoursAfterDate", ^{
        context(@"the date is 2010-10-10 10:10:10", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                    AZ_DateUnit.hour : @10,
                    AZ_DateUnit.minute : @10,
                    AZ_DateUnit.second : @10,
                }];
                [FakeDateUtil stubCurrentDate:currentDate];
            });
            context(@"when 1 hour ago", ^{
                int oneHour = 1;
                __block NSDate *theOtherDate;
                beforeEach(^{
                    theOtherDate = [currentDate dateBySubtractingHours:oneHour];
                });
                it(@"should return 1", ^{
                    NSInteger result = [currentDate hoursAfterDate:theOtherDate];
                    [[theValue(result) should] equal:theValue(oneHour)];
                });
            });
            context(@"when 1 day ago", ^{
                int oneDay = 24;
                __block NSDate *theOtherDate;
                beforeEach(^{
                    theOtherDate = [currentDate dateBySubtractingHours:oneDay];
                });
                it(@"should return 24", ^{
                    NSInteger result = [currentDate hoursAfterDate:theOtherDate];
                    [[theValue(result) should] equal:theValue(oneDay)];
                });
            });
            context(@"when 1 hour later", ^{
                int oneHour = 1;
                __block NSDate *theOtherDate;
                beforeEach(^{
                    theOtherDate = [currentDate dateByAddingHours:oneHour];
                });
                it(@"should return -1", ^{
                    NSInteger result = [currentDate hoursAfterDate:theOtherDate];
                    [[theValue(result) should] equal:theValue(-oneHour)];
                });
            });
        });
    });

    describe(@"-hoursBeforeDate", ^{
        context(@"the date is 2010-10-10 10:10:10", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                    AZ_DateUnit.hour : @10,
                    AZ_DateUnit.minute : @10,
                    AZ_DateUnit.second : @10,
                }];
                [FakeDateUtil stubCurrentDate:currentDate];
            });
            context(@"when 1 hour later", ^{
                int oneHour = 1;
                __block NSDate *theOtherDate;
                beforeEach(^{
                    theOtherDate = [currentDate dateByAddingHours:oneHour];
                });
                it(@"should return 1", ^{
                    NSInteger result = [currentDate hoursBeforeDate:theOtherDate];
                    [[theValue(result) should] equal:theValue(oneHour)];
                });
            });
            context(@"when 1 day later", ^{
                int oneDay = 24;
                __block NSDate *theOtherDate;
                beforeEach(^{
                    theOtherDate = [currentDate dateByAddingHours:oneDay];
                });
                it(@"should return 24", ^{
                    NSInteger result = [currentDate hoursBeforeDate:theOtherDate];
                    [[theValue(result) should] equal:theValue(oneDay)];
                });
            });
            context(@"when 1 hour ago", ^{
                int oneHour = 1;
                __block NSDate *theOtherDate;
                beforeEach(^{
                    theOtherDate = [currentDate dateBySubtractingHours:oneHour];
                });
                it(@"should return -1", ^{
                    NSInteger result = [currentDate hoursBeforeDate:theOtherDate];
                    [[theValue(result) should] equal:theValue(-oneHour)];
                });
            });
        });
    });


    describe(@"-daysAfterDate", ^{
        context(@"the date is 2010-10-10 10:10:10", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                    AZ_DateUnit.hour : @10,
                    AZ_DateUnit.minute : @10,
                    AZ_DateUnit.second : @10,
                }];
                [FakeDateUtil stubCurrentDate:currentDate];
            });
            context(@"when 1 day ago", ^{
                int oneHour = 1;
                __block NSDate *theOtherDate;
                beforeEach(^{
                    theOtherDate = [currentDate dateBySubtractingDays:oneHour];
                });
                it(@"should return 1", ^{
                    NSInteger day = [currentDate daysAfterDate:theOtherDate];
                    [[theValue(day) should] equal:theValue(oneHour)];
                });
            });
            context(@"when 1 day later", ^{
                int oneHour = 1;
                __block NSDate *theOtherDate;
                beforeEach(^{
                    theOtherDate = [currentDate dateByAddingDays:oneHour];
                });
                it(@"should return -1", ^{
                    NSInteger day = [currentDate daysAfterDate:theOtherDate];
                    [[theValue(day) should] equal:theValue(-oneHour)];
                });
            });
        });
    });

    describe(@"-daysBeforeDate", ^{
        context(@"the date is 2010-10-10 10:10:10", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                    AZ_DateUnit.hour : @10,
                    AZ_DateUnit.minute : @10,
                    AZ_DateUnit.second : @10,
                }];
                [FakeDateUtil stubCurrentDate:currentDate];
            });
            context(@"when 1 day ago", ^{
                int oneHour = 1;
                __block NSDate *theOtherDate;
                beforeEach(^{
                    theOtherDate = [currentDate dateBySubtractingDays:oneHour];
                });
                it(@"should return -1", ^{
                    NSInteger day = [currentDate daysBeforeDate:theOtherDate];
                    [[theValue(day) should] equal:theValue(-oneHour)];
                });
            });
            context(@"when 1 day later", ^{
                int oneHour = 1;
                __block NSDate *theOtherDate;
                beforeEach(^{
                    theOtherDate = [currentDate dateByAddingDays:oneHour];
                });
                it(@"should return 1", ^{
                    NSInteger day = [currentDate daysBeforeDate:theOtherDate];
                    [[theValue(day) should] equal:theValue(oneHour)];
                });
            });
        });
    });
    SPEC_END
