#import "Kiwi.h"
#import "NSDate+Escort.h"
#import "NSDate+AZDateBuilder.h"
#import "FakeDateUtil.h"

@interface NSDate (EscortMock)
+ (NSCalendar *)AZ_currentCalendar;
@end

SPEC_BEGIN(EscortDateRoles)
    registerMatchers(@"AZ");// NSDate Custom Matcher
    describe(@"-isTypicallyWorkday", ^{
        __block NSDate *currentDate;
        beforeEach(^{
            currentDate = [NSDate AZ_dateByUnit:@{
                AZ_DateUnit.year : @2010,
                AZ_DateUnit.month : @10,
                AZ_DateUnit.day : @10,
            }];
            [FakeDateUtil stubCurrentDate:currentDate];
        });
        context(@"when Workday is first", ^{
            __block NSDate *firstDayOfWeek;
            beforeEach(^{
                firstDayOfWeek = [currentDate AZ_dateByUnit:@{
                    AZ_DateUnit.weekday : @1,
                }];
            });
            it(@"should be false", ^{
                BOOL match = [firstDayOfWeek isTypicallyWorkday];
                [[theValue(match) should] beNo];
            });
        });
        context(@"when Workday is last", ^{
            __block NSDate *lastDayOfWeek;
            beforeEach(^{
                lastDayOfWeek = [currentDate AZ_dateByUnit:@{
                    AZ_DateUnit.weekday : @7,
                }];
            });
            it(@"should be false", ^{
                BOOL match = [lastDayOfWeek isTypicallyWorkday];
                [[theValue(match) should] beNo];
            });
        });
        context(@"when Workday is typically workday", ^{
            __block NSRange weekdayRange;
            beforeEach(^{
                NSCalendar *calendar = [NSCalendar currentCalendar];
                weekdayRange = [calendar maximumRangeOfUnit:NSCalendarUnitWeekday];
            });
            it(@"should be true", ^{
                NSDate *checkDate;
                NSUInteger length = weekdayRange.location + weekdayRange.length - 1;
                for (NSUInteger weekday = weekdayRange.location + 1; weekday < length; weekday++) {
                    checkDate = [[currentDate AZ_dateByUnit:@{
                        AZ_DateUnit.weekday : @1,
                    }] dateByAddingDays:weekday - 1];
                    BOOL match = [checkDate isTypicallyWorkday];
                    [[theValue(match) should] beTrue];
                }
            });
        });
    });
    describe(@"-isTypicallyWeekend", ^{
        __block NSDate *currentDate;
        beforeEach(^{
            currentDate = [NSDate AZ_dateByUnit:@{
                AZ_DateUnit.year : @2010,
                AZ_DateUnit.month : @10,
                AZ_DateUnit.day : @10,
            }];
            [FakeDateUtil stubCurrentDate:currentDate];
        });
        context(@"when Weekday is first", ^{
            __block NSDate *firstDayOfWeek;
            beforeEach(^{
                firstDayOfWeek = [currentDate AZ_dateByUnit:@{
                    AZ_DateUnit.weekday : @1
                }];
            });
            it(@"should be true", ^{
                BOOL match = [firstDayOfWeek isTypicallyWeekend];
                [[theValue(match) should] beYes];
            });
        });
        context(@"when Weekday is last", ^{
            __block NSDate *lastDayOfWeek;
            beforeEach(^{
                lastDayOfWeek = [currentDate AZ_dateByUnit:@{
                    AZ_DateUnit.weekday : @7
                }];
            });
            it(@"should be true", ^{
                BOOL match = [lastDayOfWeek isTypicallyWeekend];
                [[theValue(match) should] beYes];
            });
        });
        context(@"when Weekday is typically workday", ^{
            __block NSRange weekdayRange;
            beforeEach(^{
                NSCalendar *calendar = [NSCalendar currentCalendar];
                weekdayRange = [calendar maximumRangeOfUnit:NSCalendarUnitWeekday];
            });
            it(@"should be true", ^{
                NSDate *checkDate;
                NSUInteger length = weekdayRange.location + weekdayRange.length - 1;
                for (NSUInteger weekday = weekdayRange.location + 1; weekday < length; weekday++) {
                    checkDate = [[currentDate AZ_dateByUnit:@{
                            AZ_DateUnit.weekday : @1,
                    }] dateByAddingDays:weekday - 1];
                    BOOL match = [checkDate isTypicallyWeekend];
                    [[theValue(match) should] beNo];
                }
            });
        });
    });
    SPEC_END
