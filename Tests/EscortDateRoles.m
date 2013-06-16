#import "Kiwi.h"
#import "NSDate+Escort.h"
#import "NSDate+AZDateBuilder.h"
#import "FakeDateUtil.h"

SPEC_BEGIN(EscortDateRoles)
    registerMatchers(@"AZ");// NSDate Custom Matcher
    describe(@"-isTypicallyWorkday", ^{
        __block NSDate *currentDate;
        beforeEach(^{
            currentDate = [NSDate dateByUnit:@{
                AZ_DateUnit.year : @2010,
                AZ_DateUnit.month : @10,
                AZ_DateUnit.day : @10,
            }];
            [FakeDateUtil stubCurrentDate:currentDate];
        });
        context(@"when Weekday is first", ^{
            __block NSDate *firstDayOfWeek;
            beforeEach(^{
                firstDayOfWeek = [currentDate dateByUnit:@{
                    AZ_DateUnit.day : @([currentDate firstDayOfWeekday])
                }];
            });
            it(@"should be false", ^{
                BOOL match = [firstDayOfWeek isTypicallyWorkday];
                [[theValue(match) should] beNo];
            });
        });
        context(@"when Weekday is last", ^{
            __block NSDate *lastDayOfWeek;
            beforeEach(^{
                lastDayOfWeek = [currentDate dateByUnit:@{
                    AZ_DateUnit.day : @([currentDate lastDayOfWeekday])
                }];
            });
            it(@"should be false", ^{
                BOOL match = [lastDayOfWeek isTypicallyWorkday];
                [[theValue(match) should] beNo];
            });
        });
        context(@"when Weekday is typically workday", ^{
            __block NSRange weekdayRange;
            beforeEach(^{
                NSCalendar *calendar = [NSCalendar currentCalendar];
                weekdayRange = [calendar maximumRangeOfUnit:NSWeekdayCalendarUnit];
            });
            it(@"should be true", ^{
                NSDate *checkDate;
                for (int weekday = weekdayRange.location; weekday++ < weekdayRange.length; weekday++) {
                    checkDate = [currentDate dateByUnit:@{
                        AZ_DateUnit.day : @([currentDate lastDayOfWeekday] + weekday)
                    }];
                    BOOL match = [checkDate isTypicallyWorkday];
                    [[theValue(match) should] beTrue];
                }
            });
        });
    });
    describe(@"-isTypicallyWorkday", ^{
        __block NSDate *currentDate;
        beforeEach(^{
            currentDate = [NSDate dateByUnit:@{
                AZ_DateUnit.year : @2010,
                AZ_DateUnit.month : @10,
                AZ_DateUnit.day : @10,
            }];
            [FakeDateUtil stubCurrentDate:currentDate];
        });
        context(@"when Weekday is first", ^{
            __block NSDate *firstDayOfWeek;
            beforeEach(^{
                firstDayOfWeek = [currentDate dateByUnit:@{
                    AZ_DateUnit.day : @([currentDate firstDayOfWeekday])
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
                lastDayOfWeek = [currentDate dateByUnit:@{
                    AZ_DateUnit.day : @([currentDate lastDayOfWeekday])
                }];
            });
            it(@"should be true", ^{
                BOOL match = [lastDayOfWeek isTypicallyWeekend];
                [[theValue(match) should] beYes];
            });
        });
        context(@"when Weekday is other", ^{
            __block NSRange weekdayRange;
            beforeEach(^{
                NSCalendar *calendar = [NSCalendar currentCalendar];
                weekdayRange = [calendar maximumRangeOfUnit:NSWeekdayCalendarUnit];
            });
            it(@"should be false", ^{
                NSDate *checkDate;
                for (int weekday = weekdayRange.location; weekday++ < weekdayRange.length; weekday++) {
                    checkDate = [currentDate dateByUnit:@{
                        AZ_DateUnit.day : @([currentDate lastDayOfWeekday] + weekday)
                    }];
                    BOOL match = [checkDate isTypicallyWeekend];
                    [[theValue(match) should] beNo];
                }
            });
        });
    });
    SPEC_END
