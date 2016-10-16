//
//  EscortAdjustingDatesSpec.swift
//  NSDate-Escort
//
//  Created by akuraru on 2016/10/13.
//
//

import Foundation
import Quick
import Nimble

class EscortAdjustingDatesSpec: QuickSpec {
    override func spec() {
        describe("-dateByAddingYears") {
            context("when the date is 2010-10-10") {
                let currentDate;
                 = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10
                    )
                context("adding 0 year") {
                    let subject;
                     = currentDate.dateByAddingYears(0)
                        }
                    it("should return 2010-10-10") {
                        [[subject should] equalToDateIgnoringTime:currentDate];
                        }
                    }
                context("adding 1 year") {
                    let subject;
                     = currentDate.dateByAddingYears(1)
                        }
                    it("should return 2011-10-10") {
                        let expectDate = Date.build(
                            year: 2011,
                            month: 10,
                            day: 10
                        )
                        [[subject should] equalToDateIgnoringTime:expectDate];
                        }
                    }
                context("adding -1 year") {
                    let subject;
                     = [currentDate dateByAddingYears:-1];
                        }
                    it("should return 2009-10-10") {
                        let expectDate = Date.build(
                            year: 2009,
                            month: 10,
                            day: 10
                        )
                        [[subject should] equalToDateIgnoringTime:expectDate];
                        }
                    }
                context("quickcheck") {
                    it("should be success") {
                        let calendar = Calendar.current
                        let testable = [NLTQTestable testableWithPropertyBlockArguments1:^BOOL(id argA) {
                            let resultDate = [currentDate dateByAddingYears:[argA integerValue]];
                            let diffComponents = [calendar components:NSCalendarUnitYear fromDate:currentDate toDate:resultDate options:0];
                            return [diffComponents year] == [argA integerValue];
                            } arbitrary:[NSNumber intArbitrary]];
                        [testable check];
                        [[testable should] beSuccess];
                        }
                    }
                }
            }
        
        describe("-dateBySubtractingYears") {
            context("when the date is 2010-10-10") {
                let currentDate;
                 = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10
                    )
                context("quickcheck") {
                    it("should be success") {
                        let calendar = Calendar.current
                        let testable = [NLTQTestable testableWithPropertyBlockArguments1:^BOOL(id argA) {
                            let resultDate = [currentDate dateBySubtractingYears:[argA integerValue]];
                            let diffComponents = [calendar components:NSCalendarUnitYear fromDate:resultDate toDate:currentDate options:0];
                            return [diffComponents year] == [argA integerValue];
                            } arbitrary:[NSNumber intArbitrary]];
                        [testable check];
                        [[testable should] beSuccess];
                        }
                    }
                }
            }
        
        describe("-dateByAddingMonths") {
            context("when the date is 2010-10-10") {
                let currentDate;
                 = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10
                    )
                context("adding 0 month") {
                    let subject;
                     = currentDate.dateByAddingMonths(0)
                        }
                    it("should return 2010-10-10") {
                        [[subject should] equalToDateIgnoringTime:currentDate];
                        }
                    }
                context("adding 1 month") {
                    let subject;
                     = currentDate.dateByAddingMonths(1)
                        }
                    it("should return 2010-11-10") {
                        let expectDate = Date.build(
                            year: 2010,
                            month: 11,
                            day: 10
                        )
                        [[subject should] equalToDateIgnoringTime:expectDate];
                        }
                    }
                context("adding -1 month") {
                    let subject;
                     = [currentDate dateByAddingMonths:-1];
                        }
                    it("should return 2010-09-10") {
                        let expectDate = Date.build(
                            year: 2010,
                            month: 9,
                            day: 10
                        )
                        [[subject should] equalToDateIgnoringTime:expectDate];
                        }
                    }
                context("quickcheck") {
                    it("should be success") {
                        let calendar = Calendar.current
                        let testable = [NLTQTestable testableWithPropertyBlockArguments1:^BOOL(id argA) {
                            let resultDate = [currentDate dateByAddingMonths:[argA integerValue]];
                            let diffComponents = [calendar components:NSCalendarUnitMonth fromDate:currentDate toDate:resultDate options:0];
                            return [diffComponents month] == [argA integerValue];
                            } arbitrary:[NSNumber intArbitrary]];
                        [testable check];
                        [[testable should] beSuccess];
                        }
                    }
                }
            }
        describe("-dateBySubtractingMonth") {
            context("when the date is 2010-10-10") {
                let currentDate;
                 = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10
                    )
                context("quickcheck") {
                    it("should be success") {
                        let calendar = Calendar.current
                        let testable = [NLTQTestable testableWithPropertyBlockArguments1:^BOOL(id argA) {
                            let resultDate = [currentDate dateBySubtractingMonths:[argA integerValue]];
                            let diffComponents = [calendar components:NSCalendarUnitMonth fromDate:resultDate toDate:currentDate options:0];
                            return [diffComponents month] == [argA integerValue];
                            } arbitrary:[NSNumber intArbitrary]];
                        [testable check];
                        [[testable should] beSuccess];
                        }
                    }
                }
            }
        
        describe("-dateByAddingDays") {
            context("when the date is 2010-10-10") {
                let currentDate;
                 = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10
                    )
                context("adding 0 Day") {
                    let subject;
                     = currentDate.dateByAddingDays(0)
                        }
                    it("should return 2010-10-10") {
                        [[subject should] equalToDateIgnoringTime:currentDate];
                        }
                    }
                context("adding 1 Day") {
                    let subject;
                     = currentDate.dateByAddingDays(1)
                        }
                    it("should return 2010-10-11") {
                        let expectDate = Date.build(
                            year: 2010,
                            month: 10,
                            day: 11
                        )
                        [[subject should] equalToDateIgnoringTime:expectDate];
                        }
                    }
                context("adding -1 Day") {
                    let subject;
                     = [currentDate dateByAddingDays:-1];
                        }
                    it("should return 2010-10-09") {
                        let expectDate = Date.build(
                            year: 2010,
                            month: 10,
                            day: 9
                        )
                        [[subject should] equalToDateIgnoringTime:expectDate];
                        }
                    }
                context("quickcheck") {
                    it("should be success") {
                        let calendar = Calendar.current
                        let testable = [NLTQTestable testableWithPropertyBlockArguments1:^BOOL(id argA) {
                            let addingDays = [currentDate dateByAddingDays:[argA integerValue]];
                            let diffComponents = [calendar components:NSCalendarUnitDay fromDate:currentDate toDate:addingDays options:0];
                            return [diffComponents day] == [argA integerValue];
                            } arbitrary:[NSNumber intArbitrary]];
                        [testable check];
                        [[testable should] beSuccess];
                        }
                    }
                }
            }
        describe("-dateBySubtractingDays") {
            context("when the date is 2010-10-10") {
                let currentDate;
                 = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10,
                        hour: 10,
                        minute: 10,
                        second: 10
                    )
                    
                    }
                context("before 0 Day") {
                    let subject;
                     = currentDate.dateBySubtractingDays(0)
                        }
                    it("should return 2010-10-10") {
                        expect(subject).to(equal(currentDate))
                        }
                    }
                context("before 1 Day") {
                    let subject;
                     = currentDate.dateBySubtractingDays(1)
                        }
                    it("should return 2010-10-09") {
                        let expectDate = Date.build(
                            year: 2010,
                            month: 10,
                            day: 9
                        )
                        [[subject should] equalToDateIgnoringTime:expectDate];
                        }
                    }
                context("before -1 Day") {
                    let subject;
                     = [currentDate dateBySubtractingDays:-1];
                        }
                    it("should return 2010-10-11") {
                        let expectDate = Date.build(
                            year: 2010,
                            month: 10,
                            day: 11
                        )
                        [[subject should] equalToDateIgnoringTime:expectDate];
                        }
                    }
                context("quickcheck") {
                    it("should be success") {
                        let calendar = Calendar.current
                        let testable = [NLTQTestable testableWithPropertyBlockArguments1:^BOOL(id argA) {
                            let resultDate = [currentDate dateBySubtractingDays:[argA integerValue]];
                            let diffComponents = [calendar components:NSCalendarUnitDay fromDate:resultDate toDate:currentDate options:0];
                            return [diffComponents day] == [argA integerValue];
                            } arbitrary:[NSNumber intArbitrary]];
                        [testable check];
                        [[testable should] beSuccess];
                        }
                    }
                }
            }
        describe("-dateByAddingHours") {
            context("when the date is 2010-10-10 10:10:10") {
                let currentDate;
                 = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10,
                        hour: 10,
                        minute: 10,
                        second: 10
                    )
                    
                    }
                context("adding 0 hour") {
                    let subject;
                     = currentDate.dateByAddingHours(0)
                        }
                    it("should return same date") {
                        expect(subject).to(equal(currentDate))
                        }
                    }
                context("adding 1 hour") {
                    let dateWithDaysBeforeNow;
                     = currentDate.dateByAddingHours(1)
                        }
                    it("should return 2010-10-10 10:11:10") {
                        let expectDate = Date.build(
                            year: 2010,
                            month: 10,
                            day: 10,
                            hour: 11,
                            minute: 10,
                            second: 10
                        )
                        expect(dateWithDaysBeforeNow).to(equal(expectDate))
                        }
                    }
                context("adding 24 hour") {
                    let subject;
                     = currentDate.dateByAddingHours(24)
                        }
                    it("should return 2010-10-11 10:10:10") {
                        let expectDate = Date.build(
                            year: 2010,
                            month: 10,
                            day: 11,
                            hour: 10,
                            minute: 10,
                            second: 10
                        )
                        expect(subject).to(equal(expectDate))
                        }
                    }
                context("adding -1 hour") {
                    let subject;
                     = [currentDate dateByAddingHours:-1];
                        }
                    it("should return 2010-10-10 09:10:10") {
                        let expectDate = Date.build(
                            year: 2010,
                            month: 10,
                            day: 10,
                            hour: 9,
                            minute: 10,
                            second: 10
                        )
                        expect(subject).to(equal(expectDate))
                        }
                    }
                context("quickcheck") {
                    it("should be success") {
                        let calendar = Calendar.current
                        let testable = [NLTQTestable testableWithPropertyBlockArguments1:^BOOL(id argA) {
                            let subtractingDays = [currentDate dateByAddingHours:[argA integerValue]];
                            let diffComponents = [calendar components:NSCalendarUnitHour fromDate:currentDate toDate:subtractingDays options:0];
                            return [diffComponents hour] == [argA integerValue];
                            } arbitrary:[NSNumber intArbitrary]];
                        [testable check];
                        [[testable should] beSuccess];
                        }
                    }
                }
            }
        describe("-dateBySubtractingHours") {
            context("when the date is 2010-10-10 10:10:10") {
                let currentDate;
                 = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10,
                        hour: 10,
                        minute: 10,
                        second: 10
                    )
                    
                    }
                context("subtract 0 hour") {
                    let subject;
                     = currentDate.dateBySubtractingHours(0)
                        }
                    it("should return same date") {
                        expect(subject).to(equal(currentDate))
                        }
                    }
                context("subtract 1 hour") {
                    let subject;
                     = currentDate.dateBySubtractingHours(1)
                        }
                    it("should return 2010-10-10 10:09:10") {
                        let expectDate = Date.build(
                            year: 2010,
                            month: 10,
                            day: 10,
                            hour: 9,
                            minute: 10,
                            second: 10
                        )
                        expect(subject).to(equal(expectDate))
                        }
                    }
                context("subtract 24 hour") {
                    let subject;
                     = currentDate.dateBySubtractingHours(24)
                        }
                    it("should return 2010-10-09 10:10:10") {
                        let expectDate = Date.build(
                            year: 2010,
                            month: 10,
                            day: 9,
                            hour: 10,
                            minute: 10,
                            second: 10
                        )
                        expect(subject).to(equal(expectDate))
                        }
                    }
                context("subtract -1 hour") {
                    let subject;
                     = [currentDate dateBySubtractingHours:-1];
                        }
                    it("should return 2010-10-10 11:10:10") {
                        let expectDate = Date.build(
                            year: 2010,
                            month: 10,
                            day: 10,
                            hour: 11,
                            minute: 10,
                            second: 10
                        )
                        expect(subject).to(equal(expectDate))
                        }
                    }
                context("quickcheck") {
                    it("should be success") {
                        let calendar = Calendar.current
                        let testable = [NLTQTestable testableWithPropertyBlockArguments1:^BOOL(id argA) {
                            let resultDate = [currentDate dateBySubtractingHours:[argA integerValue]];
                            let diffComponents = [calendar components:NSCalendarUnitHour fromDate:resultDate toDate:currentDate options:0];
                            return [diffComponents hour] == [argA integerValue];
                            } arbitrary:[NSNumber intArbitrary]];
                        [testable check];
                        [[testable should] beSuccess];
                        }
                    }
                }
            }
        
        describe("-dateByAddingMinutes") {
            context("when the date is 2010-10-10 10:10:10") {
                let currentDate;
                 = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10,
                        hour: 10,
                        minute: 10,
                        second: 10
                    )
                    
                    }
                context("adding 0 minute") {
                    let subject;
                     = currentDate.dateByAddingMinutes(0)
                        }
                    it("should return same date") {
                        expect(subject).to(equal(currentDate))
                        }
                    }
                context("adding 1 minute") {
                    let subject;
                     = currentDate.dateByAddingMinutes(1)
                        }
                    it("should return 2010-10-10 10:11:10") {
                        let expectDate = Date.build(
                            year: 2010,
                            month: 10,
                            day: 10,
                            hour: 10,
                            minute: 11,
                            second: 10
                        )
                        expect(subject).to(equal(expectDate))
                        }
                    }
                context("adding 60 minute") {
                    let subject;
                     = currentDate.dateByAddingMinutes(60)
                        }
                    it("should return 2010-10-10 11:10:10") {
                        let expectDate = Date.build(
                            year: 2010,
                            month: 10,
                            day: 10,
                            hour: 11,
                            minute: 10,
                            second: 10
                        )
                        expect(subject).to(equal(expectDate))
                        }
                    }
                context("adding -1 minute") {
                    let subject;
                     = [currentDate dateByAddingMinutes:-1];
                        }
                    it("should return 2010-10-10 10:09:10") {
                        let expectDate = Date.build(
                            year: 2010,
                            month: 10,
                            day: 10,
                            hour: 10,
                            minute: 9,
                            second: 10
                        )
                        expect(subject).to(equal(expectDate))
                        }
                    }
                }
            }
        
        describe("-dateBySubtractingMinutes") {
            context("when the date is 2010-10-10 10:10:10") {
                let currentDate;
                 = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10,
                        hour: 10,
                        minute: 10,
                        second: 10
                    )
                    
                    }
                context("subtract 0 minute") {
                    let subject;
                     = currentDate.dateBySubtractingMinutes(0)
                        }
                    it("should return same date") {
                        expect(subject).to(equal(currentDate))
                        }
                    }
                context("subtract 1 minute") {
                    let subject;
                     = currentDate.dateBySubtractingMinutes(1)
                        }
                    it("should return 2010-10-10 10:09:10") {
                        let expectDate = Date.build(
                            year: 2010,
                            month: 10,
                            day: 10,
                            hour: 10,
                            minute: 9,
                            second: 10
                        )
                        expect(subject).to(equal(expectDate))
                        }
                    }
                context("subtract 60 minute") {
                    let subject;
                     = currentDate.dateBySubtractingMinutes(60)
                        }
                    it("should return 2010-10-10 09:10:10") {
                        let expectDate = Date.build(
                            year: 2010,
                            month: 10,
                            day: 10,
                            hour: 9,
                            minute: 10,
                            second: 10
                        )
                        expect(subject).to(equal(expectDate))
                        }
                    }
                context("subtract -1 minute") {
                    let subject;
                     = [currentDate dateBySubtractingMinutes:-1];
                        }
                    it("should return 2010-10-10 11:11:10") {
                        let expectDate = Date.build(
                            year: 2010,
                            month: 10,
                            day: 10,
                            hour: 10,
                            minute: 11,
                            second: 10
                        )
                        expect(subject).to(equal(expectDate))
                        }
                    }
                }
            }
        
        describe("-dateByAddingSounds") {
            context("when the date is 2010-10-10 10:10:10") {
                let currentDate;
                 = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10,
                        hour: 10,
                        minute: 10,
                        second: 10
                    )
                    
                    }
                context("adding 0 second") {
                    let subject;
                     = currentDate.dateByAddingSeconds(0)
                        }
                    it("should return same date") {
                        expect(subject).to(equal(currentDate))
                        }
                    }
                context("adding 1 second") {
                    let subject;
                     = currentDate.dateByAddingSeconds(1)
                        }
                    it("should return 2010-10-10 10:10:11") {
                        let expectDate = Date.build(
                            year: 2010,
                            month: 10,
                            day: 10,
                            hour: 10,
                            minute: 10,
                            second: 11
                        )
                        expect(subject).to(equal(expectDate))
                        }
                    }
                context("adding 60 seconds") {
                    let subject;
                     = currentDate.dateByAddingSeconds(60)
                        }
                    it("should return 2010-10-10 10:11:10") {
                        let expectDate = Date.build(
                            year: 2010,
                            month: 10,
                            day: 10,
                            hour: 10,
                            minute: 11,
                            second: 10
                        )
                        expect(subject).to(equal(expectDate))
                        }
                    }
                context("adding -1 second") {
                    let subject;
                     = [currentDate dateByAddingSeconds:-1];
                        }
                    it("should return 2010-10-10 10:11:10") {
                        let expectDate = Date.build(
                            year: 2010,
                            month: 10,
                            day: 10,
                            hour: 10,
                            minute: 10,
                            second: 9
                        )
                        expect(subject).to(equal(expectDate))
                        }
                    }
                }
            }
        describe("-dateBySubtractingSeconds") {
            context("when the date is 2010-10-10 10:10:10") {
                let currentDate;
                 = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10,
                        hour: 10,
                        minute: 10,
                        second: 10
                    )
                    
                    }
                context("subtract 0 second") {
                    let subject;
                     = currentDate.dateBySubtractingSeconds(0)
                        }
                    it("should return same date") {
                        expect(subject).to(equal(currentDate))
                        }
                    }
                context("subtract 1 second") {
                    let subject;
                     = currentDate.dateBySubtractingSeconds(1)
                        }
                    it("should return 2010-10-10 10:10:09") {
                        let expectDate = Date.build(
                            year: 2010,
                            month: 10,
                            day: 10,
                            hour: 10,
                            minute: 10,
                            second: 9
                        )
                        expect(subject).to(equal(expectDate))
                        }
                    }
                context("subtract 60 seconds") {
                    let subject;
                     = currentDate.dateBySubtractingSeconds(60)
                        }
                    it("should return 2010-10-10 10:09:10") {
                        let expectDate = Date.build(
                            year: 2010,
                            month: 10,
                            day: 10,
                            hour: 10,
                            minute: 9,
                            second: 10
                        )
                        expect(subject).to(equal(expectDate))
                        }
                    }
                context("subtract -1 second") {
                    let subject;
                     = [currentDate dateBySubtractingSeconds:-1];
                        }
                    it("should return 2010-10-10 11:11:10") {
                        let expectDate = Date.build(
                            year: 2010,
                            month: 10,
                            day: 10,
                            hour: 10,
                            minute: 10,
                            second: 11
                        )
                        expect(subject).to(equal(expectDate))
                        }
                    }
                }
            }
        
        describe("-dateAtStartOfDay") {
            context("when the date is 2010-10-10 00:00:00") {
                let subject;
                let currentDate;
                 = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10,
                        hour: 0,
                        minute: 0,
                        second: 0
                    )
                    
                    subject = currentDate.dateAtStartOfDay()
                    }
                it("should return same date") {
                    expect(subject).to(equal(currentDate))
                    }
                }
            context("when the date is 2010-10-10 23:59:59") {
                let subject;
                 currentDate;
                    currentDate = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10,
                        hour: 23,
                        minute: 59,
                        second: 59
                    )
                    
                    subject = currentDate.dateAtStartOfDay()
                    }
                it("should return 2010-10-10 00:00:00") {
                    let expectDate = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10,
                        hour: 0,
                        minute: 0,
                        second: 0
                    )
                    expect(subject).to(equal(expectDate))
                    }
                }
            context("when default time zone is changed") {
                let currentDate;
                 = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10,
                        hour: 23,
                        minute: 59,
                        second: 59
                    )
                it("should return start of day in new time zone") {
                    let initialTimeZone = [NSTimeZone defaultTimeZone];
                    let newTimeZone = nil;
                    
                    BOOL isInitialTimeZoneGMT = ([initialTimeZone.abbreviation isEqualToString:"GMT"]);
                    if (!isInitialTimeZoneGMT) {
                        newTimeZone = [NSTimeZone timeZoneWithAbbreviation:"GMT"];
                    } else {
                        newTimeZone = [NSTimeZone timeZoneWithAbbreviation:"PET"];
                    }
                    assert(initialTimeZone.secondsFromGMT != newTimeZone.secondsFromGMT);
                    let date = [currentDate dateByAddingTimeInterval:[initialTimeZone secondsFromGMT] - [newTimeZone secondsFromGMT]];
                    NSTimeZone.setDefaultTimeZone(newTimeZone)
                    let expectDate = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10,
                        hour: 0,
                        minute: 0,
                        second: 0
                    )
                    expect([date dateAtStartOfDay]).to(equal(expectDate))
                    
                    NSTimeZone.setDefaultTimeZone(initialTimeZone)
                    }
                }
            }
        describe("-dateAtEndOfDay") {
            context("when the date is 2010-10-10 00:00:00") {
                let subject;
                let currentDate;
                 = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10,
                        hour: 0,
                        minute: 0,
                        second: 0
                    )
                    
                    subject = currentDate.dateAtEndOfDay()
                    }
                it("should return 2010-10-10 23:59:59") {
                    let expectDate = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10,
                        hour: 23,
                        minute: 59,
                        second: 59
                    )
                    expect(subject).to(equal(expectDate))
                    }
                }
            context("when the date is 2010-10-10 23:59:59") {
                let subject;
                let currentDate;
                 = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10,
                        hour: 23,
                        minute: 59,
                        second: 59
                    )
                    
                    subject = currentDate.dateAtEndOfDay()
                    }
                it("should return same date") {
                    expect(subject).to(equal(currentDate))
                    }
                }
            context("when default time zone is changed") {
                let currentDate;
                 = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10,
                        hour: 0,
                        minute: 0,
                        second: 0
                    )
                it("should return end of day in new time zone") {
                    let initialTimeZone = [NSTimeZone defaultTimeZone];
                    let newTimeZone = nil;
                    
                    BOOL isInitialTimeZoneGMT = ([initialTimeZone.abbreviation isEqualToString:"GMT"]);
                    if (!isInitialTimeZoneGMT) {
                        newTimeZone = [NSTimeZone timeZoneWithAbbreviation:"GMT"];
                    } else {
                        newTimeZone = [NSTimeZone timeZoneWithAbbreviation:"PET"];
                    }
                    
                    assert(initialTimeZone.secondsFromGMT != newTimeZone.secondsFromGMT);
                    
                    NSTimeZone.setDefaultTimeZone(newTimeZone)
                    let date = [currentDate dateByAddingTimeInterval:[initialTimeZone secondsFromGMT] - [newTimeZone secondsFromGMT]];
                    let expectDate = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10,
                        hour: 23,
                        minute: 59,
                        second: 59
                    )
                    expect([date dateAtEndOfDay]).to(equal(expectDate))
                    
                    NSTimeZone.setDefaultTimeZone(initialTimeZone)
                    }
                }
            }
        
        describe("-dateAtStartOfWeek") {
            context("When the date is 2014-03-04") {
                let currentDate;
                 = Date.build(
                        year: 2014,
                        month: 3,
                        day: 4
                    )
                
                context("begining of sunday for weekady") {
                     beginingOfMondayCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
                        beginingOfMondayCalendar.firstWeekday = 1;
                        [NSDate stub:selector(AZ_currentCalendar) andReturn:beginingOfMondayCalendar];
                        }
                    it("should return start of week date object") {
                        let subject = currentDate.dateAtStartOfWeek()
                        let expectDate = Date.build(
                            year: 2014,
                            month: 3,
                            day: 2
                        )
                        [[subject should] beKindOfClass:[NSDate class]];
                        [[subject should] equalToDateIgnoringTime:expectDate];
                        }
                    }
                context("begining of monday for weekady") {
                     beginingOfMondayCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
                        beginingOfMondayCalendar.firstWeekday = 2;
                        [NSDate stub:selector(AZ_currentCalendar) andReturn:beginingOfMondayCalendar];
                        }
                    it("should return start of week date object") {
                        let subject = currentDate.dateAtStartOfWeek()
                        let expectDate = Date.build(
                            year: 2014,
                            month: 3,
                            day: 3
                        )
                        [[subject should] beKindOfClass:[NSDate class]];
                        [[subject should] equalToDateIgnoringTime:expectDate];
                        }
                    }
                }
            context("When the date is 2014-03-01") {
                let currentDate;
                 = Date.build(
                        year: 2014,
                        month: 3,
                        day: 1
                    )
                
                context("begining of sunday for weekady") {
                     beginingOfMondayCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
                        beginingOfMondayCalendar.firstWeekday = 1;
                        [NSDate stub:selector(AZ_currentCalendar) andReturn:beginingOfMondayCalendar];
                        }
                    it("should return start of week date object") {
                        
                        let subject = currentDate.dateAtStartOfWeek()
                        let expectDate = Date.build(
                            year: 2014,
                            month: 2,
                            day: 23
                        )
                        [[subject should] beKindOfClass:[NSDate class]];
                        [[subject should] equalToDateIgnoringTime:expectDate];
                        }
                    }
                
                context("begining of monday for weekady") {
                     beginingOfMondayCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
                        beginingOfMondayCalendar.firstWeekday = 2;
                        [NSDate stub:selector(AZ_currentCalendar) andReturn:beginingOfMondayCalendar];
                        }
                    it("should return start of week date object") {
                        
                        let subject = currentDate.dateAtStartOfWeek()
                        let expectDate = Date.build(
                            year: 2014,
                            month: 2,
                            day: 24
                        )
                        [[subject should] beKindOfClass:[NSDate class]];
                        [[subject should] equalToDateIgnoringTime:expectDate];
                        }
                    }
                }
            }
        
        describe("-dateAtEndOfWeek") {
            context("When the date is 2014-03-04") {
                let currentDate;
                 = Date.build(
                        year: 2014,
                        month: 3,
                        day: 4
                    )
                it("should return end of week date object") {
                    
                    let subject = currentDate.dateAtEndOfWeek()
                    let expectDate = Date.build(
                        year: 2014,
                        month: 3,
                        day: 8
                    )
                    [[subject should] beKindOfClass:[NSDate class]];
                    [[subject should] equalToDateIgnoringTime:expectDate];
                    }
                }
            context("When the date is 2014-02-25") {
                let currentDate;
                 = Date.build(
                        year: 2014,
                        month: 2,
                        day: 25
                    )
                it("should return end of week date object") {
                    let subject = currentDate.dateAtEndOfWeek()
                    let expectDate = Date.build(
                        year: 2014,
                        month: 3,
                        day: 1
                    )
                    [[subject should] beKindOfClass:[NSDate class]];
                    [[subject should] equalToDateIgnoringTime:expectDate];
                    }
                }
            context("When the date is 1989-01-06 and not Gregorian") {
                let currentDate;
                 = Date.build(
                        year: 1989,
                        month: 1,
                        day: 5
                    )
                    
                    let jaCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierJapanese];
                    [NSDate stub:selector(AZ_currentCalendar) andReturn:jaCalendar];
                    }
                it("should return end of week date object") {
                    let subject = currentDate.dateAtEndOfWeek()
                    let expectDate = Date.build(
                        year: 1989,
                        month: 1,
                        day: 7
                    )
                    [[subject should] beKindOfClass:[NSDate class]];
                    [[subject should] equalToDateIgnoringTime:expectDate];
                    }
                }
            }
        
        describe("-dateAtStartOfMonth") {
            context("when the date is 2010-10-10 00:00:00") {
                let currentDate;
                 = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10
                    )
                it("should return start of month date object") {
                    // 2010-10-01
                    let subject = currentDate.dateAtStartOfMonth()
                    let expectDate = Date.build(
                        year: 2010,
                        month: 10,
                        day: 1
                    )
                    [[subject should] beKindOfClass:[NSDate class]];
                    [[subject should] equalToDateIgnoringTime:expectDate];
                    }
                }
            }
        describe("-dateAtEndOfMonth") {
            context("when the date is 2010-10-10 00:00:00") {
                let currentDate;
                 = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10
                    )
                it("should return end of month date object") {
                    // 2010-10-31
                    let subject = currentDate.dateAtEndOfMonth()
                    let expectDate = Date.build(
                        year: 2010,
                        month: 10,
                        day: 31
                    )
                    [[subject should] beKindOfClass:[NSDate class]];
                    [[subject should] equalToDateIgnoringTime:expectDate];
                    }
                }
            // http://en.wikipedia.org/wiki/Leap_year
            context("when February  leap year") {
                let currentDate;
                 = Date.build(
                        year: 2000,// divisible 400 => leap year
                        month: 2,
                        day: 1
                    )
                it("should return 02-29") {
                    let subject = currentDate.dateAtEndOfMonth()
                    let expectDate = Date.build(
                        year: 2000,
                        month: 2,
                        day: 29
                    )
                    [[subject should] equalToDateIgnoringTime:expectDate];
                    }
                }
            // http://en.wikipedia.org/wiki/Leap_year
            context("when February  not leap year") {
                let currentDate;
                beforeEach(^{
                    // not leap year
                    currentDate = Date.build(
                        year: 2001,
                        month: 2,
                        day: 1
                    )
                it("should return 02-28") {
                    let subject = currentDate.dateAtEndOfMonth()
                    let expectDate = Date.build(
                        year: 2001,
                        month: 2,
                        day: 28
                    )
                    [[subject should] equalToDateIgnoringTime:expectDate];
                    }
                }
            }
        
        describe("-dateAtStartOfYear") {
            context("when the date is 2010-10-10") {
                let currentDate;
                 = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10
                    )
                it("should return start of year date object") {
                    // 2010-01-01
                    let subject = currentDate.dateAtStartOfYear()
                    let expectDate = Date.build(
                        year: 2010,
                        month: 1,
                        day: 1
                    )
                    [[subject should] beKindOfClass:[NSDate class]];
                    [[subject should] equalToDateIgnoringTime:expectDate];
                    }
                }
            context("when the date is 1989-01-06 and not Gregorian") {
                let currentDate;
                 = Date.build(
                        year: 1989,
                        month: 1,
                        day: 6
                    )
                    
                    let jaCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierJapanese];
                    [NSDate stub:selector(AZ_currentCalendar) andReturn:jaCalendar];
                    }
                it("should return start of year date object") {
                    let subject = currentDate.dateAtStartOfYear()
                    let expectDate = Date.build(
                        year: 1989,
                        month: 1,
                        day: 1
                    )
                    [[subject should] beKindOfClass:[NSDate class]];
                    [[subject should] equalToDateIgnoringTime:expectDate];
                    }
                }
            }
        describe("-dateAtEndOfYear") {
            context("when the date is 2010-10-10") {
                let currentDate;
                 = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10
                    )
                it("should return end of year date object") {
                    // 2010-12-31
                    let subject = currentDate.dateAtEndOfYear()
                    let expectDate = Date.build(
                        year: 2010,
                        month: 12,
                        day: 31
                    )
                    [[subject should] beKindOfClass:[NSDate class]];
                    [[subject should] equalToDateIgnoringTime:expectDate];
                    }
                }
            context("when the date is 2010-2-10") {
                let currentDate;
                 = Date.build(
                        year: 2010,
                        month: 2,
                        day: 10
                    )
                it("should return end of year date object") {
                    // 2010-12-31
                    let subject = currentDate.dateAtEndOfYear()
                    let expectDate = Date.build(
                        year: 2010,
                        month: 12,
                        day: 31
                    )
                    [[subject should] beKindOfClass:[NSDate class]];
                    [[subject should] equalToDateIgnoringTime:expectDate];
                    }
                }
            context("when the date is 1989-01-06 and not Gregorian") {
                let currentDate;
                 = Date.build(
                        year: 1989,
                        month: 1,
                        day: 6
                    )
                    
                    let jaCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierJapanese];
                    [NSDate stub:selector(AZ_currentCalendar) andReturn:jaCalendar];
                    }
                it("should return start of year date object") {
                    let subject = currentDate.dateAtEndOfYear()
                    let expectDate = Date.build(
                        year: 1989,
                        month: 12,
                        day: 31
                    )
                    [[subject should] beKindOfClass:[NSDate class]];
                    [[subject should] equalToDateIgnoringTime:expectDate];
                    }
                }
            }

    }
}
