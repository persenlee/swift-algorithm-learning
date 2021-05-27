//
//  BubbleSort.swift
//  Sort
//
//  Created by duomai on 2016/12/15.
//  Copyright © 2016年 duomai. All rights reserved.
//

import Foundation

public func bubbleSort<T: Comparable>(_ array: inout [T]) {
    for i in 0..<array.count {
        for j in 0..<array.count - i-1 {
            if array[j] > array[j+1] {
                array.swapAt(j, j+1)
            }
        }
    }
}
