//
//  BinaryTreeTests.swift
//  BinaryTreeTests
//
//  Created by duomai on 2016/12/20.
//  Copyright © 2016年 duomai. All rights reserved.
//

import XCTest
@testable import BinaryTree

class BinaryTreeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testBinaryTree() {
        let node4 = BinaryTree.TreeNode(.Empty, 4, .Empty)
        let node3 = BinaryTree.TreeNode(.Empty, 3, .Empty)
        let node2 = BinaryTree.TreeNode(.Empty, 2, .Empty)
        let node1 = BinaryTree.TreeNode(node3, 1, node4)
        let root = BinaryTree.TreeNode(node1, 0, node2)
        print(root)
        print("depath: \(root.depth),count: \(root.count)")
    }
    
    func testPreTraverse() {
        let node4 = BinaryTree.TreeNode(.Empty, 4, .Empty)
        let node3 = BinaryTree.TreeNode(.Empty, 3, .Empty)
        let node2 = BinaryTree.TreeNode(.Empty, 2, .Empty)
        let node1 = BinaryTree.TreeNode(node3, 1, node4)
        let root = BinaryTree.TreeNode(node1, 0, node2)
        var orderStr = ""
        root.traversePreOrder { value in
            orderStr += value.description
            print("\(value)")
        }
        XCTAssertEqual(orderStr, "01342")
        
    }
    
    func testInTraverse() {
        let node4 = BinaryTree.TreeNode(.Empty, 4, .Empty)
        let node3 = BinaryTree.TreeNode(.Empty, 3, .Empty)
        let node2 = BinaryTree.TreeNode(.Empty, 2, .Empty)
        let node1 = BinaryTree.TreeNode(node3, 1, node4)
        let root = BinaryTree.TreeNode(node1, 0, node2)
        var orderStr = ""
        root.traverseInOrder { value in
            print("\(value) ")
            orderStr += value.description
        }
        XCTAssertEqual(orderStr, "31402")
    }
    
    func testPostTraverse() {
        let node4 = BinaryTree.TreeNode(.Empty, 4, .Empty)
        let node3 = BinaryTree.TreeNode(.Empty, 3, .Empty)
        let node2 = BinaryTree.TreeNode(.Empty, 2, .Empty)
        let node1 = BinaryTree.TreeNode(node3, 1, node4)
        let root = BinaryTree.TreeNode(node1, 0, node2)
        var orderStr = ""
        root.traversePostOrder{ value in
            print("\(value) ")
            orderStr += value.description
        }
        XCTAssertEqual(orderStr, "34120")
    }
    
    func testLevelTraverse() {
        let node4 = BinaryTree.TreeNode(.Empty, 4, .Empty)
        let node3 = BinaryTree.TreeNode(.Empty, 3, .Empty)
        let node2 = BinaryTree.TreeNode(.Empty, 2, .Empty)
        let node1 = BinaryTree.TreeNode(node3, 1, node4)
        let root = BinaryTree.TreeNode(node1, 0, node2)
        var orderStr = ""
        root.traverseLevelOrder{ value in
            print("\(value) ")
            orderStr += value.description
        }
        XCTAssertEqual(orderStr, "01234")

    }
    
}
