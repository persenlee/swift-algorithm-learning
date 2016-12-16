//
//  BucketSort.swift
//  Sort
//
//  Created by duomai on 2016/12/15.
//  Copyright © 2016年 duomai. All rights reserved.
//

import Foundation

public protocol IntConvertable {
    func toInt() -> Int
}

public protocol Sortable: Comparable,IntConvertable {

}

public protocol Distributer {
    func distribute<T: Sortable>(element: T,buckets: inout [Bucket<T>])
}


public protocol SortAlgorithm {
    func sort<T: Comparable>(_ array: [T]) -> [T]
}

public struct ModDistributer: Distributer {
    public func distribute<T : Sortable>(element: T, buckets: inout [Bucket<T>]) {
        var index = element.toInt() / (buckets.first?.capacity)!
        index = index >= buckets.count ? buckets.count - 1 : index
        index = index < 0 ? 0 : index
        buckets[index].append(element: element)
    }
}

public struct QuickSorter: SortAlgorithm {
    public func sort<T : Comparable>(_ array: [T]) -> [T] {
        var srcArray = array
        quickSort(&srcArray, left: 0, right: srcArray.count - 1)
        return srcArray
    }
}


/// 桶排序 (分桶关键）
///
/// - Parameters:
///   - array: 待排数组
///   - buckets: 桶
///   - sorter: 排序算法
///   - distributer: 分桶算法
/// - Returns: 已排数组
public func bucketSort<T: Sortable>(_ array: [T],buckets: inout [Bucket<T>],sorter: SortAlgorithm,distributer: Distributer) -> [T] {
    for element in array {
        distributer.distribute(element: element, buckets: &buckets)
    }
    var result = [T]()
    for var bucket in buckets {
        bucket.sort(sorter: sorter)
        result.append(contentsOf: bucket.toArray())
    }
    return result
}

public struct Bucket<T: Sortable>{
    private var bucket = [T]()
    public var capacity = 0
    
    public var isEmpty: Bool {
        return bucket.isEmpty
    }
    
    public init(capacity: Int) {
        self.capacity = capacity
    }
    
    public mutating func append(element: T) {
        if bucket.count < capacity {
            bucket.append(element)
        }
    }
    
    public func toArray() -> [T] {
        return bucket
    }
    
    public mutating func sort(sorter: SortAlgorithm) {
        bucket = sorter.sort(bucket)
    }
}
