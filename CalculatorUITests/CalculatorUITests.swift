import XCTest

final class CalculatorUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {}

    func testExample() throws {
        app.launch()

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
    
    func testSum() throws {
        app.launch()
        let button2 = app/*@START_MENU_TOKEN@*/.staticTexts["2"]/*[[".buttons[\"2\"].staticTexts[\"2\"]",".staticTexts[\"2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.firstMatch
        button2.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["+"]/*[[".buttons[\"+\"].staticTexts[\"+\"]",".staticTexts[\"+\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        button2.tap()
        app.buttons["="].tap()
        XCTAssert(app.buttons["resultString"].staticTexts["4"].exists)
    }
    
    func testMinus() throws {
         app.launch()
         let button2 = app.staticTexts["5"].firstMatch
         button2.tap()
         app.staticTexts["-"].tap()
         button2.tap()
         app.buttons["="].tap()
         XCTAssert(app.buttons["resultString"].staticTexts["0"].exists)
     }

    func testMultiply() throws {
         app.launch()
         let button2 = app.staticTexts["2"].firstMatch
         button2.tap()
         app.staticTexts["x"].tap()
         button2.tap()
         app.buttons["="].tap()
         XCTAssert(app.buttons["resultString"].staticTexts["4"].exists)
     }

    func testDivide() throws {
         app.launch()
         let button2 = app.staticTexts["9"].firstMatch
         button2.tap()
         app.staticTexts["÷"].tap()
         button2.tap()
         app.buttons["="].tap()
         XCTAssert(app.buttons["resultString"].staticTexts["1"].exists)
     }

    func testClearAll() throws {
         app.launch()
         let button2 = app.staticTexts["2"].firstMatch
         button2.tap()
         button2.tap()
         app.staticTexts["AC"].tap()
         XCTAssert(app.buttons["resultString"].staticTexts["0"].exists)
     }
    
    func testClearOneNumber() throws {
         app.launch()
         let button2 = app.staticTexts["2"].firstMatch
         button2.tap()
         button2.tap()
         app.buttons["backspace"].tap()
         button2.tap()
         app.buttons["="].tap()
         XCTAssert(app.buttons["resultString"].staticTexts["2"].exists)
     }
    
    func testClearAllErrorDisplayd() throws {
         app.launch()
         app.buttons["backspace"].tap()
         XCTAssert(app.staticTexts["Ошибка"].exists)
         XCTAssert(app.staticTexts["Введите цифры!"].exists)
     }
    
    func testPercent() throws  {
        call.call()
         app.launch()
         let button2 = app.staticTexts["2"].firstMatch
         button2.tap()
         app.staticTexts["%"].tap()
         app.buttons["="].tap()
         XCTAssert(app.buttons["resultString"].staticTexts["0.02"].exists)
     }

    func testPercentSckip() throws  {
        try XCTSkipIf(UIDevice.current.userInterfaceIdiom != .pad, "Pointer interaction tests are for iPad only")

         app.launch()
         let button2 = app.staticTexts["2"].firstMatch
         button2.tap()
         app.staticTexts["%"].tap()
         app.buttons["="].tap()
         XCTAssert(app.buttons["resultString"].staticTexts["0.02"].exists)
     }
    
    func testPercentWait() throws  {
        app.launch()
         let button2 = app.staticTexts["2"].firstMatch
         button2.tap()
        
        let element = app.staticTexts["2"]
        let existsPredicate = NSPredicate(format: "exists == true")
        let expectation = XCTNSPredicateExpectation(predicate: existsPredicate,
                                                        object: element)
        wait(for: [expectation], timeout: 3)
        
        XCTAssert(element.exists)
         app.staticTexts["%"].tap()
         app.buttons["="].tap()
         XCTAssert(app.buttons["resultString"].staticTexts["0.2"].exists)
     }
 }
