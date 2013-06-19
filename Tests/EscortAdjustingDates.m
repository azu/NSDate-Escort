#import "Kiwi.h"
#import "NSDate+Escort.h"
#import "NSDate+AZDateBuilder.h"
#import "FakeDateUtil.h"
#import "AZNSDateKiwiMatcher.h"

SPEC_BEGIN(EscortAdjustingDates)
    registerMatchers(@"AZ");// NSDate Custom Matcher
    describe(@"-dateByAddingDays", ^{
        context(@"when today is 2010-10-10", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate dateByUnit:@{
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
                    NSDate *expectDate = [NSDate dateByUnit:@{
                        AZ_DateUnit.year : @2010,
                        AZ_DateUnit.month : @10,
                        AZ_DateUnit.day : @11,
                    }];
                    [[subject should] equalToDateIgnoringTime:expectDate];
                });
            });
            context(@"adding 10 Day", ^{
                __block NSDate *subject;
                beforeEach(^{
                    subject = [currentDate dateByAddingDays:10];
                });
                it(@"should return 2010-10-20", ^{
                    NSDate *expectDate = [NSDate dateByUnit:@{
                        AZ_DateUnit.year : @2010,
                        AZ_DateUnit.month : @10,
                        AZ_DateUnit.day : @20,
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
                    NSDate *expectDate = [NSDate dateByUnit:@{
                        AZ_DateUnit.year : @2010,
                        AZ_DateUnit.month : @10,
                        AZ_DateUnit.day : @9,
                    }];
                    [[subject should] equalToDateIgnoringTime:expectDate];
                });
            });
        });
    });
    describe(@"-dateBySubtractingDays", ^{
        context(@"when the date is 2010-10-10", ^{
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
                    NSDate *expectDate = [NSDate dateByUnit:@{
                        AZ_DateUnit.year : @2010,
                        AZ_DateUnit.month : @10,
                        AZ_DateUnit.day : @9,
                    }];
                    [[subject should] equalToDateIgnoringTime:expectDate];
                });
            });
            context(@"before 5 Day", ^{
                __block NSDate *suject;
                beforeEach(^{
                    suject = [currentDate dateBySubtractingDays:5];
                });
                it(@"should return 2010-10-5", ^{
                    NSDate *expectDate = [NSDate dateByUnit:@{
                        AZ_DateUnit.year : @2010,
                        AZ_DateUnit.month : @10,
                        AZ_DateUnit.day : @5,
                    }];
                    [[suject should] equalToDateIgnoringTime:expectDate];
                });
            });
            context(@"before -1 Day", ^{
                __block NSDate *subject;
                beforeEach(^{
                    subject = [currentDate dateBySubtractingDays:-1];
                });
                it(@"should return 2010-10-11", ^{
                    NSDate *expectDate = [NSDate dateByUnit:@{
                        AZ_DateUnit.year : @2010,
                        AZ_DateUnit.month : @10,
                        AZ_DateUnit.day : @11,
                    }];
                    [[subject should] equalToDateIgnoringTime:expectDate];
                });
            });
        });
    });
    describe(@"-dateByAddingHours", ^{
        context(@"when the date is 2010-10-10 10:10:10", ^{
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
                    NSDate *expectDate = [NSDate dateByUnit:@{
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
                    NSDate *expectDate = [NSDate dateByUnit:@{
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
                    NSDate *expectDate = [NSDate dateByUnit:@{
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
        });
    });
    describe(@"-dateBySubtractingHours", ^{
        context(@"when the date is 2010-10-10 10:10:10", ^{
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
                    NSDate *expectDate = [NSDate dateByUnit:@{
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
                    NSDate *expectDate = [NSDate dateByUnit:@{
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
                    NSDate *expectDate = [NSDate dateByUnit:@{
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
        });
    });

    describe(@"-dateByAddingMinutes", ^{
        context(@"when the date is 2010-10-10 10:10:10", ^{
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
                    NSDate *expectDate = [NSDate dateByUnit:@{
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
                    NSDate *expectDate = [NSDate dateByUnit:@{
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
                it(@"should return 2010-10-10 10:11:10", ^{
                    NSDate *expectDate = [NSDate dateByUnit:@{
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
                    NSDate *expectDate = [NSDate dateByUnit:@{
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
                    NSDate *expectDate = [NSDate dateByUnit:@{
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
                    NSDate *expectDate = [NSDate dateByUnit:@{
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
    SPEC_END
