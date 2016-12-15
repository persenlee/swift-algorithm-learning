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
    var i=left,j=right
    let pivot = array[i]
    
    while i < j {
        while i < j && pivot < array[j] {
            j -= 1
        }
        if i != j {
            swap(&array[i], &array[j])
        }
        while i < j && pivot > array[i] {
            i += 1
        }
        if i != j {
            swap(&array[i], &array[j])
        }
        
    }
    quickSort(&array, left: left, right: i - 1)
    quickSort(&array, left: j + 1, right: right)
}
