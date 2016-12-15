//
//  HashTableTests.swift
//  HashTableTests
//
//  Created by duomai on 2016/12/15.
//  Copyright © 2016年 duomai. All rights reserved.
//

import XCTest
@testable import HashTable

class HashTableTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHashTable() {
        var table = HashTable<String, Any>(capacity: 5)
        table.add(value: 1, forKey: "one")
        table["two"] = "two"
        table.add(value: 3, forKey: "three")
        table["four"] = 4
        table.add(value: "五", forKey: "five")
        table.add(value: 6, forKey: "six")
        table.add(value: 7, forKey: "seven")
        table.add(value: 8, forKey: "eight")
        table.add(value: 9, forKey: "nie")
        table["ten"] = 10
        print(table)
        table["one"] = nil
        print(table)
        table.removeValue(forKey: "five")
        print(table)
        XCTAssertEqual(table.count, 8)
        table.removeAll()
        XCTAssertTrue(table.isEmpty)
    }
    
}
