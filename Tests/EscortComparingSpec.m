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
        context(@"when target is today", ^{
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
        context(@"when target is a later day", ^{
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
        context(@"when target is a earler day", ^{
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
    describe(@"-isToday", ^{
        NSDate *currentDate = [NSDate date];
        beforeEach(^{
            [FakeDateUtil stubCurrentDate:currentDate];
        });
        context(@"when suject is same date", ^{
            it(@"should be true", ^{
                BOOL match = [currentDate isToday];
                [[theValue(match) should] beYes];
            });
        });
        context(@"when subject is a later day", ^{
            it(@"should be false", ^{
                NSDate *laterDate = [currentDate dateByUnit:@{
                    AZ_DateUnit.day : @([currentDate day] + 1),
                    AZ_DateUnit.hour : @0,
                    AZ_DateUnit.minute : @0,
                    AZ_DateUnit.second : @0,
                }];
                BOOL isMatch = [laterDate isToday];
                [[theValue(isMatch) should] beNo];
            });
        });
        context(@"when subject is a earler day", ^{
            it(@"should be false", ^{
                NSDate *laterDate = [currentDate dateByUnit:@{
                    AZ_DateUnit.day : @([currentDate day] - 1),
                    AZ_DateUnit.hour : @23,
                    AZ_DateUnit.minute : @59,
                    AZ_DateUnit.second : @59,
                }];
                BOOL isMatch = [laterDate isToday];
                [[theValue(isMatch) should] beNo];
            });
        });
    });
    describe(@"-isTomorrow", ^{
        NSDate *currentDate = [NSDate date];
        beforeEach(^{
            [FakeDateUtil stubCurrentDate:currentDate];
        });
        context(@"when suject is same date", ^{
            it(@"should be false", ^{
                BOOL match = [currentDate isTomorrow];
                [[theValue(match) should] beNo];
            });
        });
        context(@"when subject is a tomorrow", ^{
            it(@"should be true", ^{
                NSDate *laterDate = [currentDate dateByUnit:@{
                    AZ_DateUnit.day : @([currentDate day] + 1),
                    AZ_DateUnit.hour : @0,
                    AZ_DateUnit.minute : @0,
                    AZ_DateUnit.second : @0,
                }];
                BOOL isMatch = [laterDate isTomorrow];
                [[theValue(isMatch) should] beYes];
            });
        });
        context(@"when subject is 2day later", ^{
            it(@"should be false", ^{
                NSDate *laterDate = [currentDate dateByUnit:@{
                    AZ_DateUnit.day : @([currentDate day] + 2),
                    AZ_DateUnit.hour : @0,
                    AZ_DateUnit.minute : @0,
                    AZ_DateUnit.second : @0,
                }];
                BOOL isMatch = [laterDate isTomorrow];
                [[theValue(isMatch) should] beNo];
            });
        });
    });
    describe(@"-isYesterday", ^{
        NSDate *currentDate = [NSDate date];
        beforeEach(^{
            [FakeDateUtil stubCurrentDate:currentDate];
        });
        context(@"when suject is same date", ^{
            it(@"should be false", ^{
                BOOL match = [currentDate isYesterday];
                [[theValue(match) should] beNo];
            });
        });
        context(@"when subject is a yesterday", ^{
            it(@"should be true", ^{
                NSDate *laterDate = [currentDate dateByUnit:@{
                    AZ_DateUnit.day : @([currentDate day] - 1),
                    AZ_DateUnit.hour : @0,
                    AZ_DateUnit.minute : @0,
                    AZ_DateUnit.second : @0,
                }];
                BOOL isMatch = [laterDate isYesterday];
                [[theValue(isMatch) should] beYes];
            });
        });
        context(@"when subject is 2day ago", ^{
            it(@"should be false", ^{
                NSDate *laterDate = [currentDate dateByUnit:@{
                    AZ_DateUnit.day : @([currentDate day] - 2),
                    AZ_DateUnit.hour : @0,
                    AZ_DateUnit.minute : @0,
                    AZ_DateUnit.second : @0,
                }];
                BOOL isMatch = [laterDate isYesterday];
                [[theValue(isMatch) should] beNo];
            });
        });
    });
    describe(@"-isSameWeekAsDate", ^{
        __block NSDate *currentDate;
        beforeEach(^{
            currentDate = [NSDate dateByUnit:@{
                AZ_DateUnit.year : @2010,
                AZ_DateUnit.month : @10,
                AZ_DateUnit.day : @10,
            }];
            [FakeDateUtil stubCurrentDate:currentDate];
        });
        context(@"same week", ^{
            it(@"should be true", ^{
                BOOL match = [currentDate isSameWeekAsDate:currentDate];
                [[theValue(match) should] beYes];
            });
        });
        context(@"withink this week", ^{
            context(@"firstOfWeek", ^{
                it(@"should be true", ^{
                    // weekday 1...7
                    NSDate *firstOfWeek = [currentDate dateByUnit:@{
                        AZ_DateUnit.day : @([currentDate firstDayOfWeekday])
                    }];
                    BOOL match_first = [firstOfWeek isSameWeekAsDate:currentDate];
                    [[theValue(match_first) should] beYes];
                });
            });
            context(@"endOfWeek", ^{
                it(@"should be true", ^{
                    NSDate *lastOfWeek = [currentDate dateByUnit:@{
                        AZ_DateUnit.day : @([currentDate lastDayOfWeekday])
                    }];
                    BOOL match_last = [lastOfWeek isSameWeekAsDate:currentDate];
                    [[theValue(match_last) should] beYes];
                });
            });
        });
        context(@"when same the week, but difference year", ^{
            it(@"should be false", ^{
                NSDate *nextYearDate = [currentDate dateByUnit:@{
                    AZ_DateUnit.year : @([currentDate year] + 1),
                }];
                BOOL match = [nextYearDate isSameWeekAsDate:currentDate];
                [[theValue(match) should] beNo];
            });
        });
        context(@"next week", ^{
            __block NSDate *nextWeekDate;
            beforeEach(^{
                nextWeekDate = [currentDate dateByAddingDays:DAYS_IN_WEEK];
            });
            it(@"should be false", ^{
                BOOL match = [nextWeekDate isSameWeekAsDate:currentDate];
                [[theValue(match) should] beNo];
            });
        });
        context(@"last week", ^{
            __block NSDate *prevWeekDate;
            beforeEach(^{
                prevWeekDate = [currentDate dateBySubtractingDays:DAYS_IN_WEEK];
            });
            it(@"should be false", ^{
                BOOL match = [prevWeekDate isSameWeekAsDate:currentDate];
                [[theValue(match) should] beNo];
            });
        });
    });
    describe(@"-isThisWeek", ^{
        __block NSDate *currentDate;
        beforeEach(^{
            currentDate = [NSDate dateByUnit:@{
                AZ_DateUnit.year : @2010,
                AZ_DateUnit.month : @10,
                AZ_DateUnit.day : @10,
            }];
            [FakeDateUtil stubCurrentDate:currentDate];
        });
        context(@"same week", ^{
            it(@"should be true", ^{
                BOOL match = [currentDate isThisWeek];
                [[theValue(match) should] beYes];
            });
        });
        context(@"within this week", ^{
            context(@"firstOfWeek", ^{
                it(@"should be true", ^{
                    // weekday 1...7
                    NSDate *firstOfWeek = [currentDate dateByUnit:@{
                        AZ_DateUnit.day : @([currentDate firstDayOfWeekday])
                    }];
                    BOOL match_first = [firstOfWeek isThisWeek];
                    [[theValue(match_first) should] beYes];
                });
            });
            context(@"endOfWeek", ^{
                it(@"should be true", ^{
                    NSDate *lastOfWeek = [currentDate dateByUnit:@{
                        AZ_DateUnit.day : @([currentDate lastDayOfWeekday])
                    }];
                    BOOL match_last = [lastOfWeek isThisWeek];
                    [[theValue(match_last) should] beYes];
                });
            });
        });
        context(@"next week", ^{
            __block NSDate *nextWeekDate;
            beforeEach(^{
                nextWeekDate = [currentDate dateByAddingDays:DAYS_IN_WEEK];
            });
            it(@"should be false", ^{
                BOOL match = [nextWeekDate isThisWeek];
                [[theValue(match) should] beNo];
            });
        });
        context(@"last week", ^{
            __block NSDate *prevWeekDate;
            beforeEach(^{
                prevWeekDate = [currentDate dateBySubtractingDays:DAYS_IN_WEEK];
            });
            it(@"should be false", ^{
                BOOL match = [prevWeekDate isThisWeek];
                [[theValue(match) should] beNo];
            });
        });
    });
    describe(@"-isNextWeek", ^{
        __block NSDate *currentDate;
        beforeEach(^{
            currentDate = [NSDate dateByUnit:@{
                AZ_DateUnit.year : @2010,
                AZ_DateUnit.month : @10,
                AZ_DateUnit.day : @10,
            }];
            [FakeDateUtil stubCurrentDate:currentDate];
        });
        context(@"within this week", ^{
            context(@"at endOfWeek", ^{
                it(@"should be false", ^{
                    NSDate *endOfWeek = [currentDate dateByUnit:@{
                        AZ_DateUnit.day : @([currentDate lastDayOfWeekday])
                    }];
                    BOOL match = [endOfWeek isNextWeek];
                    [[theValue(match) should] beNo];
                });
            });
        });
        context(@"next week", ^{
            __block NSDate *nextWeekDate;
            beforeEach(^{
                nextWeekDate = [currentDate dateByAddingDays:DAYS_IN_WEEK];
            });
            it(@"should be true", ^{
                BOOL match = [nextWeekDate isNextWeek];
                [[theValue(match) should] beYes];
            });
        });
        context(@"two weeks later", ^{
            __block NSDate *nextWeekDate;
            beforeEach(^{
                nextWeekDate = [currentDate dateByAddingDays:DAYS_IN_WEEK * 2];
            });
            it(@"should be false", ^{
                BOOL match = [nextWeekDate isNextWeek];
                [[theValue(match) should] beNo];
            });
        });
    });
    describe(@"-isLastWeek", ^{
        __block NSDate *currentDate;
        beforeEach(^{
            currentDate = [NSDate dateByUnit:@{
                AZ_DateUnit.year : @2010,
                AZ_DateUnit.month : @10,
                AZ_DateUnit.day : @9,
            }];
            [FakeDateUtil stubCurrentDate:currentDate];
        });
        context(@"within this week", ^{
            context(@"at startOfWeek", ^{
                it(@"should be false", ^{
                    NSDate *lastOfWeek = [currentDate dateByUnit:@{
                        AZ_DateUnit.day : @([currentDate firstDayOfWeekday])
                    }];
                    BOOL match = [lastOfWeek isLastWeek];
                    [[theValue(match) should] beNo];
                });
            });
        });
        context(@"when last week", ^{
            __block NSDate *prevWeekDate;
            beforeEach(^{
                prevWeekDate = [currentDate dateBySubtractingDays:DAYS_IN_WEEK];
            });
            it(@"should be true", ^{
                BOOL match = [prevWeekDate isLastWeek];
                [[theValue(match) should] beYes];
            });
        });
        context(@"when two weeks ago", ^{
            __block NSDate *prevWeekDate;
            beforeEach(^{
                prevWeekDate = [currentDate dateBySubtractingDays:DAYS_IN_WEEK * 2];
            });
            it(@"should be false", ^{
                BOOL match = [prevWeekDate isLastWeek];
                [[theValue(match) should] beNo];
            });
        });
    });
    describe(@"-isSameMonthAsDate", ^{
        __block NSDate *currentDate;
        beforeEach(^{
            currentDate = [NSDate dateByUnit:@{
                AZ_DateUnit.year : @2010,
                AZ_DateUnit.month : @10,
                AZ_DateUnit.day : @10,
            }];
            [FakeDateUtil stubCurrentDate:currentDate];
        });
        context(@"within this month", ^{
            context(@"at start of month", ^{
                it(@"should be yes", ^{
                    NSDate *startOfMonth = [currentDate dateAtStartOfMonth];
                    BOOL match = [currentDate isSameMonthAsDate:startOfMonth];
                    [[theValue(match) should] beYes];
                });
            });
            context(@"at end of month", ^{
                it(@"should be yes", ^{
                    NSDate *endOfMonth = [currentDate dateAtEndOfMonth];
                    BOOL match = [currentDate isSameMonthAsDate:endOfMonth];
                    [[theValue(match) should] beYes];
                });
            });
        });
        context(@"next month", ^{
            __block NSDate *nextMonth;
            beforeEach(^{
                NSCalendar *calendar = [NSCalendar currentCalendar];
                NSDateComponents *oneMonthComponents = [[NSDateComponents alloc] init];
                oneMonthComponents.month = 1;
                nextMonth = [calendar dateByAddingComponents:oneMonthComponents toDate:currentDate options:0];
            });
            it(@"should be false", ^{
                BOOL match = [currentDate isSameMonthAsDate:nextMonth];
                [[theValue(match) should] beNo];
            });
        });
        context(@"last month", ^{
            __block NSDate *lastMonth;
            beforeEach(^{
                NSCalendar *calendar = [NSCalendar currentCalendar];
                NSDateComponents *oneMonthComponents = [[NSDateComponents alloc] init];
                oneMonthComponents.month = -1;
                lastMonth = [calendar dateByAddingComponents:oneMonthComponents toDate:currentDate options:0];
            });
            it(@"should be false", ^{
                BOOL match = [currentDate isSameMonthAsDate:lastMonth];
                [[theValue(match) should] beNo];
            });
        });
        context(@"next year", ^{
            __block NSDate *nextYear;
            beforeEach(^{
                NSCalendar *calendar = [NSCalendar currentCalendar];
                NSDateComponents *oneMonthComponents = [[NSDateComponents alloc] init];
                oneMonthComponents.year = 1;
                nextYear = [calendar dateByAddingComponents:oneMonthComponents toDate:currentDate options:0];
            });
            it(@"should be false", ^{
                BOOL match = [currentDate isSameMonthAsDate:nextYear];
                [[theValue(match) should] beNo];
            });
        });
    });
    describe(@"-isThisMonth", ^{

    });
    SPEC_END
