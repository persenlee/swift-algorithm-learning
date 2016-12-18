//
//  HeapTests.swift
//  HeapTests
//
//  Created by LeePersen on 2016/12/18.
//  Copyright © 2016年 LeePersen. All rights reserved.
//

import XCTest
@testable import Heap

class HeapTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHeap() {
        let ary = [4,5,1,34,0,9,3,8,22]
        var heap = Heap<Int>()
        heap.buildFromArray(ary)
        print(heap)
        heap.insert(100)
        print(heap)
        let first = heap.remove(at: 0)
        XCTAssertEqual(first, 100)
        print(heap)
        heap.replace(at: 5, value: 122)
        print(heap)
    }
    
    
}
