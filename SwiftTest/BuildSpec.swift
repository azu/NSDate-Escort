//
//  SwiftTest.swift
//  SwiftTest
//
//  Created by akuraru on 2016/09/29.
//
//

import XCTest
import Quick
import Nimble
import NSDate_Escort

class BuildSpec: QuickSpec {
    override func spec() {
        context("in gregorian") {
            let date = NSDate.az_date(byUnit: [
                AZ_DateUnit.year.takeRetainedValue(): 2010,
                AZ_DateUnit.month.takeRetainedValue(): 10,
                AZ_DateUnit.day.takeRetainedValue(): 10,
                AZ_DateUnit.hour.takeRetainedValue(): 11,
                AZ_DateUnit.minute.takeRetainedValue(): 12,
                AZ_DateUnit.second.takeRetainedValue(): 13
                ])!
            beforeEach {
                let calendarIdentifier = Calendar.Identifier.gregorian
                Date.setDefault(calendarIdentifier)
            }
            describe("static build") {
                it("is equal builded") {
                    let result = Date.build(
                        year: 2010,
                        month: 10,
                        day: 10,
                        hour: 11,
                        minute: 12,
                        second: 13
                    )
                    expect(result).to(equal(date))
                }
                it ("is equal 2010 42w Sunday 11:12:13") {
                    let result = Date.build(
                        year: 2010,
                        hour: 11,
                        minute: 12,
                        second: 13,
                        weekday: 1,
                        weekOfYear: 42
                    )
                    expect(result).to(equal(date))
                }
            }
            describe("build") {
                let currentDate = Date()
                it("None") {
                    expect(currentDate).toNot(equal(date))
                }
                context("2010/10/10 11:12:13") {
                    var buildResult = Date()
                    beforeEach {
                        buildResult = currentDate.build(
                            year: 2010,
                            month: 10,
                            day: 10,
                            hour: 11,
                            minute: 12,
                            second: 13,
                            nanosecond: 0
                        )
                    }
                    it("is equal builded") {
                        expect(buildResult).to(equal(date))
                    }
                }
            }
            describe("add") {
                context("era") {
                    context("adding 0") {
                        it("should return 2010-10-10") {
                            let subject = date.add(era: 0)
                            expect(subject).to(equal(date))
                        }
                    }
                    context("adding 1") {
                        it("should return 2011-10-10") {
                            let subject = date.add(era: 1)
                            let expectDate = Date.build(year: 2010, month: 10, day: 10, hour: 11, minute: 12, second: 13)
                            expect(subject).to(equal(expectDate))
                        }
                    }
                    context("adding -1") {
                        it("should return 2010-10-10") {
                            let subject = date.add(era: -1)
                            let expectDate = date
                            expect(subject).to(equal(expectDate))
                        }
                    }
                }
                context("year") {
                    context("adding 0") {
                        it("should return 2010-10-10") {
                            let subject = date.add(year: 0)
                            let expectDate = Date.build(year: 2010, month: 10, day: 10, hour: 11, minute: 12, second: 13)
                            expect(subject).to(equal(expectDate))
                        }
                    }
                    context("adding 1") {
                        it("should return 2011-10-10") {
                            let subject = date.add(year: 1)
                            let expectDate = Date.build(year: 2011, month: 10, day: 10, hour: 11, minute: 12, second: 13)
                            expect(subject).to(equal(expectDate))
                        }
                    }
                    context("adding -1") {
                        it("should return 2009-10-10") {
                            let subject = date.add(year: -1)
                            let expectDate = Date.build(year: 2009, month: 10, day: 10, hour: 11, minute: 12, second: 13)
                            expect(subject).to(equal(expectDate))
                        }
                    }
                }
                context("month") {
                    context("adding 0") {
                        it("should return 2010-10-10") {
                            let subject = date.add(month: 0)
                            let expectDate = Date.build(year: 2010, month: 10, day: 10, hour: 11, minute: 12, second: 13)
                            expect(subject).to(equal(expectDate))
                        }
                    }
                    context("adding 1") {
                        it("should return 2010-11-10") {
                            let subject = date.add(month: 1)
                            let expectDate = Date.build(year: 2010, month: 11, day: 10, hour: 11, minute: 12, second: 13)
                            expect(subject).to(equal(expectDate))
                        }
                    }
                    context("adding -1") {
                        it("should return 2010-09-10") {
                            let subject = date.add(month: -1)
                            let expectDate = Date.build(year: 2010, month: 9, day: 10, hour: 11, minute: 12, second: 13)
                            expect(subject).to(equal(expectDate))
                        }
                    }
                }
                context("day") {
                    context("adding 0") {
                        it("should return 2010-10-10") {
                            let subject = date.add(day: 0)
                            let expectDate = Date.build(year: 2010, month: 10, day: 10, hour: 11, minute: 12, second: 13)
                            expect(subject).to(equal(expectDate))
                        }
                    }
                    context("adding 1") {
                        it("should return 2010-10-11") {
                            let subject = date.add(day: 1)
                            let expectDate = Date.build(year: 2010, month: 10, day: 11, hour: 11, minute: 12, second: 13)
                            expect(subject).to(equal(expectDate))
                        }
                    }
                    context("adding -1") {
                        it("should return 2010-10-09") {
                            let subject = date.add(day: -1)
                            let expectDate = Date.build(year: 2010, month: 10, day: 9, hour: 11, minute: 12, second: 13)
                            expect(subject).to(equal(expectDate))
                        }
                    }
                }
                context("hour") {
                    context("adding 0") {
                        it("should return 2010-10-10 11:12:13") {
                            let subject = date.add(hour: 0)
                            let expectDate = Date.build(year: 2010, month: 10, day: 10, hour: 11, minute: 12, second: 13)
                            expect(subject).to(equal(expectDate))
                        }
                    }
                    context("adding 1") {
                        it("should return 2010-10-10 12:12:13") {
                            let subject = date.add(hour: 1)
                            let expectDate = Date.build(year: 2010, month: 10, day: 10, hour: 12, minute: 12, second: 13)
                            expect(subject).to(equal(expectDate))
                        }
                    }
                    context("adding -1") {
                        it("should return 2010-10-10 10:12:13") {
                            let subject = date.add(hour: -1)
                            let expectDate = Date.build(year: 2010, month: 10, day: 10, hour: 10, minute: 12, second: 13)
                            expect(subject).to(equal(expectDate))
                        }
                    }
                }
                context("minute") {
                    context("adding 0") {
                        it("should return 2010-10-10 11:12:13") {
                            let subject = date.add(minute: 0)
                            let expectDate = Date.build(year: 2010, month: 10, day: 10, hour: 11, minute: 12, second: 13)
                            expect(subject).to(equal(expectDate))
                        }
                    }
                    context("adding 1") {
                        it("should return 2010-10-10 11:13:13") {
                            let subject = date.add(minute: 1)
                            let expectDate = Date.build(year: 2010, month: 10, day: 10, hour: 11, minute: 13, second: 13)
                            expect(subject).to(equal(expectDate))
                        }
                    }
                    context("adding -1") {
                        it("should return 2010-10-10 11:11:13") {
                            let subject = date.add(minute: -1)
                            let expectDate = Date.build(year: 2010, month: 10, day: 10, hour: 11, minute: 11, second: 13)
                            expect(subject).to(equal(expectDate))
                        }
                    }
                }
            }
        }
        context("in japanese") {
            let date = NSDate.az_date(byUnit: [
                AZ_DateUnit.year.takeRetainedValue(): 1989,
                AZ_DateUnit.month.takeRetainedValue(): 1,
                AZ_DateUnit.day.takeRetainedValue(): 7,
                AZ_DateUnit.hour.takeRetainedValue(): 11,
                AZ_DateUnit.minute.takeRetainedValue(): 12,
                AZ_DateUnit.second.takeRetainedValue(): 13
            ])!
            beforeEach {
                let calendarIdentifier = Calendar.Identifier.japanese
                Date.setDefault(calendarIdentifier)
            }
            describe("add") {
                context("era") {
                    context("adding 0") {
                        let subject = date.add(era: 0)
                        it("should return 1989-1-7") {
                            expect(subject).to(equal(date))
                            expect(subject.era()).to(equal(234))
                        }
                    }
                    context("adding 1") {
                        it("should return 2052-1-7") {
                            let subject = date.add(era: 1)
                            let expectDate = Date.build(year: 2052, month: 1, day: 7, hour: 11, minute: 12, second: 13)
                            expect(subject).to(equal(expectDate))
                            expect(subject.era()).to(equal(235))
                        }
                    }
                    context("adding 2") {
                        it("should return 2052-1-7") {
                            let subject = date.add(era: 2)
                            let expectDate = Date.build(year: 2052, month: 1, day: 7, hour: 11, minute: 12, second: 13)
                            expect(subject).to(equal(expectDate))
                        }
                    }
                    context("adding -1") {
                        it("should return 1975-1-7") {
                            let subject = date.add(era: -1)
                            let expectDate = Date.build(year: 1975, month: 1, day: 7, hour: 11, minute: 12, second: 13)
                            expect(subject).to(equal(expectDate))
                            expect(subject.era()).to(equal(234))
                        }
                    }
                }
                context("year") {
                    context("adding 0") {
                        it("should return 1989-1-7") {
                            let subject = date.add(year: 0)
                            expect(subject).to(equal(date))
                            expect(subject.era()).to(equal(234))
                        }
                    }
                    context("adding 1") {
                        let subject = date.add(year: 1)
                        it("should return 1990-1-7") {
                            let expectDate = Date.build(year: 1990, month: 1, day: 7, hour: 11, minute: 12, second: 13)
                            expect(subject).to(equal(expectDate))
                            expect(subject.era()).to(equal(235))
                        }
                    }
                    context("adding -1") {
                        let subject = date.add(year: -1)
                        it("should return 1988-1-7") {
                            let expectDate = Date.build(year: 1988, month: 1, day: 7, hour: 11, minute: 12, second: 13)
                            expect(subject).to(equal(expectDate))
                        }
                    }
                }
                context("month") {
                    context("adding 0") {
                        it("should return 1989-1-7") {
                            let subject = date.add(month: 0)
                            let expectDate = Date.build(year: 1989, month: 1, day: 7, hour: 11, minute: 12, second: 13)
                            expect(subject).to(equal(expectDate))
                            expect(subject.era()).to(equal(234))
                        }
                    }
                    context("adding 1") {
                        it("should return 1989-2-7") {
                            let subject = date.add(month: 1)
                            let expectDate = Date.build(year: 1989, month: 2, day: 7, hour: 11, minute: 12, second: 13)
                            expect(subject).to(equal(expectDate))
                            expect(subject.era()).to(equal(235))
                        }
                    }
                    context("adding -1") {
                        it("should return 1988-12-7") {
                            let subject = date.add(month: -1)
                            let expectDate = Date.build(year: 1988, month: 12, day: 7, hour: 11, minute: 12, second: 13)
                            expect(subject).to(equal(expectDate))
                        }
                    }
                }
                context("day") {
                    context("adding 0") {
                        it("should return 1989-1-7") {
                            let subject = date.add(day: 0)
                            let expectDate = Date.build(year: 1989, month: 1, day: 7, hour: 11, minute: 12, second: 13)
                            expect(subject).to(equal(expectDate))
                            expect(subject.era()).to(equal(234))
                        }
                    }
                    context("adding 1") {
                        it("should return 1989-1-8") {
                            let subject = date.add(day: 1)
                            let expectDate = Date.build(year: 1989, month: 1, day: 8, hour: 11, minute: 12, second: 13)
                            expect(subject).to(equal(expectDate))
                            expect(subject.era()).to(equal(235))
                        }
                    }
                    context("adding -1") {
                        it("should return 1989-1-6") {
                            let subject = date.add(day: -1)
                            let expectDate = Date.build(year: 1989, month: 1, day: 6, hour: 11, minute: 12, second: 13)
                            expect(subject).to(equal(expectDate))
                            expect(subject.era()).to(equal(234))
                        }
                    }
                }
                context("hour") {
                    context("adding 0") {
                        it("should return 1989-1-7 11:12:13") {
                            let subject = date.add(hour: 0)
                            let expectDate = Date.build(year: 1989, month: 1, day: 7, hour: 11, minute: 12, second: 13)
                            expect(subject).to(equal(expectDate))
                        }
                    }
                    context("adding 1") {
                        it("should return 1989-1-7 12:12:13") {
                            let subject = date.add(hour: 1)
                            let expectDate = Date.build(year: 1989, month: 1, day: 7, hour: 12, minute: 12, second: 13)
                            expect(subject).to(equal(expectDate))
                        }
                    }
                    context("adding -1") {
                        it("should return 1989-1-7 10:12:13") {
                            let subject = date.add(hour: -1)
                            let expectDate = Date.build(year: 1989, month: 1, day: 7, hour: 10, minute: 12, second: 13)
                            expect(subject).to(equal(expectDate))
                        }
                    }
                }
                context("minute") {
                    context("adding 0") {
                        it("should return 1989-1-7 11:12:13") {
                            let subject = date.add(minute: 0)
                            let expectDate = Date.build(year: 1989, month: 1, day: 7, hour: 11, minute: 12, second: 13)
                            expect(subject).to(equal(expectDate))
                        }
                    }
                    context("adding 1") {
                        it("should return 1989-1-7 11:12:13") {
                            let subject = date.add(minute: 1)
                            let expectDate = Date.build(year: 1989, month: 1, day: 7, hour: 11, minute: 13, second: 13)
                            expect(subject).to(equal(expectDate))
                        }
                    }
                    context("adding -1") {
                        it("should return 1989-1-7 11:11:13") {
                            let subject = date.add(minute: -1)
                            let expectDate = Date.build(year: 1989, month: 1, day: 7, hour: 11, minute: 11, second: 13)
                            expect(subject).to(equal(expectDate))
                        }
                    }
                }
            }
        }
    }
}
