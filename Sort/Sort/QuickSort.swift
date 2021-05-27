//
//  QuickSort.swift
//  Sort
//
//  Created by duomai on 2016/12/15.
//  Copyright © 2016年 duomai. All rights reserved.
//

import Foundation

public func quickSort<T: Comparable>(_ array: inout [T],left: Int,right: Int) {
    if left >= right {
        return
    }
    let r = partion1(&array, left: left, right: right)
    quickSort(&array, left: left, right: r - 1)
    quickSort(&array, left: r + 1, right: right)
}

func partion<T: Comparable>(_ array: inout [T], left: Int, right: Int) -> Int {
    var i=left,j=right
    let pivot = array[i]
    
    while i < j {
        while i < j && pivot < array[j] {
            j -= 1
        }
        if i != j {
            array.swapAt(i, j)
        }
        while i < j && pivot > array[i] {
            i += 1
        }
        if i != j {
            array.swapAt(i, j)
        }
    }
    return i
}

func partion1<T: Comparable>(_ array: inout [T], left: Int, right: Int) -> Int {
    var i = left,j = left
    let pivot = array[right]
    while j < right {
        if array[i] >= pivot {
            j+=1
        } else {
            array.swapAt(i, j)
            i += 1
            j += 1
        }
    }
    array.swapAt(i, right)
    return j
}
