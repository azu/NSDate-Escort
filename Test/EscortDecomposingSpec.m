#import "Kiwi.h"
#import "NSDate+Escort.h"
#import "NSDate+AZDateBuilder.h"

@interface NSDate ()
+ (NSCalendar *)AZ_currentCalendar;
@end

SPEC_BEGIN(EscortDecomposingSpec)
    registerMatchers(@"AZ");// NSDate Custom Matcher
    describe(@"-nearestHour", ^{
        context(@"when 10:00:00", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate AZ_dateByUnit:@{
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
                currentDate = [NSDate AZ_dateByUnit:@{
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
                currentDate = [NSDate AZ_dateByUnit:@{
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
                currentDate = [NSDate AZ_dateByUnit:@{
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
                currentDate = [NSDate AZ_dateByUnit:@{
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
                currentDate = [NSDate AZ_dateByUnit:@{
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
                currentDate = [NSDate AZ_dateByUnit:@{
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
                currentDate = [NSDate AZ_dateByUnit:@{
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
                currentDate = [NSDate AZ_dateByUnit:@{
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
                currentDate = [NSDate AZ_dateByUnit:@{
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
                currentDate = [NSDate AZ_dateByUnit:@{
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
                currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,// weekday is 1
                }];
            });
            context(@"begining of sunday for weekady", ^{
                beforeEach(^{
                    NSCalendar *beginingOfMondayCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
                    beginingOfMondayCalendar.firstWeekday = 1;
                    [NSDate stub:@selector(AZ_currentCalendar) andReturn:beginingOfMondayCalendar];
                });
                it(@"should return 10", ^{
                    NSInteger firstDayOfWeekday = [currentDate firstDayOfWeekday];
                    [[theValue(firstDayOfWeekday) should] equal:theValue(10)];
                });
            });
            context(@"begining of monday for weekady", ^{
                beforeEach(^{
                    NSCalendar *beginingOfMondayCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
                    beginingOfMondayCalendar.firstWeekday = 2;
                    [NSDate stub:@selector(AZ_currentCalendar) andReturn:beginingOfMondayCalendar];
                });
                it(@"should return 4", ^{
                    NSInteger firstDayOfWeekday = [currentDate firstDayOfWeekday];
                    [[theValue(firstDayOfWeekday) should] equal:theValue(4)];
                });
            });
        });
        context(@"when the date 2010-10-11", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @11,// weekday is 1
                }];
            });
            context(@"begining of sunday for weekady", ^{
                beforeEach(^{
                    NSCalendar *beginingOfMondayCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
                    beginingOfMondayCalendar.firstWeekday = 1;
                    [NSDate stub:@selector(AZ_currentCalendar) andReturn:beginingOfMondayCalendar];
                });
                it(@"should return 10", ^{
                    NSInteger firstDayOfWeekday = [currentDate firstDayOfWeekday];
                    [[theValue(firstDayOfWeekday) should] equal:theValue(10)];
                });
            });
            context(@"begining of monday for weekady", ^{
                beforeEach(^{
                    NSCalendar *beginingOfMondayCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
                    beginingOfMondayCalendar.firstWeekday = 2;
                    [NSDate stub:@selector(AZ_currentCalendar) andReturn:beginingOfMondayCalendar];
                });
                it(@"should return 11", ^{
                    NSInteger firstDayOfWeekday = [currentDate firstDayOfWeekday];
                    [[theValue(firstDayOfWeekday) should] equal:theValue(11)];
                });
            });
        });
        context(@"when the date 2010-10-15", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @15,// weekday is 1
                }];
            });
            context(@"begining of sunday for weekady", ^{
                beforeEach(^{
                    NSCalendar *beginingOfMondayCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
                    beginingOfMondayCalendar.firstWeekday = 1;
                    [NSDate stub:@selector(AZ_currentCalendar) andReturn:beginingOfMondayCalendar];
                });
                it(@"should return 10", ^{
                    NSInteger firstDayOfWeekday = [currentDate firstDayOfWeekday];
                    [[theValue(firstDayOfWeekday) should] equal:theValue(10)];
                });
            });
            context(@"begining of monday for weekady", ^{
                beforeEach(^{
                    NSCalendar *beginingOfMondayCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
                    beginingOfMondayCalendar.firstWeekday = 2;
                    [NSDate stub:@selector(AZ_currentCalendar) andReturn:beginingOfMondayCalendar];
                });
                it(@"should return 11", ^{
                    NSInteger firstDayOfWeekday = [currentDate firstDayOfWeekday];
                    [[theValue(firstDayOfWeekday) should] equal:theValue(11)];
                });
            });
        });
        context(@"when the date 2010-10-16", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @16,// weekday is 1
                }];
            });
            context(@"begining of sunday for weekady", ^{
                beforeEach(^{
                    NSCalendar *beginingOfMondayCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
                    beginingOfMondayCalendar.firstWeekday = 1;
                    [NSDate stub:@selector(AZ_currentCalendar) andReturn:beginingOfMondayCalendar];
                });
                it(@"should return 10", ^{
                    NSInteger firstDayOfWeekday = [currentDate firstDayOfWeekday];
                    [[theValue(firstDayOfWeekday) should] equal:theValue(10)];
                });
            });
            context(@"begining of monday for weekady", ^{
                beforeEach(^{
                    NSCalendar *beginingOfMondayCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
                    beginingOfMondayCalendar.firstWeekday = 2;
                    [NSDate stub:@selector(AZ_currentCalendar) andReturn:beginingOfMondayCalendar];
                });
                it(@"should return 10", ^{
                    NSInteger firstDayOfWeekday = [currentDate firstDayOfWeekday];
                    [[theValue(firstDayOfWeekday) should] equal:theValue(11)];
                });
            });
        });
    });
    describe(@"-lastDayOfWeekday", ^{
        context(@"when the date 2010-10-10", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,// weekday is 1
                }];
            });
            context(@"begining of sunday for weekady", ^{
                beforeEach(^{
                    NSCalendar *beginingOfMondayCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
                    beginingOfMondayCalendar.firstWeekday = 1;
                    [NSDate stub:@selector(AZ_currentCalendar) andReturn:beginingOfMondayCalendar];
                });
                it(@"should return 10", ^{
                    NSInteger lastDayOfWeekday = [currentDate lastDayOfWeekday];
                    [[theValue(lastDayOfWeekday) should] equal:theValue(16)];
                });
            });
            context(@"begining of monday for weekady", ^{
                beforeEach(^{
                    NSCalendar *beginingOfMondayCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
                    beginingOfMondayCalendar.firstWeekday = 2;
                    [NSDate stub:@selector(AZ_currentCalendar) andReturn:beginingOfMondayCalendar];
                });
                it(@"should return 4", ^{
                    NSInteger lastDayOfWeekday = [currentDate lastDayOfWeekday];
                    [[theValue(lastDayOfWeekday) should] equal:theValue(10)];
                });
            });
        });
        context(@"when the date 2010-10-11", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @11,// weekday is 1
                }];
            });
            context(@"begining of sunday for weekady", ^{
                beforeEach(^{
                    NSCalendar *beginingOfMondayCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
                    beginingOfMondayCalendar.firstWeekday = 1;
                    [NSDate stub:@selector(AZ_currentCalendar) andReturn:beginingOfMondayCalendar];
                });
                it(@"should return 10", ^{
                    NSInteger lastDayOfWeekday = [currentDate lastDayOfWeekday];
                    [[theValue(lastDayOfWeekday) should] equal:theValue(16)];
                });
            });
            context(@"begining of monday for weekady", ^{
                beforeEach(^{
                    NSCalendar *beginingOfMondayCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
                    beginingOfMondayCalendar.firstWeekday = 2;
                    [NSDate stub:@selector(AZ_currentCalendar) andReturn:beginingOfMondayCalendar];
                });
                it(@"should return 11", ^{
                    NSInteger lastDayOfWeekday = [currentDate lastDayOfWeekday];
                    [[theValue(lastDayOfWeekday) should] equal:theValue(17)];
                });
            });
        });
        context(@"when the date 2010-10-15", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @15,// weekday is 1
                }];
            });
            context(@"begining of sunday for weekady", ^{
                beforeEach(^{
                    NSCalendar *beginingOfMondayCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
                    beginingOfMondayCalendar.firstWeekday = 1;
                    [NSDate stub:@selector(AZ_currentCalendar) andReturn:beginingOfMondayCalendar];
                });
                it(@"should return 10", ^{
                    NSInteger lastDayOfWeekday = [currentDate lastDayOfWeekday];
                    [[theValue(lastDayOfWeekday) should] equal:theValue(16)];
                });
            });
            context(@"begining of monday for weekady", ^{
                beforeEach(^{
                    NSCalendar *beginingOfMondayCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
                    beginingOfMondayCalendar.firstWeekday = 2;
                    [NSDate stub:@selector(AZ_currentCalendar) andReturn:beginingOfMondayCalendar];
                });
                it(@"should return 11", ^{
                    NSInteger lastDayOfWeekday = [currentDate lastDayOfWeekday];
                    [[theValue(lastDayOfWeekday) should] equal:theValue(17)];
                });
            });
        });
        context(@"when the date 2010-10-16", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @16,// weekday is 1
                }];
            });
            context(@"begining of sunday for weekady", ^{
                beforeEach(^{
                    NSCalendar *beginingOfMondayCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
                    beginingOfMondayCalendar.firstWeekday = 1;
                    [NSDate stub:@selector(AZ_currentCalendar) andReturn:beginingOfMondayCalendar];
                });
                it(@"should return 10", ^{
                    NSInteger lastDayOfWeekday = [currentDate lastDayOfWeekday];
                    [[theValue(lastDayOfWeekday) should] equal:theValue(16)];
                });
            });
            context(@"begining of monday for weekady", ^{
                beforeEach(^{
                    NSCalendar *beginingOfMondayCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
                    beginingOfMondayCalendar.firstWeekday = 2;
                    [NSDate stub:@selector(AZ_currentCalendar) andReturn:beginingOfMondayCalendar];
                });
                it(@"should return 10", ^{
                    NSInteger lastDayOfWeekday = [currentDate lastDayOfWeekday];
                    [[theValue(lastDayOfWeekday) should] equal:theValue(17)];
                });
            });
        });
    });
    describe(@"-year", ^{
        context(@"when the date 2010-10-10", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                }];
            });
            it(@"should return 2010", ^{
                NSInteger yearValue = [currentDate year];

                NSCalendar *c = [NSCalendar currentCalendar];
                if ([c.calendarIdentifier isEqualToString:NSCalendarIdentifierGregorian]) {
                    [[theValue(yearValue) should] equal:theValue(2010)];
                } else if ([c.calendarIdentifier isEqualToString:NSCalendarIdentifierJapanese]) {
                    [[theValue(yearValue) should] equal:theValue(22)];
                } else {
                    [[theValue(yearValue) shouldNot] equal:theValue(2010)];
                    [[theValue(yearValue) shouldNot] equal:theValue(22)];
                }
            });
        });
        context(@"when the calendar is not Gregorian", ^{
            __block NSCalendar *jaCalendar;
            beforeEach(^{
                // +currentCalendar overwrite NSCalendarIdentifierJapanese.
                jaCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierJapanese];
                [NSDate stub:@selector(AZ_currentCalendar) andReturn:jaCalendar];
            });
            context(@"simple compere", ^{
                __block NSDate *currentDate;
                __block NSDate *expectedDate;
                beforeEach(^{
                    expectedDate = [NSDate AZ_dateByUnit:@{
                        AZ_DateUnit.year : @2010,
                        AZ_DateUnit.month : @10,
                        AZ_DateUnit.day : @10,
                    }];

                    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
                    dateComponents.year = 22;
                    dateComponents.month = 10;
                    dateComponents.day = 10;
                    currentDate = [jaCalendar dateFromComponents:dateComponents];
                });
                it(@"should return 22", ^{
                    NSInteger yearValue = [currentDate year];
                    [[theValue(yearValue) should] equal:theValue(22)];
                });
                it(@"the date equal to 2010-10-10", ^{
                    [[currentDate should] equal:expectedDate];
                });
            });
            context(@"when Shouwa era", ^{
                __block NSDate *currentDate;
                beforeEach(^{
                    currentDate = [NSDate AZ_dateByUnit:@{
                        AZ_DateUnit.year : @1988,
                        AZ_DateUnit.month : @10,
                        AZ_DateUnit.day : @10,
                    }];
                });
                it(@"should return 63", ^{
                    NSInteger yearValue = [currentDate year];
                    [[theValue(yearValue) should] equal:theValue(63)];
                });
            });
        });
    });

    describe(@"-gregorianYear", ^{
        context(@"when the date 2010-10-10", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                }];
            });
            it(@"should return 2010", ^{
                NSInteger yearValue = [currentDate year];

                NSCalendar *c = [NSCalendar currentCalendar];
                if ([c.calendarIdentifier isEqualToString:NSCalendarIdentifierGregorian]) {
                    [[theValue(yearValue) should] equal:theValue(2010)];
                } else if ([c.calendarIdentifier isEqualToString:NSCalendarIdentifierJapanese]) {
                    [[theValue(yearValue) should] equal:theValue(22)];
                } else {
                    [[theValue(yearValue) shouldNot] equal:theValue(2010)];
                    [[theValue(yearValue) shouldNot] equal:theValue(22)];
                }
            });
        });
        context(@"when the date'calendar is not Gregorian", ^{
            __block NSDate *currentDate;
            __block NSDate *expectedDate;
            beforeEach(^{
                expectedDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                }];

                NSCalendar *jaCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierJapanese];
                NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
                dateComponents.year = 1;
                dateComponents.month = 10;
                dateComponents.day = 10;
                currentDate = [jaCalendar dateFromComponents:dateComponents];
                // +currentCalendar overwrite NSCalendarIdentifierJapanese.
                [NSDate stub:@selector(AZ_currentCalendar) andReturn:jaCalendar];
            });
            it(@"should return 1989", ^{
                NSInteger yearValue = [currentDate gregorianYear];
                [[theValue(yearValue) should] equal:theValue(1989)];
            });
            it(@"the date equal to 2010-10-10", ^{
                [[theValue(currentDate) shouldNot] equal:expectedDate];
            });
        });
    });

SPEC_END
