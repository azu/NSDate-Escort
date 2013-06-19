#import "Kiwi.h"
#import "NSDate+Escort.h"
#import "NSDate+AZDateBuilder.h"
#import "FakeDateUtil.h"
#import "AZNSDateKiwiMatcher.h"

SPEC_BEGIN(EscortAdjustingDates)
    registerMatchers(@"AZ");// NSDate Custom Matcher
    describe(@"-dateByAddingDays", ^{
        context(@"when the date is 2010-10-10", ^{
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
                __block NSDate *subject;
                beforeEach(^{
                    subject = [currentDate dateBySubtractingDays:5];
                });
                it(@"should return 2010-10-5", ^{
                    NSDate *expectDate = [NSDate dateByUnit:@{
                        AZ_DateUnit.year : @2010,
                        AZ_DateUnit.month : @10,
                        AZ_DateUnit.day : @5,
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

    describe(@"-dateAtStartOfDay", ^{
        context(@"when the date is 2010-10-10 00:00:00", ^{
            __block NSDate *subject;
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate dateByUnit:@{
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
                currentDate = [NSDate dateByUnit:@{
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
                NSDate *expectDate = [NSDate dateByUnit:@{
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
    });
    describe(@"-dateAtEndOfDay", ^{
        context(@"when the date is 2010-10-10 00:00:00", ^{
            __block NSDate *subject;
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate dateByUnit:@{
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
                NSDate *expectDate = [NSDate dateByUnit:@{
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
                currentDate = [NSDate dateByUnit:@{
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
    });

    describe(@"-dateAtStartOfMonth", ^{
        context(@"when the date is 2010-10-10 00:00:00", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                }];
            });
            it(@"should return start of month date object", ^{
                // 2010-10-01
                NSDate *subject = [currentDate dateAtStartOfMonth];
                NSDate *expectDate = [NSDate dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @1,
                }];
                [[subject should] isKindOfClass:[NSDate class]];
                [[subject should] equalToDateIgnoringTime:expectDate];
            });
        });
    });
    describe(@"-dateAtEndOfMonth", ^{
        context(@"when the date is 2010-10-10 00:00:00", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                }];
            });
            it(@"should return end of month date object", ^{
                // 2010-10-31
                NSDate *subject = [currentDate dateAtEndOfMonth];
                NSDate *expectDate = [NSDate dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @31,
                }];
                [[subject should] isKindOfClass:[NSDate class]];
                [[subject should] equalToDateIgnoringTime:expectDate];
            });
        });
        // http://en.wikipedia.org/wiki/Leap_year
        context(@"when February @ leap year", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate dateByUnit:@{
                    AZ_DateUnit.year : @2000,// divisible 400 => leap year
                    AZ_DateUnit.month : @2,
                    AZ_DateUnit.day : @1,
                }];
            });
            it(@"should return 02-29", ^{
                NSDate *subject = [currentDate dateAtEndOfMonth];
                NSDate *expectDate = [NSDate dateByUnit:@{
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
                currentDate = [NSDate dateByUnit:@{
                    AZ_DateUnit.year : @2001,
                    AZ_DateUnit.month : @2,
                    AZ_DateUnit.day : @1,
                }];
            });
            it(@"should return 02-28", ^{
                NSDate *subject = [currentDate dateAtEndOfMonth];
                NSDate *expectDate = [NSDate dateByUnit:@{
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
                currentDate = [NSDate dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                }];
            });
            it(@"should return start of year date object", ^{
                // 2010-01-01
                NSDate *subject = [currentDate dateAtStartOfYear];
                NSDate *expectDate = [NSDate dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @1,
                    AZ_DateUnit.day : @1,
                }];
                [[subject should] isKindOfClass:[NSDate class]];
                [[subject should] equalToDateIgnoringTime:expectDate];
            });
        });
    });
    describe(@"-dateAtEndOfYear", ^{
        context(@"when the date is 2010-10-10", ^{
            __block NSDate *currentDate;
            beforeEach(^{
                currentDate = [NSDate dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @10,
                    AZ_DateUnit.day : @10,
                }];
            });
            it(@"should return end of year date object", ^{
                // 2010-12-31
                NSDate *subject = [currentDate dateAtEndOfYear];
                NSDate *expectDate = [NSDate dateByUnit:@{
                    AZ_DateUnit.year : @2010,
                    AZ_DateUnit.month : @12,
                    AZ_DateUnit.day : @31,
                }];
                [[subject should] isKindOfClass:[NSDate class]];
                [[subject should] equalToDateIgnoringTime:expectDate];
            });
        });
    });

    SPEC_END
