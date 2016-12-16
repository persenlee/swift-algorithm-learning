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


/// 折半插入排序
///
/// - Parameter array: <#array description#>
public func reduceInsertionSort<T: Comparable>(_ array: inout [T]) {
    if array.count > 1 {
        for index in 1..<array.count {
            let move = array[index]
            var low = 0,high = index
            while low <= high {
                let mid = (low + high) / 2
                if array[mid] > move {
                    high = mid - 1
                } else if array[mid] < move {
                    low = mid + 1
                } else {
                    high = mid
                    break
                }
                
            }
            let i = high + 1
            var j = index
//            let i = findReduce(&array, right: high, left: low, value: move)
            while j > i  {
                array[j] = array[j - 1]
                j -= 1
            }
            array[j] = move

            
        }
    }
}


func findReduce<T: Comparable>(_ array: inout [T],right: Int,left: Int,value: T) -> Int {
    let mid = (left + right) / 2
    if left > right {
        return mid
    }
    if array[mid] > value {
        return findReduce(&array, right: mid - 1, left:left , value: value)
    } else if array[mid] < value {
        return findReduce(&array, right: right, left: mid + 1, value: value)
    } else {
        return mid
    }
}


/// 希尔排序 (分组插入排序）
///
/// - Parameters:
///   - array: <#array description#>
///   - partial: <#partial description#>
public func shellSort<T: Comparable>(_ array: inout [T],partial: Int) {
    assert(array.count > partial)
    if array.count < 2 {
        return
    }
    var n = partial
    while n > 0 {
        var start = 1,end = n
        while end < array.count {
            
            for index in start...end {
                var i = index - 1
                let move = array[index]
                while i >= 0  && array[i] > move{
                    array[i+1] = array[i]
                    i = i - 1
                }
                array[i+1] = move
            }
            
            start += 1
            end += 1
        }
        n = n / 2
    }
}
