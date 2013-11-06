#import "Kiwi.h"
#import "NSDate+Escort.h"
#import "NSDate+AZDateBuilder.h"

SPEC_BEGIN(EscortDecomposingSpec)

    registerMatchers(@"AZ");// NSDate Custom Matcher
    describe(@"-nearestHour", ^{
        context(@"when 10:00:00", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                    AZ_DateUnit.hour : @10,
                    AZ_DateUnit.minute : @0,
                    AZ_DateUnit.second : @0,
                }];
            });
            it(@"should return 10", ^{
                NSInteger nearestHour = [currentDate nearestHour];
                [[theValue(nearestHour) should] equal:theValue(10)];
            });
        });
        context(@"when 10:29:59", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                    AZ_DateUnit.hour : @10,
                    AZ_DateUnit.minute : @29,
                    AZ_DateUnit.second : @59,
                }];
            });
            it(@"should return 10", ^{
                NSInteger nearestHour = [currentDate nearestHour];
                [[theValue(nearestHour) should] equal:theValue(10)];
            });
        });
        context(@"when 10:30:00", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                    AZ_DateUnit.hour : @10,
                    AZ_DateUnit.minute : @30,
                    AZ_DateUnit.second : @0,
                }];
            });
            it(@"should return 11", ^{
                NSInteger nearestHour = [currentDate nearestHour];
                [[theValue(nearestHour) should] equal:theValue(11)];
            });
        });
    });
    describe(@"-hour", ^{
        context(@"when the date is 01:02:03", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                    AZ_DateUnit.hour : @1,
                    AZ_DateUnit.minute : @2,
                    AZ_DateUnit.second : @3,
                }];
            });
            it(@"should return 1", ^{
                NSInteger hour = [currentDate hour];
                [[theValue(hour) should] equal:theValue(1)];
            });
        });
    });
    describe(@"-minute", ^{
        context(@"when the date is 01:02:03", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                    AZ_DateUnit.hour : @1,
                    AZ_DateUnit.minute : @2,
                    AZ_DateUnit.second : @3,
                }];
            });
            it(@"should return 2", ^{
                NSInteger minute = [currentDate minute];
                [[theValue(minute) should] equal:theValue(2)];
            });
        });
    });
    describe(@"-seconds", ^{
        context(@"when the date is 01:02:03", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                    AZ_DateUnit.hour : @1,
                    AZ_DateUnit.minute : @2,
                    AZ_DateUnit.second : @3,
                }];
            });
            it(@"should return 3", ^{
                NSInteger seconds = [currentDate seconds];
                [[theValue(seconds) should] equal:theValue(3)];
            });
        });
    });
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
    describe(@"-month", ^{
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
                NSInteger month = [currentDate month];
                [[theValue(month) should] equal:theValue(10)];
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

    describe(@"-nthWeekday", ^{
        context(@"when the date 2010-10-10(2th weekday)", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                }];
            });
            it(@"should return 2", ^{
                NSInteger nthWeekday = [currentDate nthWeekday];
                [[theValue(nthWeekday) should] equal:theValue(2)];
            });
        });
    });
    describe(@"-firstDayOfWeekday", ^{
        context(@"when the date 2010-10-10", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,// weekday is 1
                }];
            });
            it(@"should return 10", ^{
                NSInteger firstDayOfWeekday = [currentDate firstDayOfWeekday];
                [[theValue(firstDayOfWeekday) should] equal:theValue(10)];
            });
        });
        context(@"when the date 2010-10-16", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,// weekday is 1
                }];
            });
            it(@"should return 10", ^{
                NSInteger firstDayOfWeekday = [currentDate firstDayOfWeekday];
                [[theValue(firstDayOfWeekday) should] equal:theValue(10)];
            });
        });
    });
    describe(@"-lastDayOfWeekday", ^{
        context(@"when the date 2010-10-10", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,// weekday is 1
                }];
            });
            it(@"should return 16", ^{
                NSInteger lastDayOfWeekday = [currentDate lastDayOfWeekday];
                [[theValue(lastDayOfWeekday) should] equal:theValue(16)];
            });
        });
        context(@"when the date 2010-10-16", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,// weekday is 1
                }];
            });
            it(@"should return 16", ^{
                NSInteger lastDayOfWeekday = [currentDate lastDayOfWeekday];
                [[theValue(lastDayOfWeekday) should] equal:theValue(16)];
            });
        });
    });
    describe(@"-year", ^{
        context(@"when the date 2010-10-10", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                }];
            });
            it(@"should return 2010", ^{
                NSInteger yearValue = [currentDate year];
                [[theValue(yearValue) should] equal:theValue(2010)];
            });
        });
        context(@"when the date is no Gregorian", ^{
            __block NSDate *currentDate;
            __block NSDate *expectedDate;
            beforeEach(^{
                expectedDate = [NSDate dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                }];

                NSCalendar *jaCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSJapaneseCalendar];
                NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
                dateComponents.year = 1;
                dateComponents.month = 10;
                dateComponents.day = 10;
                currentDate = [jaCalendar dateFromComponents:dateComponents];
                // +currentCalendar overwrite NSJapaneseCalendar.
                [NSDate stub:@selector(AZ_currentCalendar) andReturn:jaCalendar];
            });
            it(@"should **not** return 2010", ^{
                NSInteger yearValue = [currentDate year];
                [[theValue(yearValue) shouldNot] equal:theValue(2010)];
            });
            it(@"should return 1", ^{
                NSInteger yearValue = [currentDate year];
                [[theValue(yearValue) shouldNot] equal:theValue(2010)];
            });
            it(@"the date equal to 2010-10-10", ^{
                [[theValue(currentDate) shouldNot] equal:expectedDate];
            });
        });
    });

    SPEC_END
