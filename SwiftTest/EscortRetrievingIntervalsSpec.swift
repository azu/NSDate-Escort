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
                context("when 5 seconds ago") {
                    let fiveSeconds = 5;
                    let anotherDate = currentDate.add(second: -fiveSeconds)
                    
                    it("should return 5") {
                        let seconds = currentDate.seconds(after: anotherDate)
                        expect(seconds).to(equal(fiveSeconds))
                    }
                }
                context("when 10 minutes ago") {
                    let tenMinutes = 10;
                    let anotherDate = currentDate.add(minute: -tenMinutes)
                    
                    it("should return 10") {
                        let minutes = currentDate.minutes(after: anotherDate)
                        expect(minutes).to(equal(tenMinutes))
                    }
                }
                context("when 1 hour ago") {
                    let oneHour = 1;
                    let anotherDate = currentDate.add(hour: -oneHour)
                    
                    it("should return 60") {
                        let minutes = currentDate.minutes(after: anotherDate)
                        expect(minutes).to(equal(60))
                    }
                }
                context("when 10 minutes later") {
                    let tenMinutes = 10;
                    let anotherDate = currentDate.add(minute:  tenMinutes)
                    
                    it("should return -10") {
                        let minutes = currentDate.minutes(after: anotherDate)
                        expect(minutes).to(equal(-tenMinutes))
                    }
                }
                context("when 5 seconds later") {
                    let fiveSeconds = 5;
                    let anotherDate = currentDate.add(second: fiveSeconds)
                    
                    it("should return -5") {
                        let seconds = currentDate.seconds(after: anotherDate)
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
                context("when 5 second later") {
                    let fiveSecond = 5;
                    let anotherDate = currentDate.add(second: fiveSecond)
                    
                    it("should return 5") {
                        let seconds = currentDate.seconds(before: anotherDate)
                        expect(seconds).to(equal(fiveSecond))
                    }
                }
                context("when 10 minutes later") {
                    let tenMinutes = 10;
                    let anotherDate = currentDate.add(minute:  tenMinutes)
                    
                    it("should return 10") {
                        let minutes = currentDate.minutes(before: anotherDate)
                        expect(minutes).to(equal(tenMinutes))
                    }
                }
                context("when 1 hour later") {
                    let oneHour = 1;
                    let anotherDate = currentDate.add(hour: oneHour)
                    
                    it("should return 60") {
                        let minutes = currentDate.minutes(before: anotherDate)
                        expect(minutes).to(equal(60))
                    }
                }
                context("when 10 minutes ago") {
                    let tenMinutes = 10;
                    let anotherDate = currentDate.add(minute: -tenMinutes)
                    
                    it("should return -10") {
                        let minutes = currentDate.minutes(before: anotherDate)
                        expect(minutes).to(equal(-tenMinutes))
                    }
                }
                context("when 5 seconds ago") {
                    let fiveSeconds = 5;
                    let anotherDate = currentDate.add(second: -fiveSeconds)
                    
                    it("should return -5") {
                        let seconds = currentDate.seconds(before: anotherDate)
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
                context("when 1 hour ago") {
                    let oneHour = 1;
                    let anotherDate = currentDate.add(hour: -oneHour)
                    
                    it("should return 1") {
                        let result = currentDate.hours(after: anotherDate)
                        expect(result).to(equal(oneHour))
                    }
                }
                context("when 1 day ago") {
                    let oneDay = 24;
                    let anotherDate = currentDate.add(hour: -oneDay)
                    
                    it("should return 24") {
                        let result = currentDate.hours(after: anotherDate)
                        expect(result).to(equal(oneDay))
                    }
                }
                context("when 1 hour later") {
                    let oneHour = 1;
                    let anotherDate = currentDate.add(hour: oneHour)
                    
                    it("should return -1") {
                        let result = currentDate.hours(after: anotherDate)
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
                context("when 1 hour later") {
                    let oneHour = 1;
                    let anotherDate = currentDate.add(hour: oneHour)
                    
                    it("should return 1") {
                        let result = currentDate.hours(before: anotherDate)
                        expect(result).to(equal(oneHour))
                    }
                }
                context("when 1 day later") {
                    let oneDay = 24;
                    let anotherDate = currentDate.add(hour: oneDay)
                    
                    it("should return 24") {
                        let result = currentDate.hours(before: anotherDate)
                        expect(result).to(equal(oneDay))
                    }
                }
                context("when 1 hour ago") {
                    let oneHour = 1;
                    let anotherDate = currentDate.add(hour: -oneHour)
                    
                    it("should return -1") {
                        let result = currentDate.hours(before: anotherDate)
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
                context("when 1 day ago") {
                    let oneDay = 1;
                    let anotherDate = currentDate.add(day: -oneDay)
                    
                    it("should return 1") {
                        let day = currentDate.days(after: anotherDate)
                        expect(day).to(equal(oneDay))
                    }
                }
                context("when 1 day later") {
                    let oneDay = 1;
                    let anotherDate = currentDate.add(day: oneDay)
                    
                    it("should return -1") {
                        let day = currentDate.days(after: anotherDate)
                        expect(day).to(equal(-oneDay))
                    }
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
                context("when 1 day ago") {
                    let oneDay = 1;
                    let anotherDate = currentDate.add(day: -oneDay)
                    
                    it("should return -1") {
                        let day = currentDate.days(before: anotherDate)
                        expect(day).to(equal(-oneDay))
                    }
                }
                context("when 1 day later") {
                    let oneDay = 1;
                    let anotherDate = currentDate.add(day: oneDay)
                    
                    it("should return 1") {
                        let day = currentDate.days(before: anotherDate)
                        expect(day).to(equal(oneDay))
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
                context("same date") {
                    it("should return 0") {
                        let day = currentDate.months(after: currentDate)
                        expect(day).to(equal(0))
                    }
                }
                context("when 1 months ago") {
                    let oneMonth = 1;
                    let anotherDate = currentDate.add(month: -oneMonth)
                    
                    it("should return 1") {
                        let day = currentDate.months(after: anotherDate)
                        expect(day).to(equal(oneMonth))
                    }
                }
                context("when 1 months ago and 1 second later") {
                    let oneMonth = 1;
                    let oneSecond = 1;
                    let anotherDate = currentDate.add(month: -oneMonth).add(second: oneSecond)
                    
                    it("should return 0") {
                        let day = currentDate.months(after: anotherDate)
                        expect(day).to(equal(0))
                    }
                }
                context("when 1 month later") {
                    let oneMonth = 1;
                    let anotherDate = currentDate.add(month: oneMonth)
                    
                    it("should return -1") {
                        let day = currentDate.months(after: anotherDate)
                        expect(day).to(equal(-oneMonth))
                    }
                }
                context("when 1 month later and 1second ago") {
                    let oneMonth = 1;
                    let oneSecond = 1;
                    let anotherDate = currentDate.add(month: oneMonth).add(second: -oneSecond)
                    
                    it("should return 0") {
                        let day = currentDate.months(after: anotherDate)
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
                context("same date") {
                    it("should return 0") {
                        let day = currentDate.months(before: currentDate)
                        expect(day).to(equal(0))
                    }
                }
                context("when 1 months ago") {
                    let oneMonth = 1;
                    let anotherDate = currentDate.add(month: -oneMonth)
                    
                    it("should return -1") {
                        let day = currentDate.months(before: anotherDate)
                        expect(day).to(equal(-oneMonth))
                    }
                }
                context("when 1 months ago and 1 second later") {
                    let oneMonth = 1;
                    let oneSecond = 1;
                    let anotherDate = currentDate.add(month: -oneMonth).add(second: oneSecond)
                    
                    it("should return 0") {
                        let day = currentDate.months(before: anotherDate)
                        expect(day).to(equal(0))
                    }
                }
                context("when 1 month later") {
                    let oneMonth = 1;
                    let anotherDate = currentDate.add(month: oneMonth)
                    
                    it("should return 1") {
                        let day = currentDate.months(before: anotherDate)
                        expect(day).to(equal(oneMonth))
                    }
                }
                context("when 1 month later and 1second ago") {
                    let oneMonth = 1;
                    let oneSecond = 1;
                    let anotherDate = currentDate.add(month: oneMonth).add(second: -oneSecond)
                    
                    it("should return 0") {
                        let day = currentDate.months(before: anotherDate)
                        expect(day).to(equal(0))
                    }
                }
                context("when 365 days later") {
                    let day365 = 365;
                    let anotherDate = currentDate.add(day: day365)
                    
                    it("should return 12") {
                        let day = currentDate.months(before: anotherDate)
                        expect(day).to(equal(12))
                    }
                }
            }
        }
    
    /*
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

                    it("should return 10") {
                        let distanceDays = currentDate.distanceInDaysToDate(anotherDate)
                        expect(distanceDays).to(equal(expectDays))
                        }
                    }
                // big days
                context("when another date is 400 days later") {
                    let expectDays = 400 = currentDate.add(day: expectDays)

                    it("should return 100") {
                        let distanceDays = currentDate.distanceInDaysToDate(anotherDate)
                        expect(distanceDays).to(equal(expectDays))
                        }
                    }
                context("when another date is 10 days ago") {
                    let expectDays = 10 = currentDate.add(day: -expectDays)

                    it("should return -10") {
                        let distanceDays = currentDate.distanceInDaysToDate(anotherDate)
                        expect(distanceDays).to(equal(-expectDays))
                        }
                    }
                }
            }
*/
    }
}
