//
//  DailyExpenseUITests.swift
//  DailyExpenseUITests
//
//  Created by Long Nguyễn on 04/05/2021.
//

import XCTest

class DailyExpenseUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    // MARK: - Login    
    func testWrongEmailOrPassword() {
        
        let validEmail = "longnguyen"
        let validPassword = "1238rsa213"

        let app = XCUIApplication()
        app.launch()

        let emailTextField = app.textFields["Email"]
        XCTAssertTrue(emailTextField.exists)
        emailTextField.tap()
        emailTextField.typeText(validEmail)

        let passwordSecureTextField = app.secureTextFields["Password"]
        XCTAssertTrue(passwordSecureTextField.exists)
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText(validPassword)
        
        XCUIApplication().children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
        
        let signInButton = app.buttons["Sign In"]
        signInButton.tap()
        
        
        let alertDialog = app.alerts["Error"]
        XCTAssertTrue(alertDialog.exists)
        
        alertDialog.buttons["Close"].tap()
        
    }
    
    func testValidateLoginSuccess() {
        let validEmail = "0909090909"
        let validPassword = "123456"

        let app = XCUIApplication()
        app.launch()

        let emailTextField = app.textFields["Email"]
        XCTAssertTrue(emailTextField.exists)
        emailTextField.tap()
        emailTextField.typeText(validEmail)

        let passwordSecureTextField = app.secureTextFields["Password"]
        XCTAssertTrue(passwordSecureTextField.exists)
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText(validPassword)
        
        XCUIApplication().children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
        
        let signInButton = app.buttons["Sign In"]
        signInButton.tap()
        
        let changePasswordButton = app.buttons["Change Password"]
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: changePasswordButton, handler: nil)
        
        waitForExpectations(timeout: 5, handler: nil)
    }
 
    
    // MARK: - Performance
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
