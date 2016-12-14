//
//  StackTests.swift
//  StackTests
//
//  Created by duomai on 2016/12/14.
//  Copyright © 2016年 duomai. All rights reserved.
//

import XCTest
@testable import Stack
class StackTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    

    func testEmpty() {
        let stack = Stack<Int>()
        XCTAssertTrue(stack.isEmpty)
        XCTAssertEqual(stack.count, 0)
        XCTAssertNil(stack.peek())
    }
    
    func testOneElement() {
        var stack = Stack<Int>()
        stack.push(1)
        XCTAssertTrue(!stack.isEmpty)
        XCTAssertEqual(stack.count, 1)
        XCTAssertEqual(stack.peek(), 1)
        XCTAssertEqual(stack.pop(), 1)
        XCTAssertTrue(stack.isEmpty)
        XCTAssertNil(stack.pop())
    }
    
    func testManyElement() {
        var stack = Stack<Int>()
        stack.push(1)
        stack.push(10)
        XCTAssertTrue(!stack.isEmpty)
        XCTAssertEqual(stack.count, 2)
        XCTAssertEqual(stack.pop(), 10)
        XCTAssertEqual(stack.pop(), 1)
        XCTAssertNil(stack.peek())
        XCTAssertTrue(stack.isEmpty)
    }
}
