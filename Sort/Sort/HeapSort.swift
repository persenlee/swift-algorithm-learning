//
//  HeapSort.swift
//  Sort
//
//  Created by duomai on 2016/12/15.
//  Copyright © 2016年 duomai. All rights reserved.
//

import Foundation

import Heap
public func heapSort<T: Sortable>(_ array: [T]) -> [T] {
    var heap = Heap<T>()
    heap.buildFromArray(array)
    return heap.sort()
}

