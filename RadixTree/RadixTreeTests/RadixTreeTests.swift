//
//  RadixTreeTests.swift
//  RadixTreeTests
//
//  Created by duomai on 2016/12/14.
//  Copyright © 2016年 duomai. All rights reserved.
//

import XCTest
@testable import RadixTree

class RadixTreeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRadixTree() {
        var radix = RadixTree()
        var radixWiki = RadixTree()
        
        radixWiki.insert("romanus")
        radixWiki.insert("rubicundus")
        radixWiki.insert("rubicon")
        radixWiki.insert("romane")
        radixWiki.insert("ruber")
        radixWiki.insert("rubens")
        radixWiki.insert("romulus")
        radixWiki.insert("start")
        radixWiki.insert("shoot")
        radixWiki.insert("shit")
        radixWiki.insert("starch")
        radixWiki.insert("steven")
        radixWiki.insert("shart")
        radixWiki.insert("shard")
        
        radixWiki.insert("compute")
        radixWiki.insert("compatible")
        radixWiki.insert("construction")
        radixWiki.insert("coral")
        radixWiki.insert("crude")
        radixWiki.insert("chalk")
        radixWiki.insert("chime")
        radixWiki.insert("courting")
        radixWiki.insert("courted")
        
        radixWiki.insert("rubicunduses")
        
        radixWiki.printTree()
        
        print("\n\nFIND TESTS")
        print(radixWiki.find("courts")) // false
        print(radixWiki.find("r")) // true
        print(radixWiki.find("ro")) // true
        print(radixWiki.find("rom")) // true
        print(radixWiki.find("roma")) // true
        print(radixWiki.find("roman")) // true
        print(radixWiki.find("romane")) // true
        print(radixWiki.find("romans")) // false
        print(radixWiki.find("steve")) // true
        
        print("\n\nREMOVE TESTS")
        
        print(radixWiki.remove("c"))
        radixWiki.printTree()
        
        print(radixWiki.remove("rub"))
        radixWiki.printTree()
        
        print(radixWiki.remove("stevenson"))
        
        print(radixWiki.remove(""))
        radixWiki.printTree()

    }
}
