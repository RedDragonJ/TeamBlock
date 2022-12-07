//
//  EmployeeProcessorTests.swift
//  TeamBlockTests
//
//  Created by James Layton on 12/4/22.
//

import XCTest

final class EmployeeProcessorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetEmployees_WithURL_ReturnError() async {
        // Arrange
        let mockNetworkSession = MockNetworkSession()
        let employeeProcessor = EmployeeProcessor(networkSession: mockNetworkSession)
        let testURL = ""
        
        var testError: Error?
        
        // Act
        do {
            _ = try await employeeProcessor.getEmployees(urlPath: testURL)
        } catch let error {
            testError = error
        }
        
        // Assert
        XCTAssertNotNil(testError)
        XCTAssertEqual(testError!.localizedDescription, "Mock API return an error")
    }

    func testGetEmployees_WithURL_ReturnMalformError() async {
        // Arrange
        let mockNetworkSession = MockNetworkSession()
        let employeeProcessor = EmployeeProcessor(networkSession: mockNetworkSession)
        let testURL = "TestMalformedData"
        
        var testError: Error?
        
        // Act
        do {
            _ = try await employeeProcessor.getEmployees(urlPath: testURL)
        } catch let error {
            testError = error
        }
        
        // Assert
        XCTAssertNotNil(testError)
        XCTAssertEqual((testError! as NSError).code, 996)
    }
    
    func testGetEmployees_WithURL_ReturnData() async {
        // Arrange
        let mockNetworkSession = MockNetworkSession()
        let employeeProcessor = EmployeeProcessor(networkSession: mockNetworkSession)
        let testURL = "TestData"
        
        var testError: Error?
        var testResult: Employees?
        
        // Act
        do {
            testResult = try await employeeProcessor.getEmployees(urlPath: testURL)
        } catch let error {
            testError = error
        }
        
        // Assert
        XCTAssertNil(testError)
        XCTAssertNotNil(testResult)
        XCTAssertEqual(testResult!.employees[0].fullName, "TestName")
    }
}
