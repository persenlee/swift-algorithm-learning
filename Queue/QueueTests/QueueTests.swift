//
//  QueueTests.swift
//  QueueTests
//
//  Created by duomai on 2016/12/14.
//  Copyright © 2016年 duomai. All rights reserved.
//

import XCTest
@testable import Queue

class QueueTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testQueue() {
        var queue = Queue<Int>()
        XCTAssertTrue(queue.isEmpty)
        XCTAssertEqual(queue.count, 0)
        XCTAssertNil(queue.dequeue())
        
        queue.enqueue(1)
        queue.enqueue(2)
        
        XCTAssertEqual(queue.count, 2)
        XCTAssertEqual(queue.dequeue(), 1)
        XCTAssertEqual(queue.dequeue(), 2)
        XCTAssertTrue(queue.isEmpty)
        XCTAssertNil(queue.peek())
    }
    
    
}
