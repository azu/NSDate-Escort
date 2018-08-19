import XCTest
import Quick
import AZDateBuilder

class EscortClassSpec: QuickSpec {
    override func spec() {
        describe("tomorrow") {
            let date = Date()
            it("should return add 1 day between 1 second") {
                let tomorrow = Date.tomorrow()
                let add1day = date.add(day: 1)
                XCTAssertTrue(add1day < tomorrow && tomorrow < add1day.add(second: 1))
            }
        }
        describe("yesterday") {
            let date = Date()
            it("should return subtract 1 day between 1 second") {
                let yesterday = Date.yesterday()
                let subtract1day = date.add(day: -1)
                XCTAssertTrue(subtract1day < yesterday && yesterday < subtract1day.add(second: 1))
            }
        }
    }
}
