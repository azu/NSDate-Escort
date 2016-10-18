//
//  EscortRetrievingIntervalsSpec.swift
//  NSDate-Escort
//
//  Created by akuraru on 2016/10/13.
//
//

import Foundation
import Quick
import Nimble

class EscortRetrievingIntervalsSpec: QuickSpec {
    override func spec() {
        describe("-minutesAfterDate") {
            context("the date is 2010-10-10 10:10:10") {
                let currentDate = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10,
                        hour: 10,
                        minute: 10,
                        second: 10
                    )
                    
                    }
                context("when 5 seconds ago") {
                    int fiveSeconds = 5;
                    let anotherDate = currentDate.dateBySubtractingSeconds(fiveSeconds)
                        }
                    it("should return 5") {
                        let seconds = currentDate.secondsAfterDate(anotherDate)
                        expect(seconds).to(equal(fiveSeconds))
                        }
                    }
                context("when 10 minutes ago") {
                    int tenMinutes = 10;
                    let anotherDate = currentDate.dateBySubtractingMinutes(tenMinutes)
                        }
                    it("should return 10") {
                        let minutes = currentDate.minutesAfterDate(anotherDate)
                        expect(minutes).to(equal(tenMinutes))
                        }
                    }
                context("when 1 hour ago") {
                    int oneHour = 1;
                    let anotherDate = currentDate.dateBySubtractingHours(oneHour)
                        }
                    it("should return 60") {
                        let minutes = currentDate.minutesAfterDate(anotherDate)
                        expect(minutes).to(equal(60))
                        }
                    }
                context("when 10 minutes later") {
                    int tenMinutes = 10;
                    let anotherDate = currentDate.add(minute:  tenMinutes)
                        }
                    it("should return -10") {
                        let minutes = currentDate.minutesAfterDate(anotherDate)
                        expect(minutes).to(equal(-tenMinutes))
                        }
                    }
                context("when 5 seconds later") {
                    int fiveSeconds = 5;
                    let anotherDate = currentDate.add(second: fiveSeconds)
                        }
                    it("should return -5") {
                        let seconds = currentDate.secondsAfterDate(anotherDate)
                        expect(seconds).to(equal(-fiveSeconds))
                        }
                    }
                }
            }
        
        describe("-minutesBeforeDate") {
            context("the date is 2010-10-10 10:10:10") {
                let currentDate = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10,
                        hour: 10,
                        minute: 10,
                        second: 10
                    )
                    
                    }
                context("when 5 second later") {
                    int fiveSecond = 5;
                    let anotherDate = currentDate.add(second: fiveSecond)
                        }
                    it("should return 5") {
                        let seconds = currentDate.secondsBeforeDate(anotherDate)
                        expect(seconds).to(equal(fiveSecond))
                        }
                    }
                context("when 10 minutes later") {
                    int tenMinutes = 10;
                    let anotherDate = currentDate.add(minute:  tenMinutes)
                        }
                    it("should return 10") {
                        let minutes = currentDate.minutesBeforeDate(anotherDate)
                        expect(minutes).to(equal(tenMinutes))
                        }
                    }
                context("when 1 hour later") {
                    int oneHour = 1;
                    let anotherDate = currentDate.dateByAddingHours(oneHour)
                        }
                    it("should return 60") {
                        let minutes = currentDate.minutesBeforeDate(anotherDate)
                        expect(minutes).to(equal(60))
                        }
                    }
                context("when 10 minutes ago") {
                    int tenMinutes = 10;
                    let anotherDate = currentDate.dateBySubtractingMinutes(tenMinutes)
                        }
                    it("should return -10") {
                        let minutes = currentDate.minutesBeforeDate(anotherDate)
                        expect(minutes).to(equal(-tenMinutes))
                        }
                    }
                context("when 5 seconds ago") {
                    int fiveSeconds = 5;
                    let anotherDate = currentDate.dateBySubtractingSeconds(fiveSeconds)
                        }
                    it("should return -5") {
                        let seconds = currentDate.secondsBeforeDate(anotherDate)
                        expect(seconds).to(equal(-fiveSeconds))
                        }
                    }
                }
            }
        
        describe("-hoursAfterDate") {
            context("the date is 2010-10-10 10:10:10") {
                let currentDate = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10,
                        hour: 10,
                        minute: 10,
                        second: 10
                    )
                    
                    }
                context("when 1 hour ago") {
                    int oneHour = 1;
                    let anotherDate = currentDate.dateBySubtractingHours(oneHour)
                        }
                    it("should return 1") {
                        let result = currentDate.hoursAfterDate(anotherDate)
                        expect(result).to(equal(oneHour))
                        }
                    }
                context("when 1 day ago") {
                    int oneDay = 24;
                    let anotherDate = currentDate.dateBySubtractingHours(oneDay)
                        }
                    it("should return 24") {
                        let result = currentDate.hoursAfterDate(anotherDate)
                        expect(result).to(equal(oneDay))
                        }
                    }
                context("when 1 hour later") {
                    int oneHour = 1;
                    let anotherDate = currentDate.dateByAddingHours(oneHour)
                        }
                    it("should return -1") {
                        let result = currentDate.hoursAfterDate(anotherDate)
                        expect(result).to(equal(-oneHour))
                        }
                    }
                }
            }
        
        describe("-hoursBeforeDate") {
            context("the date is 2010-10-10 10:10:10") {
                let currentDate = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10,
                        hour: 10,
                        minute: 10,
                        second: 10
                    )
                    
                    }
                context("when 1 hour later") {
                    int oneHour = 1;
                    let anotherDate = currentDate.dateByAddingHours(oneHour)
                        }
                    it("should return 1") {
                        let result = currentDate.hoursBeforeDate(anotherDate)
                        expect(result).to(equal(oneHour))
                        }
                    }
                context("when 1 day later") {
                    int oneDay = 24;
                    let anotherDate = currentDate.dateByAddingHours(oneDay)
                        }
                    it("should return 24") {
                        let result = currentDate.hoursBeforeDate(anotherDate)
                        expect(result).to(equal(oneDay))
                        }
                    }
                context("when 1 hour ago") {
                    int oneHour = 1;
                    let anotherDate = currentDate.dateBySubtractingHours(oneHour)
                        }
                    it("should return -1") {
                        let result = currentDate.hoursBeforeDate(anotherDate)
                        expect(result).to(equal(-oneHour))
                        }
                    }
                }
            }
        
        
        describe("-daysAfterDate") {
            context("the date is 2010-10-10 10:10:10") {
                let currentDate = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10,
                        hour: 10,
                        minute: 10,
                        second: 10
                    )
                    
                    }
                context("when 1 day ago") {
                    int oneDay = 1;
                    let anotherDate = currentDate.dateBySubtractingDays(oneDay)
                        }
                    it("should return 1") {
                        let day = currentDate.daysAfterDate(anotherDate)
                        expect(day).to(equal(oneDay))
                        }
                    }
                context("when 1 day later") {
                    int oneDay = 1;
                    let anotherDate = currentDate.add(day: oneDay)
                        }
                    it("should return -1") {
                        let day = currentDate.daysAfterDate(anotherDate)
                        expect(day).to(equal(-oneDay))
                        }
                    }
                }
            
            // Set the date to 29th March 2015 01:00 (the day daylight savings ends)
            context("the date is 2015-03-29 00:00:00 in ") {
                let currentDate;
                let anotherDate;
                 timeZone = [NSTimeZone timeZoneWithName:"Europe/London"];
                    [NSTimeZone stub:selector(defaultTimeZone) andReturn:timeZone];
                    let calendar = NSCalendar.calendarWithIdentifier(NSCalendarIdentifierGregorian)
                    [NSDate stub:selector(AZ_currentCalendar) andReturn:calendar];
                    
                    
                    currentDate = Date.build(
                    year: 2015,
                    month: 3,
                    day: 29
                    )
                    anotherDate = Date.build(
                    year: 2015,
                    month: 3,
                    day: 30
                    )
                it("should return 82800 seconds") {
                    let diff = currentDate.timeIntervalSinceDate(anotherDate)
                    expect(diff).to(equal(-82800))
                    }
                it("should return 1") {
                    let diff = currentDate.daysBeforeDate(anotherDate)
                    expect(diff).to(equal(1))
                    }
                }
            }
        
        describe("-daysBeforeDate") {
            context("the date is 2010-10-10 10:10:10") {
                let currentDate = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10,
                        hour: 10,
                        minute: 10,
                        second: 10
                    )
                    
                    }
                context("when 1 day ago") {
                    int oneDay = 1;
                    let anotherDate = currentDate.dateBySubtractingDays(oneDay)
                        }
                    it("should return -1") {
                        let day = currentDate.daysBeforeDate(anotherDate)
                        expect(day).to(equal(-oneDay))
                        }
                    }
                context("when 1 day later") {
                    int oneDay = 1;
                    let anotherDate = currentDate.add(day: oneDay)
                        }
                    it("should return 1") {
                        let day = currentDate.daysBeforeDate(anotherDate)
                        expect(day).to(equal(oneDay))
                        }
                    }
                }
            context("the date is 2015-03-29 00:00:00") {
                let currentDate;
                 timeZone = [NSTimeZone timeZoneWithName:"Europe/London"];
                    [NSTimeZone stub:selector(defaultTimeZone) andReturn:timeZone];
                    let calendar = NSCalendar.calendarWithIdentifier(NSCalendarIdentifierGregorian)
                    [NSDate stub:selector(AZ_currentCalendar) andReturn:calendar];
                    
                    currentDate = Date.build(
                    year: 2015,
                    month: 3,
                    day: 29
                    )
                context("when day ago") {
                    int oneDay = 1;
                    let anotherDate = currentDate.add(day: oneDay)
                        }
                    it("should return 1") {
                        let diff = currentDate.daysAfterDate(anotherDate)
                        expect(diff).to(equal(-oneDay))
                        }
                    }
                }
            }
        
        describe("-monthsBeforeDate") {
            context("the date is 2010-10-10 10:10:10") {
                let currentDate = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10,
                        hour: 10,
                        minute: 10,
                        second: 10
                    )
                    
                    }
                context("same date") {
                    it("should return 0") {
                        let day = currentDate.monthsAfterDate(currentDate)
                        expect(day).to(equal(0))
                        }
                    }
                context("when 1 months ago") {
                    int oneMonth = 1;
                    let anotherDate = currentDate.dateBySubtractingMonths(oneMonth)
                        }
                    it("should return 1") {
                        let day = currentDate.monthsAfterDate(anotherDate)
                        expect(day).to(equal(oneMonth))
                        }
                    }
                context("when 1 months ago and 1 second later") {
                    int oneMonth = 1;
                    int oneSecond = 1;
                    let anotherDate = [[currentDate dateBySubtractingMonths:oneMonth] dateByAddingTimeInterval:oneSecond];
                        }
                    it("should return 0") {
                        let day = currentDate.monthsAfterDate(anotherDate)
                        expect(day).to(equal(0))
                        }
                    }
                context("when 1 month later") {
                    int oneMonth = 1;
                    let anotherDate = currentDate.add(month: oneMonth)
                        }
                    it("should return -1") {
                        let day = currentDate.monthsAfterDate(anotherDate)
                        expect(day).to(equal(-oneMonth))
                        }
                    }
                context("when 1 month later and 1second ago") {
                    int oneMonth = 1;
                    int oneSecond = 1;
                    let anotherDate = [[currentDate dateByAddingMonths:oneMonth] dateByAddingTimeInterval:-oneSecond];
                        }
                    it("should return 0") {
                        let day = currentDate.monthsAfterDate(anotherDate)
                        expect(day).to(equal(0))
                        }
                    }
                }
            }
        describe("-monthsBeforeDate") {
            context("the date is 2010-10-10 10:10:10") {
                let currentDate = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10,
                        hour: 10,
                        minute: 10,
                        second: 10
                    )
                    
                    }
                context("same date") {
                    it("should return 0") {
                        let day = currentDate.monthsBeforeDate(currentDate)
                        expect(day).to(equal(0))
                        }
                    }
                context("when 1 months ago") {
                    int oneMonth = 1;
                    let anotherDate = currentDate.dateBySubtractingMonths(oneMonth)
                        }
                    it("should return -1") {
                        let day = currentDate.monthsBeforeDate(anotherDate)
                        expect(day).to(equal(-oneMonth))
                        }
                    }
                context("when 1 months ago and 1 second later") {
                    int oneMonth = 1;
                    int oneSecond = 1;
                    let anotherDate = [[currentDate dateBySubtractingMonths:oneMonth] dateByAddingTimeInterval:oneSecond];
                        }
                    it("should return 0") {
                        let day = currentDate.monthsBeforeDate(anotherDate)
                        expect(day).to(equal(0))
                        }
                    }
                context("when 1 month later") {
                    int oneMonth = 1;
                    let anotherDate = currentDate.add(month: oneMonth)
                        }
                    it("should return 1") {
                        let day = currentDate.monthsBeforeDate(anotherDate)
                        expect(day).to(equal(oneMonth))
                        }
                    }
                context("when 1 month later and 1second ago") {
                    int oneMonth = 1;
                    int oneSecond = 1;
                    let anotherDate = [[currentDate dateByAddingMonths:oneMonth] dateByAddingTimeInterval:-oneSecond];
                        }
                    it("should return 0") {
                        let day = currentDate.monthsBeforeDate(anotherDate)
                        expect(day).to(equal(0))
                        }
                    }
                context("when 365 days later") {
                    int day365 = 365;
                    let anotherDate = currentDate.add(day: day365)
                        }
                    it("should return 12") {
                        let day = currentDate.monthsBeforeDate(anotherDate)
                        expect(day).to(equal(12))
                        }
                    }
                }
            context("when the date'calendar is not Gregorian") {
                let jaCalendar;
                let currentDate = Date.build(
                        year: 1988,
                        month: 10,
                        day: 10
                    )
                    // +currentCalendar overwrite NSCalendarIdentifierJapanese.
                    jaCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierJapanese];
                    [NSDate stub:selector(AZ_currentCalendar) andReturn:jaCalendar];
                    }
                context("difference between Shouwa 64 and Heisei 1 is 1") {
                    let anotherDate = Date.build(
                            year: 1989,
                            month: 10,
                            day: 10
                        )
                    it("currentDate year is 63") {
                        expect(currentDate.year).to(equal(63))
                        }
                    it("anotherDate year is 1") {
                        expect(anotherDate.year).to(equal(1))
                        }
                    it("monthsBeforeaDate is 12") () {
                        let months = currentDate.monthsBeforeDate(anotherDate)
                        expect(months).to(equal(12))
                        }
                    
                    }
                }
            }
        
        describe("-distanceInDaysToDate") {
            context("the date 2010-10-10, ") {
                NSDate *currentDate;
                let anotherDate;
                beforeEach(^{
                    currentDate = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10,
                        hour: 10,
                        minute: 10,
                        second: 10
                    )
                context("when another date is same date") {
                    it("should return 0") {
                        let expectDays = 0;
                        let distanceDays = currentDate.distanceInDaysToDate(currentDate)
                        expect(distanceDays).to(equal(expectDays))
                        }
                    }
                context("when another date is 10 days later") {
                    let expectDays = 10 = currentDate.add(day: expectDays)
                        }
                    it("should return 10") {
                        let distanceDays = currentDate.distanceInDaysToDate(anotherDate)
                        expect(distanceDays).to(equal(expectDays))
                        }
                    }
                // big days
                context("when another date is 400 days later") {
                    let expectDays = 400 = currentDate.add(day: expectDays)
                        }
                    it("should return 100") {
                        let distanceDays = currentDate.distanceInDaysToDate(anotherDate)
                        expect(distanceDays).to(equal(expectDays))
                        }
                    }
                context("when another date is 10 days ago") {
                    let expectDays = 10 = currentDate.dateBySubtractingDays(expectDays)
                        }
                    it("should return -10") {
                        let distanceDays = currentDate.distanceInDaysToDate(anotherDate)
                        expect(distanceDays).to(equal(-expectDays))
                        }
                    }
                }
            }
    }
}
