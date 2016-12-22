//
//  TrieTests.swift
//  TrieTests
//
//  Created by duomai on 2016/12/21.
//  Copyright © 2016年 duomai. All rights reserved.
//

import XCTest
@testable import Trie

class TrieTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTrie() {
        let trie = Trie()
        trie.insert(str: "hit")
        trie.insert(str: "high")
        trie.insert(str: "hillton")
        trie.insert(str: "lot")
        trie.insert(str: "loss")
        trie.insert(str: "list")
        trie.insert(str: "long")
        trie.printTree()
        
        XCTAssertEqual(trie.find(str: "long"), 1)
        trie.insert(str: "long")
        XCTAssertEqual(trie.find(str: "long"), 2)
        trie.remove(str: "long")
        XCTAssertEqual(trie.find(str: "long"), 1)
    }
    
}
