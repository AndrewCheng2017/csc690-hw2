//
//  ToDoListTests.swift
//  ToDoListTests
//
//  Created by Andrew C. on 3/7/18.
//  Copyright © 2018 Andrew Cheng. All rights reserved.
//

import XCTest
@testable import ToDoList

var toDoItemTest: ToDoItem!

class ToDoListTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        toDoItemTest = ToDoItem(title: "Milk")
    }
    
    override func tearDown() {
        super.tearDown()
        
        toDoItemTest = nil
    }
    
    func testTitleSet() {
        XCTAssertEqual(toDoItemTest.title, "Milk")
    }
    
    func testPerformanceExample() {
        self.measure {
            
        }
    }
    
}
