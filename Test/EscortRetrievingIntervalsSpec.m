#import "Kiwi.h"
#import "FakeDateUtil.h"
#import "NSDate+AZDateBuilder.h"
#import "NSDate+Escort.h"

@interface NSDate ()
+ (NSCalendar *)AZ_currentCalendar;
@end

SPEC_BEGIN(EscortRetrievingIntervals)
    registerMatchers(@"AZ");// NSDate Custom Matcher

    describe(@"-minutesAfterDate", ^{
        context(@"the date is 2010-10-10 10:10:10", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                    AZ_DateUnit.hour : @10,
                    AZ_DateUnit.minute : @10,
                    AZ_DateUnit.second : @10,
                }];
                [FakeDateUtil stubCurrentDate:currentDate];
            });
            context(@"when 5 seconds ago", ^{
                int fiveSeconds = 5;
                __block NSDate *anotherDate;
                beforeEach(^{
                    anotherDate = [currentDate dateBySubtractingSeconds:fiveSeconds];
                });
                it(@"should return 5", ^{
                    NSInteger seconds = [currentDate secondsAfterDate:anotherDate];
                    [[theValue(seconds) should] equal:theValue(fiveSeconds)];
                });
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
            context(@"when 5 seconds later", ^{
                int fiveSeconds = 5;
                __block NSDate *anotherDate;
                beforeEach(^{
                    anotherDate = [currentDate dateByAddingSeconds:fiveSeconds];
                });
                it(@"should return -5", ^{
                    NSInteger seconds = [currentDate secondsAfterDate:anotherDate];
                    [[theValue(seconds) should] equal:theValue(-fiveSeconds)];
                });
            });
        });
    });

    describe(@"-minutesBeforeDate", ^{
        context(@"the date is 2010-10-10 10:10:10", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                    AZ_DateUnit.hour : @10,
                    AZ_DateUnit.minute : @10,
                    AZ_DateUnit.second : @10,
                }];
                [FakeDateUtil stubCurrentDate:currentDate];
            });
            context(@"when 5 second later", ^{
                int fiveSecond = 5;
                __block NSDate *anotherDate;
                beforeEach(^{
                    anotherDate = [currentDate dateByAddingSeconds:fiveSecond];
                });
                it(@"should return 5", ^{
                    NSInteger seconds = [currentDate secondsBeforeDate:anotherDate];
                    [[theValue(seconds) should] equal:theValue(fiveSecond)];
                });
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
            context(@"when 5 seconds ago", ^{
                int fiveSeconds = 5;
                __block NSDate *anotherDate;
                beforeEach(^{
                    anotherDate = [currentDate dateBySubtractingSeconds:fiveSeconds];
                });
                it(@"should return -5", ^{
                    NSInteger seconds = [currentDate secondsBeforeDate:anotherDate];
                    [[theValue(seconds) should] equal:theValue(-fiveSeconds)];
                });
            });
        });
    });

    describe(@"-hoursAfterDate", ^{
        context(@"the date is 2010-10-10 10:10:10", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate AZ_dateByUnit:@{
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
                currentDate = [NSDate AZ_dateByUnit:@{
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
                currentDate = [NSDate AZ_dateByUnit:@{
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
                int oneDay = 1;
                __block NSDate *anotherDate;
                beforeEach(^{
                    anotherDate = [currentDate dateBySubtractingDays:oneDay];
                });
                it(@"should return 1", ^{
                    NSInteger day = [currentDate daysAfterDate:anotherDate];
                    [[theValue(day) should] equal:theValue(oneDay)];
                });
            });
            context(@"when 1 day later", ^{
                int oneDay = 1;
                __block NSDate *anotherDate;
                beforeEach(^{
                    anotherDate = [currentDate dateByAddingDays:oneDay];
                });
                it(@"should return -1", ^{
                    NSInteger day = [currentDate daysAfterDate:anotherDate];
                    [[theValue(day) should] equal:theValue(-oneDay)];
                });
            });
        });
        
        // Set the date to 29th March 2015 01:00 (the day daylight savings ends)
        context(@"the date is 2015-03-29 00:00:00 in ", ^{
            __block NSDate *currentDate;
            __block NSDate *anotherDate;
            beforeEach(^{
                NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Europe/London"];
                [NSTimeZone stub:@selector(defaultTimeZone) andReturn:timeZone];
                NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
                [NSDate stub:@selector(AZ_currentCalendar) andReturn:calendar];

                
                currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2015,
                    AZ_DateUnit.month : @3,
                    AZ_DateUnit.day : @29,
                }];
                anotherDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2015,
                    AZ_DateUnit.month : @3,
                    AZ_DateUnit.day : @30,
                }];
            });
            it(@"should return 82800 seconds", ^{
                NSInteger diff = [currentDate timeIntervalSinceDate:anotherDate];
                [[theValue(diff) should] equal:theValue(-82800)];
            });
            it(@"should return 1", ^{
                NSInteger diff = [currentDate daysBeforeDate:anotherDate];
                [[theValue(diff) should] equal:theValue(1)];
            });
        });
    });

    describe(@"-daysBeforeDate", ^{
        context(@"the date is 2010-10-10 10:10:10", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate AZ_dateByUnit:@{
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
                int oneDay = 1;
                __block NSDate *anotherDate;
                beforeEach(^{
                    anotherDate = [currentDate dateBySubtractingDays:oneDay];
                });
                it(@"should return -1", ^{
                    NSInteger day = [currentDate daysBeforeDate:anotherDate];
                    [[theValue(day) should] equal:theValue(-oneDay)];
                });
            });
            context(@"when 1 day later", ^{
                int oneDay = 1;
                __block NSDate *anotherDate;
                beforeEach(^{
                    anotherDate = [currentDate dateByAddingDays:oneDay];
                });
                it(@"should return 1", ^{
                    NSInteger day = [currentDate daysBeforeDate:anotherDate];
                    [[theValue(day) should] equal:theValue(oneDay)];
                });
            });
        });
        context(@"the date is 2015-03-29 00:00:00", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Europe/London"];
                [NSTimeZone stub:@selector(defaultTimeZone) andReturn:timeZone];
                NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
                [NSDate stub:@selector(AZ_currentCalendar) andReturn:calendar];
                
                currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2015,
                    AZ_DateUnit.month : @3,
                    AZ_DateUnit.day : @29,
                }];
            });
            context(@"when day ago", ^{
                int oneDay = 1;
                __block NSDate *anotherDate;
                beforeEach(^{
                           anotherDate = [currentDate dateByAddingDays:oneDay];
                });
                it(@"should return 1", ^{
                    NSInteger diff = [currentDate daysAfterDate:anotherDate];
                    [[theValue(diff) should] equal:theValue(-oneDay)];
                });
            });
        });
    });

    describe(@"-monthsBeforeDate", ^{
        context(@"the date is 2010-10-10 10:10:10", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                    AZ_DateUnit.hour : @10,
                    AZ_DateUnit.minute : @10,
                    AZ_DateUnit.second : @10,
                }];
                [FakeDateUtil stubCurrentDate:currentDate];
            });
            context(@"same date", ^{
                it(@"should return 0", ^{
                    NSInteger day = [currentDate monthsAfterDate:currentDate];
                    [[theValue(day) should] equal:theValue(0)];
                });
            });
            context(@"when 1 months ago", ^{
                int oneMonth = 1;
                __block NSDate *anotherDate;
                beforeEach(^{
                    anotherDate = [currentDate dateBySubtractingMonths:oneMonth];
                });
                it(@"should return 1", ^{
                    NSInteger day = [currentDate monthsAfterDate:anotherDate];
                    [[theValue(day) should] equal:theValue(oneMonth)];
                });
            });
            context(@"when 1 months ago and 1 second later", ^{
                int oneMonth = 1;
                int oneSecond = 1;
                __block NSDate *anotherDate;
                beforeEach(^{
                    anotherDate = [[currentDate dateBySubtractingMonths:oneMonth] dateByAddingTimeInterval:oneSecond];
                });
                it(@"should return 0", ^{
                    NSInteger day = [currentDate monthsAfterDate:anotherDate];
                    [[theValue(day) should] equal:theValue(0)];
                });
            });
            context(@"when 1 month later", ^{
                int oneMonth = 1;
                __block NSDate *anotherDate;
                beforeEach(^{
                    anotherDate = [currentDate dateByAddingMonths:oneMonth];
                });
                it(@"should return -1", ^{
                    NSInteger day = [currentDate monthsAfterDate:anotherDate];
                    [[theValue(day) should] equal:theValue(-oneMonth)];
                });
            });
            context(@"when 1 month later and 1second ago", ^{
                int oneMonth = 1;
                int oneSecond = 1;
                __block NSDate *anotherDate;
                beforeEach(^{
                    anotherDate = [[currentDate dateByAddingMonths:oneMonth] dateByAddingTimeInterval:-oneSecond];
                });
                it(@"should return 0", ^{
                    NSInteger day = [currentDate monthsAfterDate:anotherDate];
                    [[theValue(day) should] equal:theValue(0)];
                });
            });
        });
    });
    describe(@"-monthsBeforeDate", ^{
        context(@"the date is 2010-10-10 10:10:10", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate AZ_dateByUnit:@{
                               AZ_DateUnit.year : @2010,
                               AZ_DateUnit.month : @10,
                               AZ_DateUnit.day : @10,
                               AZ_DateUnit.hour : @10,
                               AZ_DateUnit.minute : @10,
                               AZ_DateUnit.second : @10,
                               }];
                [FakeDateUtil stubCurrentDate:currentDate];
            });
            context(@"same date", ^{
                it(@"should return 0", ^{
                    NSInteger day = [currentDate monthsBeforeDate:currentDate];
                    [[theValue(day) should] equal:theValue(0)];
                });
            });
            context(@"when 1 months ago", ^{
                int oneMonth = 1;
                __block NSDate *anotherDate;
                beforeEach(^{
                    anotherDate = [currentDate dateBySubtractingMonths:oneMonth];
                });
                it(@"should return -1", ^{
                    NSInteger day = [currentDate monthsBeforeDate:anotherDate];
                    [[theValue(day) should] equal:theValue(-oneMonth)];
                });
            });
            context(@"when 1 months ago and 1 second later", ^{
                int oneMonth = 1;
                int oneSecond = 1;
                __block NSDate *anotherDate;
                beforeEach(^{
                    anotherDate = [[currentDate dateBySubtractingMonths:oneMonth] dateByAddingTimeInterval:oneSecond];
                });
                it(@"should return 0", ^{
                    NSInteger day = [currentDate monthsBeforeDate:anotherDate];
                    [[theValue(day) should] equal:theValue(0)];
                });
            });
            context(@"when 1 month later", ^{
                int oneMonth = 1;
                __block NSDate *anotherDate;
                beforeEach(^{
                    anotherDate = [currentDate dateByAddingMonths:oneMonth];
                });
                it(@"should return 1", ^{
                    NSInteger day = [currentDate monthsBeforeDate:anotherDate];
                    [[theValue(day) should] equal:theValue(oneMonth)];
                });
            });
            context(@"when 1 month later and 1second ago", ^{
                int oneMonth = 1;
                int oneSecond = 1;
                __block NSDate *anotherDate;
                beforeEach(^{
                    anotherDate = [[currentDate dateByAddingMonths:oneMonth] dateByAddingTimeInterval:-oneSecond];
                });
                it(@"should return 0", ^{
                    NSInteger day = [currentDate monthsBeforeDate:anotherDate];
                    [[theValue(day) should] equal:theValue(0)];
                });
            });
            context(@"when 365 days later", ^{
                int day365 = 365;
                __block NSDate *anotherDate;
                beforeEach(^{
                    anotherDate = [currentDate dateByAddingDays:day365];
                });
                it(@"should return 12", ^{
                    NSInteger day = [currentDate monthsBeforeDate:anotherDate];
                    [[theValue(day) should] equal:theValue(12)];
                });
            });
        });
        context(@"when the date'calendar is not Gregorian", ^{
            __block NSCalendar *jaCalendar;
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @1988,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                }];
                // +currentCalendar overwrite NSCalendarIdentifierJapanese.
                jaCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierJapanese];
                [NSDate stub:@selector(AZ_currentCalendar) andReturn:jaCalendar];
            });
            context(@"difference between Shouwa 64 and Heisei 1 is 1", ^{
                __block NSDate *anotherDate;
                beforeEach(^{
                    anotherDate = [NSDate AZ_dateByUnit:@{
                        AZ_DateUnit.year : @1989,
                        AZ_DateUnit.month : @10,
                        AZ_DateUnit.day : @10,
                    }];
                });
                it(@"currentDate year is 63", ^{
                    [[theValue(currentDate.year) should] equal:theValue(63)];
                });
                it(@"anotherDate year is 1", ^{
                    [[theValue(anotherDate.year) should] equal:theValue(1)];
                });
                it(@"monthsBeforeaDate is 12", ^() {
                    NSInteger months = [currentDate monthsBeforeDate:anotherDate];
                    [[theValue(months) should] equal:theValue(12)];
                });
                
            });
        });
    });

    describe(@"-distanceInDaysToDate", ^{
        context(@"the date 2010-10-10, ", ^{
            __block NSDate *currentDate;
            __block NSDate *anotherDate;
            beforeEach(^{
                currentDate = [NSDate AZ_dateByUnit:@{
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
            context(@"when another date is 400 days later", ^{
                NSInteger expectDays = 400;
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
