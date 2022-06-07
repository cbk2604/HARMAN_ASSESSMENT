//
//  harman_assessmentTests.swift
//  harman-assessmentTests
//
//  Created by Yashogna on 07/06/22.
//

import XCTest
@testable import harman_assessment

class harman_assessmentTests: XCTestCase {
    let stringCalculator = StringCalculator()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testAddNumbersFromSimpleString() throws {
        XCTAssertEqual(try! stringCalculator.add(numberFromString: ""), 0)
        XCTAssertEqual(try! stringCalculator.add(numberFromString: "1"), 1)
        XCTAssertEqual(try! stringCalculator.add(numberFromString: "1,2"), 3)
    }
    
    func testAddNumbersFromStringWithMoreNumbers() throws {
        XCTAssertEqual(try! stringCalculator.add(numberFromString: "1,2,3"), 6)
        XCTAssertEqual(try! stringCalculator.add(numberFromString: "1,2,3,4"), 10)
        XCTAssertEqual(try! stringCalculator.add(numberFromString: "1,2,5,8"), 16)
    }
    
    func testAddNumbersFromStringWithNewLines() throws {
        XCTAssertEqual(try! stringCalculator.add(numberFromString: ""), 0)
        XCTAssertEqual(try! stringCalculator.add(numberFromString: "1"), 1)
        XCTAssertEqual(try! stringCalculator.add(numberFromString: "1\n2"), 3)
        XCTAssertEqual(try! stringCalculator.add(numberFromString: "1\n2,3,4"), 10)
    }
    
    func testSignedNumbers() throws {
        XCTAssertEqual(try! stringCalculator.add(numberFromString: "1,-2"), 0)
        
        do {
            let _ = try stringCalculator.add(numberFromString: "-1,-2,3")
        } catch StringCalculatorErrors.ContainsSignedNumbers(let signedNumbers) {
            XCTAssertEqual(signedNumbers, [-1,-2])
        } catch {
            
        }
    }
    

}
