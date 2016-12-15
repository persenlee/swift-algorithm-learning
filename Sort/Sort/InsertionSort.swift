//
//  InsertionSort.swift
//  Sort
//
//  Created by duomai on 2016/12/15.
//  Copyright © 2016年 duomai. All rights reserved.
//

import Foundation

public func sampleInsertionSort<T: Comparable>(_ array: inout [T]) {
    if array.count > 1 {
        for index in 1..<array.count {
            var i = index - 1
            let move = array[index]
            while i >= 0  && array[i] > move{
                array[i+1] = array[i]
                i = i - 1
            }
            array[i+1] = move
        }
    }
}

public func reduceInsertionSort<T: Comparable>(_ array: inout [T]) {
    if array.count > 1 {
        for index in 1..<array.count {
            let move = array[index]
            var i = findReduce(&array, right: 0, left: index, value: move)
            while i > 0 {
                array[i+1] = array[i]
                i = i - 1
            }
            array[i] = move
        }
    }
}

func findReduce<T: Comparable>(_ array: inout [T],right: Int,left: Int,value: T) -> Int {
    if left > right {
        return right
    }
    let mid = (left + right) / 2
    if array[mid] > value {
        return findReduce(&array, right: mid - 1, left:left , value: value)
    } else if array[mid] < value {
        return findReduce(&array, right: right, left: mid + 1, value: value)
    } else {
        return mid
    }
}

public func shellSort<T: Comparable>(_ array: inout [T],partial: Int) {
    
}
