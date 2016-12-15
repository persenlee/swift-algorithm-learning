//
//  MergeSort.swift
//  Sort
//
//  Created by duomai on 2016/12/15.
//  Copyright © 2016年 duomai. All rights reserved.
//

import Foundation

public func mergeSort<T: Comparable>(_ leftOrderSeq: [T],_ rightOrderSeq: [T]) -> [T] {
    var left = 0,right = 0
    var newArray = [T]()
    while left < leftOrderSeq.count && right < rightOrderSeq.count {
        if leftOrderSeq[left] < rightOrderSeq[right] {
            newArray.append(leftOrderSeq[left])
            left += 1
        } else if leftOrderSeq[left] > rightOrderSeq[right] {
            newArray.append(rightOrderSeq[right])
            right += 1
        } else {
            newArray.append(leftOrderSeq[left])
            newArray.append(rightOrderSeq[right])
            left += 1
            right += 1
        }
    }
    while left < leftOrderSeq.count {
        newArray.append(leftOrderSeq[left])
        left += 1
    }
    while right < rightOrderSeq.count {
        newArray.append(rightOrderSeq[right])
        right += 1
    }
    return newArray
}
