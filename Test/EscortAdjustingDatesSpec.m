#import "NLTQuickCheck/NLTQTestable.h"
#import "NLTQuickCheck/NSNumber+Arbitrary.h"
#import "Kiwi.h"
#import "NSDate+Escort.h"
#import "NSDate+AZDateBuilder.h"
#import "FakeDateUtil.h"
#import "AZNSDateKiwiMatcher.h"
#import "AZNLTQuickCheckKiwiMatcher.h"

@interface NSDate (EscortMock)
+ (NSCalendar *)AZ_currentCalendar;
@end

SPEC_BEGIN(EscortAdjustingDates)
    registerMatchers(@"AZ");// NSDate Custom Matcher

    describe(@"-dateByAddingYears", ^{
        context(@"when the date is 2010-10-10", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                }];
            });
            context(@"adding 0 year", ^{
                __block NSDate *subject;
                beforeEach(^{
                    subject = [currentDate dateByAddingYears:0];
                });
                it(@"should return 2010-10-10", ^{
                    [[subject should] equalToDateIgnoringTime:currentDate];
                });
            });
            context(@"adding 1 year", ^{
                __block NSDate *subject;
                beforeEach(^{
                    subject = [currentDate dateByAddingYears:1];
                });
                it(@"should return 2011-10-10", ^{
                    NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                        AZ_DateUnit.year : @2011,
                        AZ_DateUnit.month : @10,
                        AZ_DateUnit.day : @10,
                    }];
                    [[subject should] equalToDateIgnoringTime:expectDate];
                });
            });
            context(@"adding -1 year", ^{
                __block NSDate *subject;
                beforeEach(^{
                    subject = [currentDate dateByAddingYears:-1];
                });
                it(@"should return 2009-10-10", ^{
                    NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                        AZ_DateUnit.year : @2009,
                        AZ_DateUnit.month : @10,
                        AZ_DateUnit.day : @10,
                    }];
                    [[subject should] equalToDateIgnoringTime:expectDate];
                });
            });
            context(@"quickcheck", ^{
                it(@"should be success", ^{
                    NSCalendar *calendar = [NSCalendar currentCalendar];
                    NLTQTestable *testable = [NLTQTestable testableWithPropertyBlockArguments1:^BOOL(id argA) {
                        NSDate *resultDate = [currentDate dateByAddingYears:[argA integerValue]];
                        NSDateComponents *diffComponents = [calendar components:NSCalendarUnitYear fromDate:currentDate toDate:resultDate options:0];
                        return [diffComponents year] == [argA integerValue];
                    } arbitrary:[NSNumber intArbitrary]];
                    [testable check];
                    [[testable should] beSuccess];
                });
            });
        });
    });

    describe(@"-dateBySubtractingYears", ^{
        context(@"when the date is 2010-10-10", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                }];
            });
            context(@"quickcheck", ^{
                it(@"should be success", ^{
                    NSCalendar *calendar = [NSCalendar currentCalendar];
                    NLTQTestable *testable = [NLTQTestable testableWithPropertyBlockArguments1:^BOOL(id argA) {
                        NSDate *resultDate = [currentDate dateBySubtractingYears:[argA integerValue]];
                        NSDateComponents *diffComponents = [calendar components:NSCalendarUnitYear fromDate:resultDate toDate:currentDate options:0];
                        return [diffComponents year] == [argA integerValue];
                    } arbitrary:[NSNumber intArbitrary]];
                    [testable check];
                    [[testable should] beSuccess];
                });
            });
        });
    });

    describe(@"-dateByAddingMonths", ^{
        context(@"when the date is 2010-10-10", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                }];
            });
            context(@"adding 0 month", ^{
                __block NSDate *subject;
                beforeEach(^{
                    subject = [currentDate dateByAddingMonths:0];
                });
                it(@"should return 2010-10-10", ^{
                    [[subject should] equalToDateIgnoringTime:currentDate];
                });
            });
            context(@"adding 1 month", ^{
                __block NSDate *subject;
                beforeEach(^{
                    subject = [currentDate dateByAddingMonths:1];
                });
                it(@"should return 2010-11-10", ^{
                    NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                        AZ_DateUnit.year : @2010,
                        AZ_DateUnit.month : @11,
                        AZ_DateUnit.day : @10,
                    }];
                    [[subject should] equalToDateIgnoringTime:expectDate];
                });
            });
            context(@"adding -1 month", ^{
                __block NSDate *subject;
                beforeEach(^{
                    subject = [currentDate dateByAddingMonths:-1];
                });
                it(@"should return 2010-09-10", ^{
                    NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                        AZ_DateUnit.year : @2010,
                        AZ_DateUnit.month : @9,
                        AZ_DateUnit.day : @10,
                    }];
                    [[subject should] equalToDateIgnoringTime:expectDate];
                });
            });
            context(@"quickcheck", ^{
                it(@"should be success", ^{
                    NSCalendar *calendar = [NSCalendar currentCalendar];
                    NLTQTestable *testable = [NLTQTestable testableWithPropertyBlockArguments1:^BOOL(id argA) {
                        NSDate *resultDate = [currentDate dateByAddingMonths:[argA integerValue]];
                        NSDateComponents *diffComponents = [calendar components:NSCalendarUnitMonth fromDate:currentDate toDate:resultDate options:0];
                        return [diffComponents month] == [argA integerValue];
                    } arbitrary:[NSNumber intArbitrary]];
                    [testable check];
                    [[testable should] beSuccess];
                });
            });
        });
    });
    describe(@"-dateBySubtractingMonth", ^{
        context(@"when the date is 2010-10-10", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                }];
            });
            context(@"quickcheck", ^{
                it(@"should be success", ^{
                    NSCalendar *calendar = [NSCalendar currentCalendar];
                    NLTQTestable *testable = [NLTQTestable testableWithPropertyBlockArguments1:^BOOL(id argA) {
                        NSDate *resultDate = [currentDate dateBySubtractingMonths:[argA integerValue]];
                        NSDateComponents *diffComponents = [calendar components:NSCalendarUnitMonth fromDate:resultDate toDate:currentDate options:0];
                        return [diffComponents month] == [argA integerValue];
                    } arbitrary:[NSNumber intArbitrary]];
                    [testable check];
                    [[testable should] beSuccess];
                });
            });
        });
    });

    describe(@"-dateByAddingDays", ^{
        context(@"when the date is 2010-10-10", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                }];
            });
            context(@"adding 0 Day", ^{
                __block NSDate *subject;
                beforeEach(^{
                    subject = [currentDate dateByAddingDays:0];
                });
                it(@"should return 2010-10-10", ^{
                    [[subject should] equalToDateIgnoringTime:currentDate];
                });
            });
            context(@"adding 1 Day", ^{
                __block NSDate *subject;
                beforeEach(^{
                    subject = [currentDate dateByAddingDays:1];
                });
                it(@"should return 2010-10-11", ^{
                    NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                        AZ_DateUnit.year : @2010,
                        AZ_DateUnit.month : @10,
                        AZ_DateUnit.day : @11,
                    }];
                    [[subject should] equalToDateIgnoringTime:expectDate];
                });
            });
            context(@"adding -1 Day", ^{
                __block NSDate *subject;
                beforeEach(^{
                    subject = [currentDate dateByAddingDays:-1];
                });
                it(@"should return 2010-10-09", ^{
                    NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                        AZ_DateUnit.year : @2010,
                        AZ_DateUnit.month : @10,
                        AZ_DateUnit.day : @9,
                    }];
                    [[subject should] equalToDateIgnoringTime:expectDate];
                });
            });
            context(@"quickcheck", ^{
                it(@"should be success", ^{
                    NSCalendar *calendar = [NSCalendar currentCalendar];
                    NLTQTestable *testable = [NLTQTestable testableWithPropertyBlockArguments1:^BOOL(id argA) {
                        NSDate *addingDays = [currentDate dateByAddingDays:[argA integerValue]];
                        NSDateComponents *diffComponents = [calendar components:NSCalendarUnitDay fromDate:currentDate toDate:addingDays options:0];
                        return [diffComponents day] == [argA integerValue];
                    } arbitrary:[NSNumber intArbitrary]];
                    [testable check];
                    [[testable should] beSuccess];
                });
            });
        });
    });
    describe(@"-dateBySubtractingDays", ^{
        context(@"when the date is 2010-10-10", ^{
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
            context(@"before 0 Day", ^{
                __block NSDate *subject;
                beforeEach(^{
                    subject = [currentDate dateBySubtractingDays:0];
                });
                it(@"should return 2010-10-10", ^{
                    [[subject should] equal:currentDate];
                });
            });
            context(@"before 1 Day", ^{
                __block NSDate *subject;
                beforeEach(^{
                    subject = [currentDate dateBySubtractingDays:1];
                });
                it(@"should return 2010-10-09", ^{
                    NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                        AZ_DateUnit.year : @2010,
                        AZ_DateUnit.month : @10,
                        AZ_DateUnit.day : @9,
                    }];
                    [[subject should] equalToDateIgnoringTime:expectDate];
                });
            });
            context(@"before -1 Day", ^{
                __block NSDate *subject;
                beforeEach(^{
                    subject = [currentDate dateBySubtractingDays:-1];
                });
                it(@"should return 2010-10-11", ^{
                    NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                        AZ_DateUnit.year : @2010,
                        AZ_DateUnit.month : @10,
                        AZ_DateUnit.day : @11,
                    }];
                    [[subject should] equalToDateIgnoringTime:expectDate];
                });
            });
            context(@"quickcheck", ^{
                it(@"should be success", ^{
                    NSCalendar *calendar = [NSCalendar currentCalendar];
                    NLTQTestable *testable = [NLTQTestable testableWithPropertyBlockArguments1:^BOOL(id argA) {
                        NSDate *resultDate = [currentDate dateBySubtractingDays:[argA integerValue]];
                        NSDateComponents *diffComponents = [calendar components:NSCalendarUnitDay fromDate:resultDate toDate:currentDate options:0];
                        return [diffComponents day] == [argA integerValue];
                    } arbitrary:[NSNumber intArbitrary]];
                    [testable check];
                    [[testable should] beSuccess];
                });
            });
        });
    });
    describe(@"-dateByAddingHours", ^{
        context(@"when the date is 2010-10-10 10:10:10", ^{
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
            context(@"adding 0 hour", ^{
                __block NSDate *subject;
                beforeEach(^{
                    subject = [currentDate dateByAddingHours:0];
                });
                it(@"should return same date", ^{
                    [[subject should] equal:currentDate];
                });
            });
            context(@"adding 1 hour", ^{
                __block NSDate *dateWithDaysBeforeNow;
                beforeEach(^{
                    dateWithDaysBeforeNow = [currentDate dateByAddingHours:1];
                });
                it(@"should return 2010-10-10 10:11:10", ^{
                    NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                        AZ_DateUnit.year : @2010,
                        AZ_DateUnit.month : @10,
                        AZ_DateUnit.day : @10,
                        AZ_DateUnit.hour : @11,
                        AZ_DateUnit.minute : @10,
                        AZ_DateUnit.second : @10,
                    }];
                    [[dateWithDaysBeforeNow should] equal:expectDate];
                });
            });
            context(@"adding 24 hour", ^{
                __block NSDate *subject;
                beforeEach(^{
                    subject = [currentDate dateByAddingHours:24];
                });
                it(@"should return 2010-10-11 10:10:10", ^{
                    NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                        AZ_DateUnit.year : @2010,
                        AZ_DateUnit.month : @10,
                        AZ_DateUnit.day : @11,
                        AZ_DateUnit.hour : @10,
                        AZ_DateUnit.minute : @10,
                        AZ_DateUnit.second : @10,
                    }];
                    [[subject should] equal:expectDate];
                });
            });
            context(@"adding -1 hour", ^{
                __block NSDate *subject;
                beforeEach(^{
                    subject = [currentDate dateByAddingHours:-1];
                });
                it(@"should return 2010-10-10 09:10:10", ^{
                    NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                        AZ_DateUnit.year : @2010,
                        AZ_DateUnit.month : @10,
                        AZ_DateUnit.day : @10,
                        AZ_DateUnit.hour : @9,
                        AZ_DateUnit.minute : @10,
                        AZ_DateUnit.second : @10,
                    }];
                    [[subject should] equal:expectDate];
                });
            });
            context(@"quickcheck", ^{
                it(@"should be success", ^{
                    NSCalendar *calendar = [NSCalendar currentCalendar];
                    NLTQTestable *testable = [NLTQTestable testableWithPropertyBlockArguments1:^BOOL(id argA) {
                        NSDate *subtractingDays = [currentDate dateByAddingHours:[argA integerValue]];
                        NSDateComponents *diffComponents = [calendar components:NSCalendarUnitHour fromDate:currentDate toDate:subtractingDays options:0];
                        return [diffComponents hour] == [argA integerValue];
                    } arbitrary:[NSNumber intArbitrary]];
                    [testable check];
                    [[testable should] beSuccess];
                });
            });
        });
    });
    describe(@"-dateBySubtractingHours", ^{
        context(@"when the date is 2010-10-10 10:10:10", ^{
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
            context(@"subtract 0 hour", ^{
                __block NSDate *subject;
                beforeEach(^{
                    subject = [currentDate dateBySubtractingHours:0];
                });
                it(@"should return same date", ^{
                    [[subject should] equal:currentDate];
                });
            });
            context(@"subtract 1 hour", ^{
                __block NSDate *subject;
                beforeEach(^{
                    subject = [currentDate dateBySubtractingHours:1];
                });
                it(@"should return 2010-10-10 10:09:10", ^{
                    NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                        AZ_DateUnit.year : @2010,
                        AZ_DateUnit.month : @10,
                        AZ_DateUnit.day : @10,
                        AZ_DateUnit.hour : @9,
                        AZ_DateUnit.minute : @10,
                        AZ_DateUnit.second : @10,
                    }];
                    [[subject should] equal:expectDate];
                });
            });
            context(@"subtract 24 hour", ^{
                __block NSDate *subject;
                beforeEach(^{
                    subject = [currentDate dateBySubtractingHours:24];
                });
                it(@"should return 2010-10-09 10:10:10", ^{
                    NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                        AZ_DateUnit.year : @2010,
                        AZ_DateUnit.month : @10,
                        AZ_DateUnit.day : @9,
                        AZ_DateUnit.hour : @10,
                        AZ_DateUnit.minute : @10,
                        AZ_DateUnit.second : @10,
                    }];
                    [[subject should] equal:expectDate];
                });
            });
            context(@"subtract -1 hour", ^{
                __block NSDate *subject;
                beforeEach(^{
                    subject = [currentDate dateBySubtractingHours:-1];
                });
                it(@"should return 2010-10-10 11:10:10", ^{
                    NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                        AZ_DateUnit.year : @2010,
                        AZ_DateUnit.month : @10,
                        AZ_DateUnit.day : @10,
                        AZ_DateUnit.hour : @11,
                        AZ_DateUnit.minute : @10,
                        AZ_DateUnit.second : @10,
                    }];
                    [[subject should] equal:expectDate];
                });
            });
            context(@"quickcheck", ^{
                it(@"should be success", ^{
                    NSCalendar *calendar = [NSCalendar currentCalendar];
                    NLTQTestable *testable = [NLTQTestable testableWithPropertyBlockArguments1:^BOOL(id argA) {
                        NSDate *resultDate = [currentDate dateBySubtractingHours:[argA integerValue]];
                        NSDateComponents *diffComponents = [calendar components:NSCalendarUnitHour fromDate:resultDate toDate:currentDate options:0];
                        return [diffComponents hour] == [argA integerValue];
                    } arbitrary:[NSNumber intArbitrary]];
                    [testable check];
                    [[testable should] beSuccess];
                });
            });
        });
    });

    describe(@"-dateByAddingMinutes", ^{
        context(@"when the date is 2010-10-10 10:10:10", ^{
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
            context(@"adding 0 minute", ^{
                __block NSDate *subject;
                beforeEach(^{
                    subject = [currentDate dateByAddingMinutes:0];
                });
                it(@"should return same date", ^{
                    [[subject should] equal:currentDate];
                });
            });
            context(@"adding 1 minute", ^{
                __block NSDate *subject;
                beforeEach(^{
                    subject = [currentDate dateByAddingMinutes:1];
                });
                it(@"should return 2010-10-10 10:11:10", ^{
                    NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                        AZ_DateUnit.year : @2010,
                        AZ_DateUnit.month : @10,
                        AZ_DateUnit.day : @10,
                        AZ_DateUnit.hour : @10,
                        AZ_DateUnit.minute : @11,
                        AZ_DateUnit.second : @10,
                    }];
                    [[subject should] equal:expectDate];
                });
            });
            context(@"adding 60 minute", ^{
                __block NSDate *subject;
                beforeEach(^{
                    subject = [currentDate dateByAddingMinutes:60];
                });
                it(@"should return 2010-10-10 11:10:10", ^{
                    NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                        AZ_DateUnit.year : @2010,
                        AZ_DateUnit.month : @10,
                        AZ_DateUnit.day : @10,
                        AZ_DateUnit.hour : @11,
                        AZ_DateUnit.minute : @10,
                        AZ_DateUnit.second : @10,
                    }];
                    [[subject should] equal:expectDate];
                });
            });
            context(@"adding -1 minute", ^{
                __block NSDate *subject;
                beforeEach(^{
                    subject = [currentDate dateByAddingMinutes:-1];
                });
                it(@"should return 2010-10-10 10:09:10", ^{
                    NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                        AZ_DateUnit.year : @2010,
                        AZ_DateUnit.month : @10,
                        AZ_DateUnit.day : @10,
                        AZ_DateUnit.hour : @10,
                        AZ_DateUnit.minute : @9,
                        AZ_DateUnit.second : @10,
                    }];
                    [[subject should] equal:expectDate];
                });
            });
        });
    });

    describe(@"-dateBySubtractingMinutes", ^{
        context(@"when the date is 2010-10-10 10:10:10", ^{
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
            context(@"subtract 0 minute", ^{
                __block NSDate *subject;
                beforeEach(^{
                    subject = [currentDate dateBySubtractingMinutes:0];
                });
                it(@"should return same date", ^{
                    [[subject should] equal:currentDate];
                });
            });
            context(@"subtract 1 minute", ^{
                __block NSDate *subject;
                beforeEach(^{
                    subject = [currentDate dateBySubtractingMinutes:1];
                });
                it(@"should return 2010-10-10 10:09:10", ^{
                    NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                        AZ_DateUnit.year : @2010,
                        AZ_DateUnit.month : @10,
                        AZ_DateUnit.day : @10,
                        AZ_DateUnit.hour : @10,
                        AZ_DateUnit.minute : @9,
                        AZ_DateUnit.second : @10,
                    }];
                    [[subject should] equal:expectDate];
                });
            });
            context(@"subtract 60 minute", ^{
                __block NSDate *subject;
                beforeEach(^{
                    subject = [currentDate dateBySubtractingMinutes:60];
                });
                it(@"should return 2010-10-10 09:10:10", ^{
                    NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                        AZ_DateUnit.year : @2010,
                        AZ_DateUnit.month : @10,
                        AZ_DateUnit.day : @10,
                        AZ_DateUnit.hour : @9,
                        AZ_DateUnit.minute : @10,
                        AZ_DateUnit.second : @10,
                    }];
                    [[subject should] equal:expectDate];
                });
            });
            context(@"subtract -1 minute", ^{
                __block NSDate *subject;
                beforeEach(^{
                    subject = [currentDate dateBySubtractingMinutes:-1];
                });
                it(@"should return 2010-10-10 11:11:10", ^{
                    NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                        AZ_DateUnit.year : @2010,
                        AZ_DateUnit.month : @10,
                        AZ_DateUnit.day : @10,
                        AZ_DateUnit.hour : @10,
                        AZ_DateUnit.minute : @11,
                        AZ_DateUnit.second : @10,
                    }];
                    [[subject should] equal:expectDate];
                });
            });
        });
    });

    describe(@"-dateByAddingSounds", ^{
        context(@"when the date is 2010-10-10 10:10:10", ^{
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
            context(@"adding 0 second", ^{
                __block NSDate *subject;
                beforeEach(^{
                    subject = [currentDate dateByAddingSeconds:0];
                });
                it(@"should return same date", ^{
                    [[subject should] equal:currentDate];
                });
            });
            context(@"adding 1 second", ^{
                __block NSDate *subject;
                beforeEach(^{
                    subject = [currentDate dateByAddingSeconds:1];
                });
                it(@"should return 2010-10-10 10:10:11", ^{
                    NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                        AZ_DateUnit.year : @2010,
                        AZ_DateUnit.month : @10,
                        AZ_DateUnit.day : @10,
                        AZ_DateUnit.hour : @10,
                        AZ_DateUnit.minute : @10,
                        AZ_DateUnit.second : @11,
                    }];
                    [[subject should] equal:expectDate];
                });
            });
            context(@"adding 60 seconds", ^{
                __block NSDate *subject;
                beforeEach(^{
                    subject = [currentDate dateByAddingSeconds:60];
                });
                it(@"should return 2010-10-10 10:11:10", ^{
                    NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                        AZ_DateUnit.year : @2010,
                        AZ_DateUnit.month : @10,
                        AZ_DateUnit.day : @10,
                        AZ_DateUnit.hour : @10,
                        AZ_DateUnit.minute : @11,
                        AZ_DateUnit.second : @10,
                    }];
                    [[subject should] equal:expectDate];
                });
            });
            context(@"adding -1 second", ^{
                __block NSDate *subject;
                beforeEach(^{
                    subject = [currentDate dateByAddingSeconds:-1];
                });
                it(@"should return 2010-10-10 10:11:10", ^{
                    NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                        AZ_DateUnit.year : @2010,
                        AZ_DateUnit.month : @10,
                        AZ_DateUnit.day : @10,
                        AZ_DateUnit.hour : @10,
                        AZ_DateUnit.minute : @10,
                        AZ_DateUnit.second : @9,
                    }];
                    [[subject should] equal:expectDate];
                });
            });
        });
    });
    describe(@"-dateBySubtractingSeconds", ^{
        context(@"when the date is 2010-10-10 10:10:10", ^{
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
            context(@"subtract 0 second", ^{
                __block NSDate *subject;
                beforeEach(^{
                    subject = [currentDate dateBySubtractingSeconds:0];
                });
                it(@"should return same date", ^{
                    [[subject should] equal:currentDate];
                });
            });
            context(@"subtract 1 second", ^{
                __block NSDate *subject;
                beforeEach(^{
                    subject = [currentDate dateBySubtractingSeconds:1];
                });
                it(@"should return 2010-10-10 10:10:09", ^{
                    NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                        AZ_DateUnit.year : @2010,
                        AZ_DateUnit.month : @10,
                        AZ_DateUnit.day : @10,
                        AZ_DateUnit.hour : @10,
                        AZ_DateUnit.minute : @10,
                        AZ_DateUnit.second : @9,
                    }];
                    [[subject should] equal:expectDate];
                });
            });
            context(@"subtract 60 seconds", ^{
                __block NSDate *subject;
                beforeEach(^{
                    subject = [currentDate dateBySubtractingSeconds:60];
                });
                it(@"should return 2010-10-10 10:09:10", ^{
                    NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                        AZ_DateUnit.year : @2010,
                        AZ_DateUnit.month : @10,
                        AZ_DateUnit.day : @10,
                        AZ_DateUnit.hour : @10,
                        AZ_DateUnit.minute : @9,
                        AZ_DateUnit.second : @10,
                    }];
                    [[subject should] equal:expectDate];
                });
            });
            context(@"subtract -1 second", ^{
                __block NSDate *subject;
                beforeEach(^{
                    subject = [currentDate dateBySubtractingSeconds:-1];
                });
                it(@"should return 2010-10-10 11:11:10", ^{
                    NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                        AZ_DateUnit.year : @2010,
                        AZ_DateUnit.month : @10,
                        AZ_DateUnit.day : @10,
                        AZ_DateUnit.hour : @10,
                        AZ_DateUnit.minute : @10,
                        AZ_DateUnit.second : @11,
                    }];
                    [[subject should] equal:expectDate];
                });
            });
        });
    });

    describe(@"-dateAtStartOfDay", ^{
        context(@"when the date is 2010-10-10 00:00:00", ^{
            __block NSDate *subject;
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                    AZ_DateUnit.hour : @0,
                    AZ_DateUnit.minute : @0,
                    AZ_DateUnit.second : @0,
                }];

                subject = [currentDate dateAtStartOfDay];
            });
            it(@"should return same date", ^{
                [[subject should] equal:currentDate];
            });
        });
        context(@"when the date is 2010-10-10 23:59:59", ^{
            __block NSDate *subject;
            beforeEach(^{
                NSDate *currentDate;
                currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                    AZ_DateUnit.hour : @23,
                    AZ_DateUnit.minute : @59,
                    AZ_DateUnit.second : @59,
                }];

                subject = [currentDate dateAtStartOfDay];
            });
            it(@"should return 2010-10-10 00:00:00", ^{
                NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                    AZ_DateUnit.hour : @0,
                    AZ_DateUnit.minute : @0,
                    AZ_DateUnit.second : @0,
                }];
                [[subject should] equal:expectDate];
            });
        });
        context(@"when default time zone is changed", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                    AZ_DateUnit.hour : @23,
                    AZ_DateUnit.minute : @59,
                    AZ_DateUnit.second : @59,
                }];
            });
            it(@"should return start of day in new time zone", ^{
                NSTimeZone *initialTimeZone = [NSTimeZone defaultTimeZone];
                NSTimeZone *newTimeZone = nil;
                
                BOOL isInitialTimeZoneGMT = ([initialTimeZone.abbreviation isEqualToString:@"GMT"]);
                if (!isInitialTimeZoneGMT) {
                    newTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
                } else {
                    newTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"PET"];
                }
                assert(initialTimeZone.secondsFromGMT != newTimeZone.secondsFromGMT);
                NSDate *date = [currentDate dateByAddingTimeInterval:[initialTimeZone secondsFromGMT] - [newTimeZone secondsFromGMT]];
                [NSTimeZone setDefaultTimeZone:newTimeZone];
                NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                    AZ_DateUnit.hour : @0,
                    AZ_DateUnit.minute : @0,
                    AZ_DateUnit.second : @0,
                }];
                [[[date dateAtStartOfDay] should] equal:expectDate];
                
                [NSTimeZone setDefaultTimeZone:initialTimeZone];
            });
        });
    });
    describe(@"-dateAtEndOfDay", ^{
        context(@"when the date is 2010-10-10 00:00:00", ^{
            __block NSDate *subject;
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                    AZ_DateUnit.hour : @0,
                    AZ_DateUnit.minute : @0,
                    AZ_DateUnit.second : @0,
                }];

                subject = [currentDate dateAtEndOfDay];
            });
            it(@"should return 2010-10-10 23:59:59", ^{
                NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                    AZ_DateUnit.hour : @23,
                    AZ_DateUnit.minute : @59,
                    AZ_DateUnit.second : @59,
                }];
                [[subject should] equal:expectDate];
            });
        });
        context(@"when the date is 2010-10-10 23:59:59", ^{
            __block NSDate *subject;
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                    AZ_DateUnit.hour : @23,
                    AZ_DateUnit.minute : @59,
                    AZ_DateUnit.second : @59,
                }];

                subject = [currentDate dateAtEndOfDay];
            });
            it(@"should return same date", ^{
                [[subject should] equal:currentDate];
            });
        });
        context(@"when default time zone is changed", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                    AZ_DateUnit.hour : @0,
                    AZ_DateUnit.minute : @0,
                    AZ_DateUnit.second : @0,
                }];
            });
            it(@"should return end of day in new time zone", ^{
                NSTimeZone *initialTimeZone = [NSTimeZone defaultTimeZone];
                NSTimeZone *newTimeZone = nil;
                
                BOOL isInitialTimeZoneGMT = ([initialTimeZone.abbreviation isEqualToString:@"GMT"]);
                if (!isInitialTimeZoneGMT) {
                    newTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
                } else {
                    newTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"PET"];
                }
                
                assert(initialTimeZone.secondsFromGMT != newTimeZone.secondsFromGMT);
                
                [NSTimeZone setDefaultTimeZone:newTimeZone];
                NSDate *date = [currentDate dateByAddingTimeInterval:[initialTimeZone secondsFromGMT] - [newTimeZone secondsFromGMT]];
                NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                    AZ_DateUnit.hour : @23,
                    AZ_DateUnit.minute : @59,
                    AZ_DateUnit.second : @59,
                }];
                [[[date dateAtEndOfDay] should] equal:expectDate];
                
                [NSTimeZone setDefaultTimeZone:initialTimeZone];
            });
        });
    });

    describe(@"-dateAtStartOfWeek", ^{
        context(@"When the date is 2014-03-04", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2014,
                    AZ_DateUnit.month : @3,
                    AZ_DateUnit.day : @4
                }];
            });

            context(@"begining of sunday for weekady", ^{
                beforeEach(^{
                    NSCalendar *beginingOfMondayCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
                    beginingOfMondayCalendar.firstWeekday = 1;
                    [NSDate stub:@selector(AZ_currentCalendar) andReturn:beginingOfMondayCalendar];
                });
                it(@"should return start of week date object", ^{
                    NSDate *subject = [currentDate dateAtStartOfWeek];
                    NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                        AZ_DateUnit.year : @2014,
                        AZ_DateUnit.month : @3,
                        AZ_DateUnit.day : @2
                    }];
                    [[subject should] beKindOfClass:[NSDate class]];
                    [[subject should] equalToDateIgnoringTime:expectDate];
                });
            });
            context(@"begining of monday for weekady", ^{
                beforeEach(^{
                    NSCalendar *beginingOfMondayCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
                    beginingOfMondayCalendar.firstWeekday = 2;
                    [NSDate stub:@selector(AZ_currentCalendar) andReturn:beginingOfMondayCalendar];
                });
                it(@"should return start of week date object", ^{
                    NSDate *subject = [currentDate dateAtStartOfWeek];
                    NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                        AZ_DateUnit.year : @2014,
                        AZ_DateUnit.month : @3,
                        AZ_DateUnit.day : @3
                    }];
                    [[subject should] beKindOfClass:[NSDate class]];
                    [[subject should] equalToDateIgnoringTime:expectDate];
                });
            });
        });
        context(@"When the date is 2014-03-01", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2014,
                    AZ_DateUnit.month : @3,
                    AZ_DateUnit.day : @1
                }];
            });

            context(@"begining of sunday for weekady", ^{
                beforeEach(^{
                    NSCalendar *beginingOfMondayCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
                    beginingOfMondayCalendar.firstWeekday = 1;
                    [NSDate stub:@selector(AZ_currentCalendar) andReturn:beginingOfMondayCalendar];
                });
                it(@"should return start of week date object", ^{

                    NSDate *subject = [currentDate dateAtStartOfWeek];
                    NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                        AZ_DateUnit.year : @2014,
                        AZ_DateUnit.month : @2,
                        AZ_DateUnit.day : @23
                    }];
                    [[subject should] beKindOfClass:[NSDate class]];
                    [[subject should] equalToDateIgnoringTime:expectDate];
                });
            });

            context(@"begining of monday for weekady", ^{
                beforeEach(^{
                    NSCalendar *beginingOfMondayCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
                    beginingOfMondayCalendar.firstWeekday = 2;
                    [NSDate stub:@selector(AZ_currentCalendar) andReturn:beginingOfMondayCalendar];
                });
                it(@"should return start of week date object", ^{

                    NSDate *subject = [currentDate dateAtStartOfWeek];
                    NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                        AZ_DateUnit.year : @2014,
                        AZ_DateUnit.month : @2,
                        AZ_DateUnit.day : @24
                    }];
                    [[subject should] beKindOfClass:[NSDate class]];
                    [[subject should] equalToDateIgnoringTime:expectDate];
                });
            });
        });
    });

    describe(@"-dateAtEndOfWeek", ^{
        context(@"When the date is 2014-03-04", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2014,
                    AZ_DateUnit.month : @3,
                    AZ_DateUnit.day : @4
                }];
            });
            it(@"should return end of week date object", ^{

                NSDate *subject = [currentDate dateAtEndOfWeek];
                NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2014,
                    AZ_DateUnit.month : @3,
                    AZ_DateUnit.day : @8
                }];
                [[subject should] beKindOfClass:[NSDate class]];
                [[subject should] equalToDateIgnoringTime:expectDate];
            });
        });
        context(@"When the date is 2014-02-25", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2014,
                    AZ_DateUnit.month : @2,
                    AZ_DateUnit.day : @25
                }];
            });
            it(@"should return end of week date object", ^{
                NSDate *subject = [currentDate dateAtEndOfWeek];
                NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2014,
                    AZ_DateUnit.month : @3,
                    AZ_DateUnit.day : @1
                }];
                [[subject should] beKindOfClass:[NSDate class]];
                [[subject should] equalToDateIgnoringTime:expectDate];
            });
        });
        context(@"When the date is 1989-01-06 and not Gregorian", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @1989,
                    AZ_DateUnit.month : @1,
                    AZ_DateUnit.day : @5
                }];

                NSCalendar *jaCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierJapanese];
                [NSDate stub:@selector(AZ_currentCalendar) andReturn:jaCalendar];
            });
            it(@"should return end of week date object", ^{
                NSDate *subject = [currentDate dateAtEndOfWeek];
                NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @1989,
                    AZ_DateUnit.month : @1,
                    AZ_DateUnit.day : @7
                }];
                [[subject should] beKindOfClass:[NSDate class]];
                [[subject should] equalToDateIgnoringTime:expectDate];
            });
        });
    });

    describe(@"-dateAtStartOfMonth", ^{
        context(@"when the date is 2010-10-10 00:00:00", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                }];
            });
            it(@"should return start of month date object", ^{
                // 2010-10-01
                NSDate *subject = [currentDate dateAtStartOfMonth];
                NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @1,
                }];
                [[subject should] beKindOfClass:[NSDate class]];
                [[subject should] equalToDateIgnoringTime:expectDate];
            });
        });
    });
    describe(@"-dateAtEndOfMonth", ^{
        context(@"when the date is 2010-10-10 00:00:00", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                }];
            });
            it(@"should return end of month date object", ^{
                // 2010-10-31
                NSDate *subject = [currentDate dateAtEndOfMonth];
                NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @31,
                }];
                [[subject should] beKindOfClass:[NSDate class]];
                [[subject should] equalToDateIgnoringTime:expectDate];
            });
        });
        // http://en.wikipedia.org/wiki/Leap_year
        context(@"when February @ leap year", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2000,// divisible 400 => leap year
                    AZ_DateUnit.month : @2,
                    AZ_DateUnit.day : @1,
                }];
            });
            it(@"should return 02-29", ^{
                NSDate *subject = [currentDate dateAtEndOfMonth];
                NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2000,
                    AZ_DateUnit.month : @2,
                    AZ_DateUnit.day : @29,
                }];
                [[subject should] equalToDateIgnoringTime:expectDate];
            });
        });
        // http://en.wikipedia.org/wiki/Leap_year
        context(@"when February @ not leap year", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                // not leap year
                currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2001,
                    AZ_DateUnit.month : @2,
                    AZ_DateUnit.day : @1,
                }];
            });
            it(@"should return 02-28", ^{
                NSDate *subject = [currentDate dateAtEndOfMonth];
                NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2001,
                    AZ_DateUnit.month : @2,
                    AZ_DateUnit.day : @28,
                }];
                [[subject should] equalToDateIgnoringTime:expectDate];
            });
        });
    });

    describe(@"-dateAtStartOfYear", ^{
        context(@"when the date is 2010-10-10", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                }];
            });
            it(@"should return start of year date object", ^{
                // 2010-01-01
                NSDate *subject = [currentDate dateAtStartOfYear];
                NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @1,
                    AZ_DateUnit.day : @1,
                }];
                [[subject should] beKindOfClass:[NSDate class]];
                [[subject should] equalToDateIgnoringTime:expectDate];
            });
        });
        context(@"when the date is 1989-01-06 and not Gregorian", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @1989,
                    AZ_DateUnit.month : @1,
                    AZ_DateUnit.day : @6
                }];

                NSCalendar *jaCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierJapanese];
                [NSDate stub:@selector(AZ_currentCalendar) andReturn:jaCalendar];
            });
            it(@"should return start of year date object", ^{
                NSDate *subject = [currentDate dateAtStartOfYear];
                NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @1989,
                    AZ_DateUnit.month : @1,
                    AZ_DateUnit.day : @1,
                }];
                [[subject should] beKindOfClass:[NSDate class]];
                [[subject should] equalToDateIgnoringTime:expectDate];
            });
        });
    });
    describe(@"-dateAtEndOfYear", ^{
        context(@"when the date is 2010-10-10", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                }];
            });
            it(@"should return end of year date object", ^{
                // 2010-12-31
                NSDate *subject = [currentDate dateAtEndOfYear];
                NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @12,
                    AZ_DateUnit.day : @31,
                }];
                [[subject should] beKindOfClass:[NSDate class]];
                [[subject should] equalToDateIgnoringTime:expectDate];
            });
        });
        context(@"when the date is 2010-2-10", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @2,
                    AZ_DateUnit.day : @10,
                }];
            });
            it(@"should return end of year date object", ^{
                // 2010-12-31
                NSDate *subject = [currentDate dateAtEndOfYear];
                NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @12,
                    AZ_DateUnit.day : @31,
                }];
                [[subject should] beKindOfClass:[NSDate class]];
                [[subject should] equalToDateIgnoringTime:expectDate];
            });
        });
        context(@"when the date is 1989-01-06 and not Gregorian", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @1989,
                    AZ_DateUnit.month : @1,
                    AZ_DateUnit.day : @6
                }];

                NSCalendar *jaCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierJapanese];
                [NSDate stub:@selector(AZ_currentCalendar) andReturn:jaCalendar];
            });
            it(@"should return start of year date object", ^{
                NSDate *subject = [currentDate dateAtEndOfYear];
                NSDate *expectDate = [NSDate AZ_dateByUnit:@{
                    AZ_DateUnit.year : @1989,
                    AZ_DateUnit.month : @12,
                    AZ_DateUnit.day : @31,
                }];
                [[subject should] beKindOfClass:[NSDate class]];
                [[subject should] equalToDateIgnoringTime:expectDate];
            });
        });
    });

SPEC_END
