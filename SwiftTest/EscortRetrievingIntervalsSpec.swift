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
        beforeEach {
            let calendarIdentifier = Calendar.Identifier.gregorian
            Date.setDefault(calendarIdentifier)
            NSTimeZone.default = TimeZone(identifier: "Asia/Tokyo")!
        }
        describe("-minutesAfterDate") {
            context("the date is 2010-10-10 10:10:10") {
                var currentDate = Date()
                beforeEach {
                    currentDate = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10,
                        hour: 10,
                        minute: 10,
                        second: 10
                    )
                }
                context("when 5 seconds ago") {
                    it("should return 5") {
                        let fiveSeconds = 5;
                        let anotherDate = currentDate.add(second: -fiveSeconds)
                        
                        let seconds = currentDate.seconds(after: anotherDate)
                        expect(seconds).to(equal(fiveSeconds))
                    }
                }
                context("when 10 minutes ago") {
                    it("should return 10") {
                        let tenMinutes = 10;
                        let anotherDate = currentDate.add(minute: -tenMinutes)
                        
                        let minutes = currentDate.minutes(after: anotherDate)
                        expect(minutes).to(equal(tenMinutes))
                    }
                }
                context("when 1 hour ago") {
                    it("should return 60") {
                        let oneHour = 1;
                        let anotherDate = currentDate.add(hour: -oneHour)
                        
                        let minutes = currentDate.minutes(after: anotherDate)
                        expect(minutes).to(equal(60))
                    }
                }
                context("when 10 minutes later") {
                    it("should return -10") {
                        let tenMinutes = 10;
                        let anotherDate = currentDate.add(minute:  tenMinutes)
                        
                        let minutes = currentDate.minutes(after: anotherDate)
                        expect(minutes).to(equal(-tenMinutes))
                    }
                }
                context("when 5 seconds later") {
                    it("should return -5") {
                        let fiveSeconds = 5;
                        let anotherDate = currentDate.add(second: fiveSeconds)
                        
                        let seconds = currentDate.seconds(after: anotherDate)
                        expect(seconds).to(equal(-fiveSeconds))
                    }
                }
            }
        }
        describe("-minutesBeforeDate") {
            context("the date is 2010-10-10 10:10:10") {
                var currentDate = Date()
                beforeEach {
                    currentDate = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10,
                        hour: 10,
                        minute: 10,
                        second: 10
                    )
                }
                context("when 5 second later") {
                    it("should return 5") {
                        let fiveSecond = 5;
                        let anotherDate = currentDate.add(second: fiveSecond)
                        
                        let seconds = currentDate.seconds(before: anotherDate)
                        expect(seconds).to(equal(fiveSecond))
                    }
                }
                context("when 10 minutes later") {
                    it("should return 10") {
                        let tenMinutes = 10;
                        let anotherDate = currentDate.add(minute:  tenMinutes)
                        
                        let minutes = currentDate.minutes(before: anotherDate)
                        expect(minutes).to(equal(tenMinutes))
                    }
                }
                context("when 1 hour later") {
                    it("should return 60") {
                        let oneHour = 1;
                        let anotherDate = currentDate.add(hour: oneHour)
                        
                        let minutes = currentDate.minutes(before: anotherDate)
                        expect(minutes).to(equal(60))
                    }
                }
                context("when 10 minutes ago") {
                    it("should return -10") {
                        let tenMinutes = 10;
                        let anotherDate = currentDate.add(minute: -tenMinutes)
                        
                        let minutes = currentDate.minutes(before: anotherDate)
                        expect(minutes).to(equal(-tenMinutes))
                    }
                }
                context("when 5 seconds ago") {
                    it("should return -5") {
                        let fiveSeconds = 5;
                        let anotherDate = currentDate.add(second: -fiveSeconds)
                        
                        let seconds = currentDate.seconds(before: anotherDate)
                        expect(seconds).to(equal(-fiveSeconds))
                    }
                }
            }
        }
        
        describe("-hoursAfterDate") {
            context("the date is 2010-10-10 10:10:10") {
                var currentDate = Date()
                beforeEach {
                    currentDate = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10,
                        hour: 10,
                        minute: 10,
                        second: 10
                    )
                }
                context("when 1 hour ago") {
                    it("should return 1") {
                        let oneHour = 1;
                        let anotherDate = currentDate.add(hour: -oneHour)
                        
                        let result = currentDate.hours(after: anotherDate)
                        expect(result).to(equal(oneHour))
                    }
                }
                context("when 1 day ago") {
                    it("should return 24") {
                        let oneDay = 24;
                        let anotherDate = currentDate.add(hour: -oneDay)
                        
                        let result = currentDate.hours(after: anotherDate)
                        expect(result).to(equal(oneDay))
                    }
                }
                context("when 1 hour later") {
                    it("should return -1") {
                        let oneHour = 1;
                        let anotherDate = currentDate.add(hour: oneHour)
                        
                        let result = currentDate.hours(after: anotherDate)
                        expect(result).to(equal(-oneHour))
                    }
                }
            }
        }
        
        describe("-hoursBeforeDate") {
            context("the date is 2010-10-10 10:10:10") {
                var currentDate = Date()
                beforeEach {
                    currentDate = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10,
                        hour: 10,
                        minute: 10,
                        second: 10
                    )
                }
                context("when 1 hour later") {
                    it("should return 1") {
                        let oneHour = 1;
                        let anotherDate = currentDate.add(hour: oneHour)
                        
                        let result = currentDate.hours(before: anotherDate)
                        expect(result).to(equal(oneHour))
                    }
                }
                context("when 1 day later") {
                    it("should return 24") {
                        let oneDay = 24;
                        let anotherDate = currentDate.add(hour: oneDay)
                        
                        let result = currentDate.hours(before: anotherDate)
                        expect(result).to(equal(oneDay))
                    }
                }
                context("when 1 hour ago") {
                    it("should return -1") {
                        let oneHour = 1;
                        let anotherDate = currentDate.add(hour: -oneHour)
                        
                        let result = currentDate.hours(before: anotherDate)
                        expect(result).to(equal(-oneHour))
                    }
                }
            }
        }
        
        
        describe("-daysAfterDate") {
            context("the date is 2010-10-10 10:10:10") {
                var currentDate = Date()
                beforeEach {
                    currentDate = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10,
                        hour: 10,
                        minute: 10,
                        second: 10
                    )
                }
                context("when 1 day ago") {
                    let oneDay = 1;
                    var anotherDate = Date()
                    beforeEach {
                        anotherDate = currentDate.add(day: -oneDay)
                    }
                    it("should return 86400 seconds") {
                        let seconds = currentDate.seconds(after: anotherDate)
                        expect(seconds).to(equal(86400))
                    }
                    it("should return 1") {
                        let day = currentDate.days(after: anotherDate)
                        expect(day).to(equal(oneDay))
                    }
                }
                context("when 1 day later") {
                    it("should return -1") {
                        let oneDay = 1;
                        let anotherDate = currentDate.add(day: oneDay)
                        
                        let day = currentDate.days(after: anotherDate)
                        expect(day).to(equal(-oneDay))
                    }
                }
            }
            
            // Set the date to 29th March 2015 01:00 (the day daylight savings ends)
            context("the date is 2015-03-29 00:00:00 in ") {
                var currentDate = Date()
                var anotherDate = Date()
                beforeEach {
                    NSTimeZone.default = TimeZone(identifier: "Europe/London")!
                    
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
                }
                it("should return 82800 seconds") {
                    let diff = currentDate.seconds(after: anotherDate)
                    expect(diff).to(equal(-82800))
                }
                it("should return 1") {
                    let diff = currentDate.days(after: anotherDate)
                    expect(diff).to(equal(-1))
                }
            }
        }
        
        describe("-daysBeforeDate") {
            context("the date is 2010-10-10 10:10:10") {
                var currentDate = Date()
                beforeEach {
                    currentDate = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10,
                        hour: 10,
                        minute: 10,
                        second: 10
                    )
                }
                context("when 1 day ago") {
                    it("should return -1") {
                        let oneDay = 1;
                        let anotherDate = currentDate.add(day: -oneDay)
                        
                        let day = currentDate.days(before: anotherDate)
                        expect(day).to(equal(-oneDay))
                    }
                }
                context("when 1 day later") {
                    it("should return 1") {
                        let oneDay = 1;
                        let anotherDate = currentDate.add(day: oneDay)
                        
                        let day = currentDate.days(before: anotherDate)
                        expect(day).to(equal(oneDay))
                    }
                }
            }
        }
        
        describe("-monthsBeforeDate") {
            context("the date is 2010-10-10 10:10:10") {
                var currentDate = Date()
                beforeEach {
                    currentDate = Date.build(
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
                        let day = currentDate.months(after: currentDate)
                        expect(day).to(equal(0))
                    }
                }
                context("when 1 months ago") {
                    it("should return 1") {
                        let oneMonth = 1;
                        let anotherDate = currentDate.add(month: -oneMonth)
                        
                        let day = currentDate.months(after: anotherDate)
                        expect(day).to(equal(oneMonth))
                    }
                }
                context("when 1 months ago and 1 second later") {
                    it("should return 0") {
                        let oneMonth = 1;
                        let oneSecond = 1;
                        let anotherDate = currentDate.add(month: -oneMonth).add(second: oneSecond)
                        
                        let day = currentDate.months(after: anotherDate)
                        expect(day).to(equal(0))
                    }
                }
                context("when 1 month later") {
                    it("should return -1") {
                        let oneMonth = 1;
                        let anotherDate = currentDate.add(month: oneMonth)
                        
                        let day = currentDate.months(after: anotherDate)
                        expect(day).to(equal(-oneMonth))
                    }
                }
                context("when 1 month later and 1second ago") {
                    it("should return 0") {
                        let oneMonth = 1;
                        let oneSecond = 1;
                        let anotherDate = currentDate.add(month: oneMonth).add(second: -oneSecond)
                        
                        let day = currentDate.months(after: anotherDate)
                        expect(day).to(equal(0))
                    }
                }
            }
        }
        describe("-monthsBeforeDate") {
            context("the date is 2010-10-10 10:10:10") {
                var currentDate = Date()
                beforeEach {
                    currentDate = Date.build(
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
                        let day = currentDate.months(before: currentDate)
                        expect(day).to(equal(0))
                    }
                }
                context("when 1 months ago") {
                    it("should return -1") {
                        let oneMonth = 1;
                        let anotherDate = currentDate.add(month: -oneMonth)
                        
                        let day = currentDate.months(before: anotherDate)
                        expect(day).to(equal(-oneMonth))
                    }
                }
                context("when 1 months ago and 1 second later") {
                    it("should return 0") {
                        let oneMonth = 1;
                        let oneSecond = 1;
                        let anotherDate = currentDate.add(month: -oneMonth).add(second: oneSecond)
                        
                        let day = currentDate.months(before: anotherDate)
                        expect(day).to(equal(0))
                    }
                }
                context("when 1 month later") {
                    it("should return 1") {
                        let oneMonth = 1;
                        let anotherDate = currentDate.add(month: oneMonth)
                        
                        let day = currentDate.months(before: anotherDate)
                        expect(day).to(equal(oneMonth))
                    }
                }
                context("when 1 month later and 1second ago") {
                    it("should return 0") {
                        let oneMonth = 1;
                        let oneSecond = 1;
                        let anotherDate = currentDate.add(month: oneMonth).add(second: -oneSecond)
                        
                        let day = currentDate.months(before: anotherDate)
                        expect(day).to(equal(0))
                    }
                }
                context("when 365 days later") {
                    it("should return 12") {
                        let day365 = 365;
                        let anotherDate = currentDate.add(day: day365)
                        
                        let day = currentDate.months(before: anotherDate)
                        expect(day).to(equal(12))
                    }
                }
            }
        }
        
        describe("-distanceInDaysToDate") {
            context("the date 2010-10-10, ") {
                var currentDate = Date()
                beforeEach {
                    currentDate = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10,
                        hour: 10,
                        minute: 10,
                        second: 10
                    )
                }
                context("when another date is same date") {
                    it("should return 0") {
                        let expectDays = 0;
                        let distanceDays = currentDate.distanceInDays(to: currentDate)
                        expect(distanceDays).to(equal(expectDays))
                    }
                }
                context("when another date is 10 days later") {
                    it("should return 10") {
                        let expectDays = 10
                        let anotherDate = currentDate.add(day: expectDays)
                        
                        let distanceDays = currentDate.distanceInDays(to: anotherDate)
                        expect(distanceDays).to(equal(expectDays))
                    }
                }
                // big days
                context("when another date is 400 days later") {
                    it("should return 100") {
                        let expectDays = 400
                        let anotherDate = currentDate.add(day: expectDays)
                        
                        let distanceDays = currentDate.distanceInDays(to: anotherDate)
                        expect(distanceDays).to(equal(expectDays))
                    }
                }
                context("when another date is 10 days ago") {
                    it("should return -10") {
                        let expectDays = 10
                        let anotherDate = currentDate.add(day: -expectDays)
                        
                        let distanceDays = currentDate.distanceInDays(to: anotherDate)
                        expect(distanceDays).to(equal(-expectDays))
                    }
                }
            }
        }
    }
}
