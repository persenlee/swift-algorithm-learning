//
//  SelectionSort.swift
//  Sort
//
//  Created by duomai on 2016/12/15.
//  Copyright © 2016年 duomai. All rights reserved.
//

import Foundation

public func selectionSort<T: Comparable>(_ array: inout [T]) {
    for i in 0..<array.count - 1 {
        var minIndex = i
        for j in i+1..<array.count {
            if array[minIndex] > array[j] {
                minIndex = j
            }
        }
        if i != minIndex {
            swap(&array[i], &array[minIndex])
        }
    }
}
