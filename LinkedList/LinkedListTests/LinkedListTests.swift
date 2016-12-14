//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by duomai on 2016/12/14.
//  Copyright © 2016年 duomai. All rights reserved.
//

import XCTest
@testable import LinkedList

class LinkedListTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEmptyLinkedList() {
        let list = LinkedList<Int>()
        XCTAssertTrue(list.isEmpty)
        XCTAssertEqual(list.count, 0)
        XCTAssertNil(list.first)
        XCTAssertNil(list.last)
    }
    
    func testOneLinkedList() {
        let list = LinkedList<Int>()
        list.append(0)
        XCTAssertTrue(!list.isEmpty)
        XCTAssertEqual(list.count, 1)
        XCTAssertEqual(list[0], 0)
        XCTAssertEqual(list.first, 0)
        XCTAssertEqual(list.last, 0)
        XCTAssertEqual(list.remove(at: 0), 0)
        XCTAssertTrue(list.isEmpty)
//        XCTAssertNil(list[1])
    }
    
    func testTwoLinkedList() {
        let list = LinkedList<Int>()
        list.append(1)
        list.append(2)
        XCTAssertTrue(!list.isEmpty)
        XCTAssertEqual(list.count, 2)
        XCTAssertEqual(list[0], 1)
        XCTAssertEqual(list[1], 2)
        XCTAssertEqual(list.first, 1)
        XCTAssertEqual(list.last, 2)
        XCTAssertEqual(list.remove(at: 1), 2)
        XCTAssertEqual(list.first, list.last)
        list.removeAll()
        XCTAssertTrue(list.isEmpty)
    }
    
    func testThreeLinkedList() {
        let list = LinkedList<Int>()
        list.append(1)
        list.append(2)
        list.append(3)
        // 1 2 3
        print(list)
        XCTAssertTrue(!list.isEmpty)
        XCTAssertEqual(list.count, 3)
        XCTAssertEqual(list[0], 1)
        XCTAssertEqual(list[1], 2)
        XCTAssertEqual(list[2], 3)
        XCTAssertEqual(list.first, 1)
        XCTAssertEqual(list.last, 3)
        XCTAssertEqual(list.remove(at: 1), 2)
        // 1 3
        print(list)
        XCTAssertEqual(list.count, 2)
        list.append(4)
        // 1 3 4
        print(list)
        XCTAssertEqual(list.last, 4)
        XCTAssertEqual(list[0], 1)
        XCTAssertEqual(list[1], 3)
        XCTAssertEqual(list[2], 4)
        XCTAssertEqual(list.remove(at: 0), 1)
        // 3 4
        print(list)
        XCTAssertEqual(list.first, 3)
        XCTAssertEqual(list.remove(at: 1), 4)
        // 3
        print(list)
        XCTAssertEqual(list.count, 1)
        list.removeAll()
        XCTAssertTrue(list.isEmpty)

    }
    
    func testReverseLinkedList() {
        let list = LinkedList<Int>()
        list.append(1)
        list.append(2)
        list.append(3)
        list.append(4)
        list.append(5)
        print(list)
        list.reverse()
        print(list)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
