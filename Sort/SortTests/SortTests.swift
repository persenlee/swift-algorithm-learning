//
//  SortTests.swift
//  SortTests
//
//  Created by duomai on 2016/12/15.
//  Copyright © 2016年 duomai. All rights reserved.
//

import XCTest
@testable import Sort

class SortTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testBubbleSort() {
        var ary = [4,5,1,0,9,3,8]
        bubbleSort(&ary)
        print(ary)
    }
    
    
    func testQuickSort() {
        var ary = [4,5,1,0,9,3,8]
        quickSort(&ary, left: 0, right: ary.count-1)
        print(ary)
    }
    
    func testSelectionSort() {
        var ary = [4,5,1,0,9,3,8]
        selectionSort(&ary)
        print(ary)
    }
    
    func testCountingSort() {
        var ary = [4,5,1,0,9,3,8]
        countingSort(&ary)
        print(ary)
    }
    
    func testMergeSort() {
        let leftAry = [2,4]
        let rightAry = [0,5,7]
        let ary = mergeSort(leftAry, rightAry)
        print(ary)
    }
    
    func testSimpleInsertionSort() {
        var ary = [4,5,1,0,9,3,8]
        sampleInsertionSort(&ary)
        print(ary)
    }
    
    func testReduceInsertionSort() {
        var ary = [4,5,1,0,9,3,8]
        sampleInsertionSort(&ary)
        print(ary)
    }
}
