//
//  COSC345_LangTests.swift
//  COSC345-LangTests
//
//  Created by Ben Stacey on 12/08/22.
//

import XCTest
@testable import COSC345_Lang

class COSC345_LangTests: XCTestCase {
    
    var mainMenuSubjects: MainMenu!
    
    func testEqualMaoriLanguage(){
        MainMenu.setLanguage(lang: "maori")
        XCTAssertEqual(MainMenu.getLanguage(), "maori")
    }
    
    func testEqualSpanishLanguage(){
        MainMenu.setLanguage(lang: "spanish")
        XCTAssertEqual(MainMenu.getLanguage(), "spanish")
    }
    
    func testEqualFrenchLanguage(){
        MainMenu.setLanguage(lang: "french")
        XCTAssertEqual(MainMenu.getLanguage(), "french")
    }
    
    func testEqualName(){
        MainMenu.setName(n: "Ben")
        XCTAssertEqual(MainMenu.getName(), "Ben")
    }
    
    func testTrueLangSelected(){
        MainMenu.setLangSelected(ls: true)
        XCTAssertTrue(MainMenu.getLangSelected())
    }
    
    func testTrueNameSelected(){
        MainMenu.setNameSelected(ns: true)
        XCTAssertTrue(MainMenu.getNameSelected())
    }
    
    func textEqualScreenWidth(){
        setScreenWidth(width: ScreenWidth)
        XCTAssertEqual(getScreenWidth(), ScreenWidth)
    }
    
    func textEqualScreenHeight(){
        setScreenHeight(height: ScreenHeight)
        XCTAssertEqual(getScreenWidth(), ScreenHeight)
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    /**
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
 */

}
