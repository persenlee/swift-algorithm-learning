//
//  DequeTests.swift
//  DequeTests
//
//  Created by duomai on 2016/12/14.
//  Copyright © 2016年 duomai. All rights reserved.
//

import XCTest
@testable import Deque

class DequeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEmptyDeque() {
        var deque = Deque<Int>()
        XCTAssertTrue(deque.isEmpty)
        XCTAssertEqual(deque.count, 0)
        XCTAssertNil(deque.dequeueBack())
    }
    
    func testManyElementsDeque() {
        var deque = Deque<Int>()
        deque.enqueue(3)
        deque.enqueue(4)
        deque.enqueueFront(2)
        deque.enqueueFront(1)
        
        XCTAssertTrue(!deque.isEmpty)
        XCTAssertEqual(deque.count, 4)
        XCTAssertEqual(deque.peek(), 1)
        XCTAssertEqual(deque.peekBack(), 4)
        XCTAssertEqual(deque.dequeue(), 1)
        XCTAssertEqual(deque.dequeueBack(), 4)
        XCTAssertEqual(deque.count, 2)
    }
}
