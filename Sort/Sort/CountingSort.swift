//
//  CountSort.swift
//  Sort
//
//  Created by duomai on 2016/12/15.
//  Copyright © 2016年 duomai. All rights reserved.
//

import Foundation

public func countingSort(_ array: inout [Int]) {
    if !array.isEmpty {
        var countingArray = Array(repeating: 0, count: array.max()! + 1)
        for element in array {
            countingArray[element] += 1
        }
        var i = 0
        for (index,value) in countingArray.enumerated() {
            var counter = value
            while counter > 0 {
                array[i] = index
                i += 1
                counter -= 1
            }
        }
    }
    
}
