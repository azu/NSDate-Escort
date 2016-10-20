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
                let currentDate = Date.build(
                    year: 2010,
                    month: 10,
                    day: 10
                )
                context("adding 0 year") {
                    let subject = currentDate.add(year: 0)
                    it("should return 2010-10-10") {
                        expect(subject).to(approximatelyEqual(currentDate))
                    }
                    context("adding 1 year") {
                        let subject = currentDate.add(year: 1)
                        it("should return 2011-10-10") {
                            let expectDate = Date.build(
                                year: 2011,
                                month: 10,
                                day: 10
                            )
                            expect(subject).to(approximatelyEqual(expectDate))
                        }
                    }
                }
                context("adding -1 year") {
                    let subject = currentDate.add(year: -1)
                    it("should return 2009-10-10") {
                        let expectDate = Date.build(
                            year: 2009,
                            month: 10,
                            day: 10
                        )
                        expect(subject).to(approximatelyEqual(expectDate))
                    }
                }
            }
        }
        describe("-dateByAddingMonths") {
            context("when the date is 2010-10-10") {
                let currentDate = Date.build(
                    year: 2010,
                    month: 10,
                    day: 10
                )
                context("adding 0 month") {
                    let subject = currentDate.add(month: 0)
                    it("should return 2010-10-10") {
                        expect(subject).to(approximatelyEqual(currentDate))
                    }
                }
                context("adding 1 month") {
                    let subject = currentDate.add(month: 1)
                    it("should return 2010-11-10") {
                        let expectDate = Date.build(
                            year: 2010,
                            month: 11,
                            day: 10
                        )
                        expect(subject).to(approximatelyEqual(expectDate))
                    }
                }
                context("adding -1 month") {
                    let subject = currentDate.add(month: -1)
                    it("should return 2010-09-10") {
                        let expectDate = Date.build(
                            year: 2010,
                            month: 9,
                            day: 10
                        )
                        expect(subject).to(approximatelyEqual(expectDate))
                    }
                }
            }
        }
        describe("-dateByAddingDays") {
            context("when the date is 2010-10-10") {
                let currentDate = Date.build(
                    year: 2010,
                    month: 10,
                    day: 10
                )
                context("adding 0 Day") {
                    let subject = currentDate.add(day: 0)
                    it("should return 2010-10-10") {
                        expect(subject).to(approximatelyEqual(currentDate))
                    }
                }
                context("adding 1 Day") {
                    let subject = currentDate.add(day: 1)
                    it("should return 2010-10-11") {
                        let expectDate = Date.build(
                            year: 2010,
                            month: 10,
                            day: 11
                        )
                        expect(subject).to(approximatelyEqual(expectDate))
                    }
                }
                context("adding -1 Day") {
                    let subject = currentDate.add(day: -1)
                    it("should return 2010-10-09") {
                        let expectDate = Date.build(
                            year: 2010,
                            month: 10,
                            day: 9
                        )
                        expect(subject).to(approximatelyEqual(expectDate))
                    }
                }
            }
        }
        describe("-dateByAddingHours") {
            context("when the date is 2010-10-10 10:10:10") {
                let currentDate = Date.build(
                    year: 2010,
                    month: 10,
                    day: 10,
                    hour: 10,
                    minute: 10,
                    second: 10
                )
                context("adding 0 hour") {
                    let subject = currentDate.add(hour: 0)
                    it("should return same date") {
                        expect(subject).to(equal(currentDate))
                    }
                }
                context("adding 1 hour") {
                    let dateWithDaysBeforeNow = currentDate.add(hour: 1)
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
                    let subject = currentDate.add(hour: 24)
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
                    let subject = currentDate.add(hour: -1)
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
            }
        }
        describe("-dateByAddingMinutes") {
            context("when the date is 2010-10-10 10:10:10") {
                let currentDate = Date.build(
                    year: 2010,
                    month: 10,
                    day: 10,
                    hour: 10,
                    minute: 10,
                    second: 10
                )
                context("adding 0 minute") {
                    let subject = currentDate.add(minute:  0)
                    it("should return same date") {
                        expect(subject).to(equal(currentDate))
                    }
                }
                context("adding 1 minute") {
                    let subject = currentDate.add(minute:  1)
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
                    let subject = currentDate.add(minute:  60)
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
                    let subject = currentDate.add(minute: -1)
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
        describe("-dateByAddingSounds") {
            context("when the date is 2010-10-10 10:10:10") {
                let currentDate = Date.build(
                    year: 2010,
                    month: 10,
                    day: 10,
                    hour: 10,
                    minute: 10,
                    second: 10
                )
                context("adding 0 second") {
                    let subject = currentDate.add(second: 0)
                    it("should return same date") {
                        expect(subject).to(equal(currentDate))
                    }
                }
                context("adding 1 second") {
                    let subject = currentDate.add(second: 1)
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
                    let subject = currentDate.add(second: 60)
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
                    let subject = currentDate.add(second: -1)
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
        describe("-dateAtStartOfDay") {
            context("when the date is 2010-10-10 00:00:00") {
                let currentDate = Date.build(
                    year: 2010,
                    month: 10,
                    day: 10,
                    hour: 0,
                    minute: 0,
                    second: 0
                )
                
                let subject = currentDate.startOfDay()
                it("should return same date") {
                    expect(subject).to(equal(currentDate))
                }
            }
            context("when the date is 2010-10-10 23:59:59") {
                let currentDate = Date.build(
                    year: 2010,
                    month: 10,
                    day: 10,
                    hour: 23,
                    minute: 59,
                    second: 59
                )
                let subject = currentDate.startOfDay()
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
        }
        describe("-dateAtEndOfDay") {
            context("when the date is 2010-10-10 00:00:00") {
                let currentDate = Date.build(
                    year: 2010,
                    month: 10,
                    day: 10,
                    hour: 0,
                    minute: 0,
                    second: 0
                )
                
                let subject = currentDate.endOfDay()
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
                let currentDate = Date.build(
                    year: 2010,
                    month: 10,
                    day: 10,
                    hour: 23,
                    minute: 59,
                    second: 59
                )
                
                let subject = currentDate.endOfDay()
                it("should return same date") {
                    expect(subject).to(equal(currentDate))
                }
            }
        }
        describe("-dateAtStartOfWeek") {
            context("When the date is 2014-03-04") {
                let currentDate = Date.build(
                    year: 2014,
                    month: 3,
                    day: 4
                )
                
                it("should return start of week date object") {
                    let subject = currentDate.startOfWeek()
                    let expectDate = Date.build(
                        year: 2014,
                        month: 3,
                        day: 2
                    )
                    expect(subject).to(approximatelyEqual(expectDate))
                }
            }
            context("When the date is 2014-03-01") {
                let currentDate = Date.build(
                    year: 2014,
                    month: 3,
                    day: 1
                )
                
                it("should return start of week date object") {
                    let subject = currentDate.startOfWeek()
                    let expectDate = Date.build(
                        year: 2014,
                        month: 2,
                        day: 23
                    )
                    expect(subject).to(approximatelyEqual(expectDate))
                }
            }
        }
        
        describe("-dateAtEndOfWeek") {
            context("When the date is 2014-03-04") {
                let currentDate = Date.build(
                    year: 2014,
                    month: 3,
                    day: 4
                )
                it("should return end of week date object") {
                    
                    let subject = currentDate.endOfWeek()
                    let expectDate = Date.build(
                        year: 2014,
                        month: 3,
                        day: 8
                    )
                    expect(subject).to(approximatelyEqual(expectDate))
                }
            }
            context("When the date is 2014-02-25") {
                let currentDate = Date.build(
                    year: 2014,
                    month: 2,
                    day: 25
                )
                it("should return end of week date object") {
                    let subject = currentDate.endOfWeek()
                    let expectDate = Date.build(
                        year: 2014,
                        month: 3,
                        day: 1
                    )
                    expect(subject).to(approximatelyEqual(expectDate))
                }
            }
        }
        
        describe("-dateAtStartOfMonth") {
            context("when the date is 2010-10-10 00:00:00") {
                let currentDate = Date.build(
                    year: 2010,
                    month: 10,
                    day: 10
                )
                it("should return start of month date object") {
                    // 2010-10-01
                    let subject = currentDate.startOfMonth()
                    let expectDate = Date.build(
                        year: 2010,
                        month: 10,
                        day: 1
                    )
                    expect(subject).to(approximatelyEqual(expectDate))
                }
            }
        }
        describe("-dateAtEndOfMonth") {
            context("when the date is 2010-10-10 00:00:00") {
                let currentDate = Date.build(
                    year: 2010,
                    month: 10,
                    day: 10
                )
                it("should return end of month date object") {
                    // 2010-10-31
                    let subject = currentDate.endOfMonth()
                    let expectDate = Date.build(
                        year: 2010,
                        month: 10,
                        day: 31
                    )
                    expect(subject).to(approximatelyEqual(expectDate))
                }
            }
            // http://en.wikipedia.org/wiki/Leap_year
            context("when February  leap year") {
                let currentDate = Date.build(
                    year: 2000,// divisible 400 => leap year
                    month: 2,
                    day: 1
                )
                it("should return 02-29") {
                    let subject = currentDate.endOfMonth()
                    let expectDate = Date.build(
                        year: 2000,
                        month: 2,
                        day: 29
                    )
                    expect(subject).to(approximatelyEqual(expectDate))
                }
            }
            // http://en.wikipedia.org/wiki/Leap_year
            context("when February  not leap year") {
                let currentDate = Date.build(
                    year: 2001,
                    month: 2,
                    day: 1
                )
                it("should return 02-28") {
                    let subject = currentDate.endOfMonth()
                    let expectDate = Date.build(
                        year: 2001,
                        month: 2,
                        day: 28
                    )
                    expect(subject).to(approximatelyEqual(expectDate))
                }
            }
        }
        
            /*
        describe("-dateAtStartOfYear") {
            context("when the date is 2010-10-10") {
                let currentDate = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10
                    )
                it("should return start of year date object") {
                    // 2010-01-01
                    let subject = currentDate.startOfYear()
                    let expectDate = Date.build(
                        year: 2010,
                        month: 1,
                        day: 1
                    )
                    [[subject should] beKindOfClass:[NSDate class]];
                    expect(subject).to(approximatelyEqual(currentDate))
                    }
                }
            context("when the date is 1989-01-06 and not Gregorian") {
                let currentDate = Date.build(
                        year: 1989,
                        month: 1,
                        day: 6
                    )
                    
                    let jaCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierJapanese];
                    [NSDate stub:selector(AZ_currentCalendar) andReturn:jaCalendar];
                    }
                it("should return start of year date object") {
                    let subject = currentDate.startOfYear()
                    let expectDate = Date.build(
                        year: 1989,
                        month: 1,
                        day: 1
                    )
                    [[subject should] beKindOfClass:[NSDate class]];
                    expect(subject).to(approximatelyEqual(currentDate))
                    }
                }
            }
        describe("-dateAtEndOfYear") {
            context("when the date is 2010-10-10") {
                let currentDate = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10
                    )
                it("should return end of year date object") {
                    // 2010-12-31
                    let subject = currentDate.endOfYear()
                    let expectDate = Date.build(
                        year: 2010,
                        month: 12,
                        day: 31
                    )
                    [[subject should] beKindOfClass:[NSDate class]];
                    expect(subject).to(approximatelyEqual(currentDate))
                    }
                }
            context("when the date is 2010-2-10") {
                let currentDate = Date.build(
                        year: 2010,
                        month: 2,
                        day: 10
                    )
                it("should return end of year date object") {
                    // 2010-12-31
                    let subject = currentDate.endOfYear()
                    let expectDate = Date.build(
                        year: 2010,
                        month: 12,
                        day: 31
                    )
                    [[subject should] beKindOfClass:[NSDate class]];
                    expect(subject).to(approximatelyEqual(currentDate))
                    }
                }
            context("when the date is 1989-01-06 and not Gregorian") {
                let currentDate = Date.build(
                        year: 1989,
                        month: 1,
                        day: 6
                    )
                    
                    let jaCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierJapanese];
                    [NSDate stub:selector(AZ_currentCalendar) andReturn:jaCalendar];
                    }
                it("should return start of year date object") {
                    let subject = currentDate.endOfYear()
                    let expectDate = Date.build(
                        year: 1989,
                        month: 12,
                        day: 31
                    )
                    [[subject should] beKindOfClass:[NSDate class]];
                    expect(subject).to(approximatelyEqual(currentDate))
                    }
                }
            }
 */

    }
}
