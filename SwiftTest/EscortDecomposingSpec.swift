//
//  EscortDecomposingSpec.swift
//  NSDate-Escort
//
//  Created by akuraru on 2016/10/13.
//
//

import Foundation
import Quick
import Nimble

class EscortDecomposingSpec: QuickSpec {
    override func spec() {
        beforeEach {
            let calendarIdentifier = Calendar.Identifier.japanese
            Date.setDefault(calendarIdentifier)
        }
        describe("-nearestHour") {
            context("when 10:00:00") {
                let currentDate = Date.build(
                    year: 2010,
                    month: 10,
                    day: 10,
                    hour: 10,
                    minute: 0,
                    second: 0
                )
                it("should return 10") {
                    let nearestHour = currentDate.nearestHour()
                    expect(nearestHour).to(equal(10))
                }
            }
            context("when 10:29:59") {
                let currentDate = Date.build(
                    year: 2010,
                    month: 10,
                    day: 10,
                    hour: 10,
                    minute: 29,
                    second: 59
                )
                it("should return 10") {
                    let nearestHour = currentDate.nearestHour()
                    expect(nearestHour).to(equal(10))
                }
            }
            context("when 10:30:00") {
                let currentDate = Date.build(
                    year: 2010,
                    month: 10,
                    day: 10,
                    hour: 10,
                    minute: 30,
                    second: 0
                )
                it("should return 11") {
                    let nearestHour = currentDate.nearestHour()
                    expect(nearestHour).to(equal(11))
                }
            }
        }
        describe("-hour") {
            context("when the date is 01:02:03") {
                let currentDate = Date.build(
                    year: 2010,
                    month: 10,
                    day: 10,
                    hour: 1,
                    minute: 2,
                    second: 3
                )
                it("should return 1") {
                    let hour = currentDate.hour()
                    expect(hour).to(equal(1))
                }
            }
        }
        describe("-minute") {
            context("when the date is 01:02:03") {
                let currentDate = Date.build(
                    year: 2010,
                    month: 10,
                    day: 10,
                    hour: 1,
                    minute: 2,
                    second: 3
                )
                it("should return 2") {
                    let minute = currentDate.minute()
                    expect(minute).to(equal(2))
                }
            }
        }
        describe("-seconds") {
            context("when the date is 01:02:03") {
                let currentDate = Date.build(
                    year: 2010,
                    month: 10,
                    day: 10,
                    hour: 1,
                    minute: 2,
                    second: 3
                )
                it("should return 3") {
                    let seconds = currentDate.seconds()
                    expect(seconds).to(equal(3))
                }
            }
        }
        describe("-day") {
            context("when the date 2010-10-10") {
                let currentDate = Date.build(
                    year: 2010,
                    month: 10,
                    day: 10
                )
                it("should return 10") {
                    let day = currentDate.day()
                    expect(day).to(equal(10))
                }
            }
        }
        describe("-month") {
            context("when the date 2010-10-10") {
                let currentDate = Date.build(
                    year: 2010,
                    month: 10,
                    day: 10
                )
                it("should return 10") {
                    let month = currentDate.month()
                    expect(month).to(equal(10))
                }
            }
        }
        describe("-week") {
            context("when the date 2010-01-01") {
                let currentDate = Date.build(
                    year: 2010,
                    month: 1,
                    day: 1
                )
                it("should return 1") {
                    let weekValue = currentDate.week()
                    expect(weekValue).to(equal(1))
                }
            }
        }
        describe("-weekday") {
            // unfortunately NSCalendar$setFirstWeekday is not configurable...
            context("when the date 2010-01-01(Fri)") {
                let currentDate = Date.build(
                    year: 2010,
                    month: 1,
                    day: 1
                )
                it("should return 6") {
                    let weekdayValue = currentDate.weekday()
                    expect(weekdayValue).to(equal(6))
                }
            }
        }
        
        describe("-nthWeekday") {
            context("when the date 2010-10-10(2th weekday)") {
                let currentDate = Date.build(
                    year: 2010,
                    month: 10,
                    day: 10
                )
                it("should return 2") {
                    let nthWeekday = currentDate.nthWeekday()
                    expect(nthWeekday).to(equal(2))
                }
            }
        }
        describe("-firstDayOfWeekday") {
            context("when the date 2010-10-10") {
                let currentDate = Date.build(
                    year: 2010,
                    month: 10,
                    day: 10// weekday is 1
                )
                context("begining of sunday for weekady") {
                    it("should return 10") {
                        let firstDayOfWeekday = currentDate.firstDayOfWeekday()
                        expect(firstDayOfWeekday).to(equal(10))
                    }
                }
            }
            context("when the date 2010-10-11") {
                let currentDate = Date.build(
                    year: 2010,
                    month: 10,
                    day: 11// weekday is 1
                )
                context("begining of sunday for weekady") {
                    it("should return 10") {
                        let firstDayOfWeekday = currentDate.firstDayOfWeekday()
                        expect(firstDayOfWeekday).to(equal(10))
                    }
                }
            }
            context("when the date 2010-10-15") {
                let currentDate = Date.build(
                    year: 2010,
                    month: 10,
                    day: 15// weekday is 1
                )
                context("begining of sunday for weekady") {
                    it("should return 10") {
                        let firstDayOfWeekday = currentDate.firstDayOfWeekday()
                        expect(firstDayOfWeekday).to(equal(10))
                    }
                }
            }
            context("when the date 2010-10-16") {
                let currentDate = Date.build(
                    year: 2010,
                    month: 10,
                    day: 16// weekday is 1
                )
                context("begining of sunday for weekady") {
                    it("should return 10") {
                        let firstDayOfWeekday = currentDate.firstDayOfWeekday()
                        expect(firstDayOfWeekday).to(equal(10))
                    }
                }
            }
        }
        describe("-lastDayOfWeekday") {
            context("when the date 2010-10-10") {
                let currentDate = Date.build(
                    year: 2010,
                    month: 10,
                    day: 10// weekday is 1
                )
                context("begining of sunday for weekady") {
                    it("should return 10") {
                        let lastDayOfWeekday = currentDate.lastDayOfWeekday()
                        expect(lastDayOfWeekday).to(equal(16))
                    }
                }
            }
            context("when the date 2010-10-11") {
                let currentDate = Date.build(
                    year: 2010,
                    month: 10,
                    day: 11// weekday is 1
                )
                context("begining of sunday for weekady") {
                    it("should return 10") {
                        let lastDayOfWeekday = currentDate.lastDayOfWeekday()
                        expect(lastDayOfWeekday).to(equal(16))
                    }
                }
            }
            context("when the date 2010-10-15") {
                let currentDate = Date.build(
                    year: 2010,
                    month: 10,
                    day: 15// weekday is 1
                )
                context("begining of sunday for weekady") {
                    it("should return 10") {
                        let lastDayOfWeekday = currentDate.lastDayOfWeekday()
                        expect(lastDayOfWeekday).to(equal(16))
                    }
                }
            }
            context("when the date 2010-10-16") {
                let currentDate = Date.build(
                    year: 2010,
                    month: 10,
                    day: 16// weekday is 1
                )
                context("begining of sunday for weekady") {
                    it("should return 10") {
                        let lastDayOfWeekday = currentDate.lastDayOfWeekday()
                        expect(lastDayOfWeekday).to(equal(16))
                    }
                }
            }
        }
        describe("-year") {
            context("when the date 2010-10-10") {
                let currentDate = Date.build(
                    year: 2010,
                    month: 10,
                    day: 10
                )
                context("in gregorian") {
                    beforeEach {
                        let calendarIdentifier = Calendar.Identifier.gregorian
                        Date.setDefault(calendarIdentifier)
                    }
                    it("should return 2010") {
                        let yearValue = currentDate.year()
                        expect(yearValue).to(equal(2010))
                    }
                }
                context("in japanese") {
                    beforeEach {
                        let calendarIdentifier = Calendar.Identifier.japanese
                        Date.setDefault(calendarIdentifier)
                    }
                    it("should return 22") {
                        let yearValue = currentDate.year()
                        expect(yearValue).to(equal(22))
                    }
                }
            }
        }
        
        describe("-gregorianYear") {
            context("when the date 2010-10-10") {
                let currentDate = Date.build(
                    year: 2010,
                    month: 10,
                    day: 10
                )
                it("should return 2010") {
                    let yearValue = currentDate.gregorianYear()
                    expect(yearValue).to(equal(2010))
                }
            }
            context("when the date'calendar is not Gregorian") {
                let currentDate = Date.build(
                    year: 1989,
                    month: 10,
                    day: 10
                )
                let expectedDate = Date.build(
                    year: 2010,
                    month: 10,
                    day: 10
                )
                it("should return 1989") {
                    let yearValue = currentDate.gregorianYear()
                    expect(yearValue).to(equal(1989))
                }
                it("the date equal to 2010-10-10") {
                    expect(currentDate).toNot(equal(expectedDate))
                }
            }
        }
    }
}
