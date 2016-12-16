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
        var ary = [4,5,1,34,0,9,3,8,22]
        reduceInsertionSort(&ary)
        print(ary)
    }
    
    func testShellSort() {
//        var ary0 = [Int]()
//        shellSort(&ary0, partial: 1)
//        print(ary0)
        
        var ary1 = [4]
        shellSort(&ary1, partial: 0)
        print(ary1)
        
        var ary2 = [4,5]
        shellSort(&ary2, partial: 1)
        print(ary2)
        
         var ary3 = [4,5,1]
        shellSort(&ary3, partial: 2)
        print(ary3)
        
        var ary = [4,5,1,34,0,9,3,8,22]
        shellSort(&ary, partial: ary.count - 1)
        print(ary)
        
    }
    
    
    
    func testBucketSort() {
        let ary = [4,5,1,34,0,9,3,8,22]
        var buckets = [Bucket<Int>(capacity: 5),Bucket<Int>(capacity: 5),Bucket<Int>(capacity: 5)]
        let result = bucketSort(ary, buckets: &buckets, sorter: QuickSorter(), distributer: ModDistributer())
        print(result)
    }
    
    func testlsdRadixSort() {
        var ary = [4,5,1,34,0,9,3,8,22]
        lsdRadixSort(&ary, radix: 8)
        print(ary)
    }
    
    func testmsdRadixSort() {
        var ary = [4,5,1,34,0,9,3,8,22,10]
        msdRadixSort(&ary, radix: 10)
        print(ary)
    }
    
}

extension Int: Sortable {
    public func toInt() -> Int {
        return self
    }
}
