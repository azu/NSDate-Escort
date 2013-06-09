#import "Kiwi.h"
#import "NSDate+Escort.h"
#import "AZNSDateKiwiMatcher.h"
#import "NSDate+AZDateBuilder.h"
#import "FakeDateUtil.h"

SPEC_BEGIN(EscortClassSpec)
    registerMatchers(@"AZ");// NSDate Custom Matcher
    describe(@"+dateTomorrow", ^{
        NSDate *currentDate = [NSDate date];
        beforeEach(^{
            [FakeDateUtil stubCurrentDate:currentDate];
        });
        it(@"should return tomorrow", ^{
            NSDate *expectDate = [currentDate dateByAddingTimeInterval:SECONDS_IN_DAY];
            NSDate *tomorrow = [NSDate dateTomorrow];
            [[tomorrow should] equalToDateIgnoringTime:expectDate];
        });

    });

    describe(@"+dateYesterday", ^{
        NSDate *currentDate = [NSDate date];
        beforeEach(^{
            [FakeDateUtil stubCurrentDate:currentDate];
        });
        it(@"should return yesterday", ^{
            NSDate *expectDate = [currentDate dateByAddingTimeInterval:-SECONDS_IN_DAY];
            NSDate *yesterday = [NSDate dateYesterday];
            [[yesterday should] equalToDateIgnoringTime:expectDate];
        });
    });

    describe(@"+dateWithDaysFromNow", ^{
        context(@"when today is 2010-10-10 10:10:10", ^{
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
            context(@"adding 0 Day", ^{
                __block NSDate *dateWithDaysFromNow;
                beforeEach(^{
                    dateWithDaysFromNow = [NSDate dateWithDaysFromNow:0];
                });
                it(@"should return 2010-10-10", ^{
                    [[dateWithDaysFromNow should] equal:currentDate];
                });
            });
            context(@"adding 1 Day", ^{
                __block NSDate *dateWithDaysFromNow;
                beforeEach(^{
                    dateWithDaysFromNow = [NSDate dateWithDaysFromNow:1];
                });
                it(@"should return 2010-10-11", ^{
                    NSDate *expectDate = [NSDate dateByUnit:@{
                        AZ_DateUnit.year : @2010,
                        AZ_DateUnit.month : @10,
                        AZ_DateUnit.day : @11,
                        AZ_DateUnit.hour : @10,
                        AZ_DateUnit.minute : @10,
                        AZ_DateUnit.second : @10,
                    }];
                    [[dateWithDaysFromNow should] equal:expectDate];
                });
            });
            context(@"adding 10 Day", ^{
                __block NSDate *dateWithDaysFromNow;
                beforeEach(^{
                    dateWithDaysFromNow = [NSDate dateWithDaysFromNow:10];
                });
                it(@"should return 2010-10-20", ^{
                    NSDate *expectDate = [NSDate dateByUnit:@{
                        AZ_DateUnit.year : @2010,
                        AZ_DateUnit.month : @10,
                        AZ_DateUnit.day : @20,
                        AZ_DateUnit.hour : @10,
                        AZ_DateUnit.minute : @10,
                        AZ_DateUnit.second : @10,
                    }];
                    [[dateWithDaysFromNow should] equal:expectDate];
                });
            });
            context(@"adding -1 Day", ^{
                __block NSDate *dateWithDaysFromNow;
                beforeEach(^{
                    dateWithDaysFromNow = [NSDate dateWithDaysFromNow:-1];
                });
                it(@"should return 2010-10-09", ^{
                    NSDate *expectDate = [NSDate dateByUnit:@{
                        AZ_DateUnit.year : @2010,
                        AZ_DateUnit.month : @10,
                        AZ_DateUnit.day : @9,
                        AZ_DateUnit.hour : @10,
                        AZ_DateUnit.minute : @10,
                        AZ_DateUnit.second : @10,
                    }];
                    [[dateWithDaysFromNow should] equal:expectDate];
                });
            });
        });
    });
    describe(@"+dateWithDaysBeforeNow", ^{
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
            context(@"before 0 Day", ^{
                __block NSDate *dateWithDaysBeforeNow;
                beforeEach(^{
                    dateWithDaysBeforeNow = [NSDate dateWithDaysBeforeNow:0];
                });
                it(@"should return 2010-10-10", ^{
                    [[dateWithDaysBeforeNow should] equal:currentDate];
                });
            });
            context(@"before 1 Day", ^{
                __block NSDate *dateWithDaysBeforeNow;
                beforeEach(^{
                    dateWithDaysBeforeNow = [NSDate dateWithDaysBeforeNow:1];
                });
                it(@"should return 2010-10-09", ^{
                    NSDate *expectDate = [NSDate dateByUnit:@{
                        AZ_DateUnit.year : @2010,
                        AZ_DateUnit.month : @10,
                        AZ_DateUnit.day : @9,
                        AZ_DateUnit.hour : @10,
                        AZ_DateUnit.minute : @10,
                        AZ_DateUnit.second : @10,
                    }];
                    [[dateWithDaysBeforeNow should] equal:expectDate];
                });
            });
            context(@"before 5 Day", ^{
                __block NSDate *dateWithDaysBeforeNow;
                beforeEach(^{
                    dateWithDaysBeforeNow = [NSDate dateWithDaysBeforeNow:5];
                });
                it(@"should return 2010-10-20", ^{
                    NSDate *expectDate = [NSDate dateByUnit:@{
                        AZ_DateUnit.year : @2010,
                        AZ_DateUnit.month : @10,
                        AZ_DateUnit.day : @5,
                        AZ_DateUnit.hour : @10,
                        AZ_DateUnit.minute : @10,
                        AZ_DateUnit.second : @10,
                    }];
                    [[dateWithDaysBeforeNow should] equal:expectDate];
                });
            });
            context(@"before -1 Day", ^{
                __block NSDate *dateWithDaysBeforeNow;
                beforeEach(^{
                    dateWithDaysBeforeNow = [NSDate dateWithDaysBeforeNow:-1];
                });
                it(@"should return 2010-10-11", ^{
                    NSDate *expectDate = [NSDate dateByUnit:@{
                        AZ_DateUnit.year : @2010,
                        AZ_DateUnit.month : @10,
                        AZ_DateUnit.day : @11,
                        AZ_DateUnit.hour : @10,
                        AZ_DateUnit.minute : @10,
                        AZ_DateUnit.second : @10,
                    }];
                    [[dateWithDaysBeforeNow should] equal:expectDate];
                });
            });
        });
    });
    describe(@"+dateWithHoursFromNow", ^{
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
                __block NSDate *dateWithDaysBeforeNow;
                beforeEach(^{
                    dateWithDaysBeforeNow = [NSDate dateWithHoursFromNow:0];
                });
                it(@"should return same date", ^{
                    [[dateWithDaysBeforeNow should] equal:currentDate];
                });
            });
            context(@"adding 1 hour", ^{
                __block NSDate *dateWithDaysBeforeNow;
                beforeEach(^{
                    dateWithDaysBeforeNow = [NSDate dateWithHoursFromNow:1];
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
                __block NSDate *dateWithDaysBeforeNow;
                beforeEach(^{
                    dateWithDaysBeforeNow = [NSDate dateWithHoursFromNow:24];
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
                    [[dateWithDaysBeforeNow should] equal:expectDate];
                });
            });
            context(@"adding -1 hour", ^{
                __block NSDate *dateWithDaysBeforeNow;
                beforeEach(^{
                    dateWithDaysBeforeNow = [NSDate dateWithHoursFromNow:-1];
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
                    [[dateWithDaysBeforeNow should] equal:expectDate];
                });
            });
        });
    });
    describe(@"+dateWithHoursBeforeNow", ^{
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
                __block NSDate *dateWithDaysBeforeNow;
                beforeEach(^{
                    dateWithDaysBeforeNow = [NSDate dateWithHoursBeforeNow:0];
                });
                it(@"should return same date", ^{
                    [[dateWithDaysBeforeNow should] equal:currentDate];
                });
            });
            context(@"subtract 1 hour", ^{
                __block NSDate *dateWithDaysBeforeNow;
                beforeEach(^{
                    dateWithDaysBeforeNow = [NSDate dateWithHoursBeforeNow:1];
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
                    [[dateWithDaysBeforeNow should] equal:expectDate];
                });
            });
            context(@"subtract 24 hour", ^{
                __block NSDate *dateWithDaysBeforeNow;
                beforeEach(^{
                    dateWithDaysBeforeNow = [NSDate dateWithHoursBeforeNow:24];
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
                    [[dateWithDaysBeforeNow should] equal:expectDate];
                });
            });
            context(@"subtract -1 hour", ^{
                __block NSDate *dateWithDaysBeforeNow;
                beforeEach(^{
                    dateWithDaysBeforeNow = [NSDate dateWithHoursBeforeNow:-1];
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
                    [[dateWithDaysBeforeNow should] equal:expectDate];
                });
            });
        });
    });

    describe(@"+dateWithMinutesFromNow:", ^{
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
                __block NSDate *dateWithDaysBeforeNow;
                beforeEach(^{
                    dateWithDaysBeforeNow = [NSDate dateWithMinutesFromNow:0];
                });
                it(@"should return same date", ^{
                    [[dateWithDaysBeforeNow should] equal:currentDate];
                });
            });
            context(@"adding 1 minute", ^{
                __block NSDate *dateWithDaysBeforeNow;
                beforeEach(^{
                    dateWithDaysBeforeNow = [NSDate dateWithMinutesFromNow:1];
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
                    [[dateWithDaysBeforeNow should] equal:expectDate];
                });
            });
            context(@"adding 60 minute", ^{
                __block NSDate *dateWithDaysBeforeNow;
                beforeEach(^{
                    dateWithDaysBeforeNow = [NSDate dateWithMinutesFromNow:60];
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
                    [[dateWithDaysBeforeNow should] equal:expectDate];
                });
            });
            context(@"adding -1 minute", ^{
                __block NSDate *dateWithDaysBeforeNow;
                beforeEach(^{
                    dateWithDaysBeforeNow = [NSDate dateWithMinutesFromNow:-1];
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
                    [[dateWithDaysBeforeNow should] equal:expectDate];
                });
            });
        });

        describe(@"+dateWithMinutesBeforeNow:", ^{
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
                    __block NSDate *dateWithDaysBeforeNow;
                    beforeEach(^{
                        dateWithDaysBeforeNow = [NSDate dateWithMinutesBeforeNow:0];
                    });
                    it(@"should return same date", ^{
                        [[dateWithDaysBeforeNow should] equal:currentDate];
                    });
                });
                context(@"subtract 1 minute", ^{
                    __block NSDate *dateWithDaysBeforeNow;
                    beforeEach(^{
                        dateWithDaysBeforeNow = [NSDate dateWithMinutesBeforeNow:1];
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
                        [[dateWithDaysBeforeNow should] equal:expectDate];
                    });
                });
                context(@"subtract 60 minute", ^{
                    __block NSDate *dateWithDaysBeforeNow;
                    beforeEach(^{
                        dateWithDaysBeforeNow = [NSDate dateWithMinutesBeforeNow:60];
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
                        [[dateWithDaysBeforeNow should] equal:expectDate];
                    });
                });
                context(@"subtract -1 minute", ^{
                    __block NSDate *dateWithDaysBeforeNow;
                    beforeEach(^{
                        dateWithDaysBeforeNow = [NSDate dateWithMinutesBeforeNow:-1];
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
                        [[dateWithDaysBeforeNow should] equal:expectDate];
                    });
                });
            });
        });
    });

    SPEC_END
