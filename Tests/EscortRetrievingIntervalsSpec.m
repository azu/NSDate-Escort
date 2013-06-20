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
                __block NSDate *anotherDate;
                beforeEach(^{
                    anotherDate = [currentDate dateBySubtractingMinutes:tenMinutes];
                });
                it(@"should return 10", ^{
                    NSInteger minutes = [currentDate minutesAfterDate:anotherDate];
                    [[theValue(minutes) should] equal:theValue(tenMinutes)];
                });
            });
            context(@"when 1 hour ago", ^{
                int oneHour = 1;
                __block NSDate *anotherDate;
                beforeEach(^{
                    anotherDate = [currentDate dateBySubtractingHours:oneHour];
                });
                it(@"should return 60", ^{
                    NSInteger minutes = [currentDate minutesAfterDate:anotherDate];
                    [[theValue(minutes) should] equal:theValue(60)];
                });
            });
            context(@"when 10 minutes later", ^{
                int tenMinutes = 10;
                __block NSDate *anotherDate;
                beforeEach(^{
                    anotherDate = [currentDate dateByAddingMinutes:tenMinutes];
                });
                it(@"should return -10", ^{
                    NSInteger minutes = [currentDate minutesAfterDate:anotherDate];
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
                __block NSDate *anotherDate;
                beforeEach(^{
                    anotherDate = [currentDate dateByAddingMinutes:tenMinutes];
                });
                it(@"should return 10", ^{
                    NSInteger minutes = [currentDate minutesBeforeDate:anotherDate];
                    [[theValue(minutes) should] equal:theValue(tenMinutes)];
                });
            });
            context(@"when 1 hour later", ^{
                int oneHour = 1;
                __block NSDate *anotherDate;
                beforeEach(^{
                    anotherDate = [currentDate dateByAddingHours:oneHour];
                });
                it(@"should return 60", ^{
                    NSInteger minutes = [currentDate minutesBeforeDate:anotherDate];
                    [[theValue(minutes) should] equal:theValue(60)];
                });
            });
            context(@"when 10 minutes ago", ^{
                int tenMinutes = 10;
                __block NSDate *anotherDate;
                beforeEach(^{
                    anotherDate = [currentDate dateBySubtractingMinutes:tenMinutes];
                });
                it(@"should return -10", ^{
                    NSInteger minutes = [currentDate minutesBeforeDate:anotherDate];
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
                __block NSDate *anotherDate;
                beforeEach(^{
                    anotherDate = [currentDate dateBySubtractingHours:oneHour];
                });
                it(@"should return 1", ^{
                    NSInteger result = [currentDate hoursAfterDate:anotherDate];
                    [[theValue(result) should] equal:theValue(oneHour)];
                });
            });
            context(@"when 1 day ago", ^{
                int oneDay = 24;
                __block NSDate *anotherDate;
                beforeEach(^{
                    anotherDate = [currentDate dateBySubtractingHours:oneDay];
                });
                it(@"should return 24", ^{
                    NSInteger result = [currentDate hoursAfterDate:anotherDate];
                    [[theValue(result) should] equal:theValue(oneDay)];
                });
            });
            context(@"when 1 hour later", ^{
                int oneHour = 1;
                __block NSDate *anotherDate;
                beforeEach(^{
                    anotherDate = [currentDate dateByAddingHours:oneHour];
                });
                it(@"should return -1", ^{
                    NSInteger result = [currentDate hoursAfterDate:anotherDate];
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
                __block NSDate *anotherDate;
                beforeEach(^{
                    anotherDate = [currentDate dateByAddingHours:oneHour];
                });
                it(@"should return 1", ^{
                    NSInteger result = [currentDate hoursBeforeDate:anotherDate];
                    [[theValue(result) should] equal:theValue(oneHour)];
                });
            });
            context(@"when 1 day later", ^{
                int oneDay = 24;
                __block NSDate *anotherDate;
                beforeEach(^{
                    anotherDate = [currentDate dateByAddingHours:oneDay];
                });
                it(@"should return 24", ^{
                    NSInteger result = [currentDate hoursBeforeDate:anotherDate];
                    [[theValue(result) should] equal:theValue(oneDay)];
                });
            });
            context(@"when 1 hour ago", ^{
                int oneHour = 1;
                __block NSDate *anotherDate;
                beforeEach(^{
                    anotherDate = [currentDate dateBySubtractingHours:oneHour];
                });
                it(@"should return -1", ^{
                    NSInteger result = [currentDate hoursBeforeDate:anotherDate];
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
                __block NSDate *anotherDate;
                beforeEach(^{
                    anotherDate = [currentDate dateBySubtractingDays:oneHour];
                });
                it(@"should return 1", ^{
                    NSInteger day = [currentDate daysAfterDate:anotherDate];
                    [[theValue(day) should] equal:theValue(oneHour)];
                });
            });
            context(@"when 1 day later", ^{
                int oneHour = 1;
                __block NSDate *anotherDate;
                beforeEach(^{
                    anotherDate = [currentDate dateByAddingDays:oneHour];
                });
                it(@"should return -1", ^{
                    NSInteger day = [currentDate daysAfterDate:anotherDate];
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
                __block NSDate *anotherDate;
                beforeEach(^{
                    anotherDate = [currentDate dateBySubtractingDays:oneHour];
                });
                it(@"should return -1", ^{
                    NSInteger day = [currentDate daysBeforeDate:anotherDate];
                    [[theValue(day) should] equal:theValue(-oneHour)];
                });
            });
            context(@"when 1 day later", ^{
                int oneHour = 1;
                __block NSDate *anotherDate;
                beforeEach(^{
                    anotherDate = [currentDate dateByAddingDays:oneHour];
                });
                it(@"should return 1", ^{
                    NSInteger day = [currentDate daysBeforeDate:anotherDate];
                    [[theValue(day) should] equal:theValue(oneHour)];
                });
            });
        });
    });

    describe(@"-distanceInDaysToDate", ^{
        context(@"the date 2010-10-10, ", ^{
            __block NSDate *currentDate;
            __block NSDate *anotherDate;
            beforeEach(^{
                currentDate = [NSDate dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                    AZ_DateUnit.hour : @10,
                    AZ_DateUnit.minute : @10,
                    AZ_DateUnit.second : @10,
                }];
            });
            context(@"when another date is same date", ^{
                it(@"should return 0", ^{
                    NSInteger expectDays = 0;
                    NSInteger distanceDays = [currentDate distanceInDaysToDate:currentDate];
                    [[theValue(distanceDays) should] equal:theValue(expectDays)];
                });
            });
            context(@"when another date is 10 days later", ^{
                NSInteger expectDays = 10;
                beforeEach(^{
                    anotherDate = [currentDate dateByAddingDays:expectDays];
                });
                it(@"should return 10", ^{
                    NSInteger distanceDays = [currentDate distanceInDaysToDate:anotherDate];
                    [[theValue(distanceDays) should] equal:theValue(expectDays)];
                });
            });
            // big days
            context(@"when another date is 100 days later", ^{
                NSInteger expectDays = 100;
                beforeEach(^{
                    anotherDate = [currentDate dateByAddingDays:expectDays];
                });
                it(@"should return 100", ^{
                    NSInteger distanceDays = [currentDate distanceInDaysToDate:anotherDate];
                    [[theValue(distanceDays) should] equal:theValue(expectDays)];
                });
            });
            context(@"when another date is 10 days ago", ^{
                NSInteger expectDays = 10;
                beforeEach(^{
                    anotherDate = [currentDate dateBySubtractingDays:expectDays];
                });
                it(@"should return -10", ^{
                    NSInteger distanceDays = [currentDate distanceInDaysToDate:anotherDate];
                    [[theValue(distanceDays) should] equal:theValue(-expectDays)];
                });
            });
        });
    });

    SPEC_END
