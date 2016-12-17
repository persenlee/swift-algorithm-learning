//
//  RadixSort.swift
//  Sort
//
//  Created by duomai on 2016/12/15.
//  Copyright © 2016年 duomai. All rights reserved.
//

import Foundation


/// 最低位优先法
///
/// - Parameter array: <#array description#>
public func lsdRadixSort<T: Sortable>(_ array: inout [T],radix: Int) {
    if array.count < 2 {
        return
    }
    typealias Bucket = [T]
    var buckets = Array(repeating: Bucket(), count: radix)
    var counter = 0
    while true {
        
        for element in array {
            let index = (element.toInt() / Int(pow(Double(radix), Double(counter)))) % radix
            buckets[index].append(element)
        }
        counter += 1
        
        array.removeAll()
        for bucket in buckets {
            for element in bucket {
                array.append(element)
            }
        }
        
        buckets = Array(repeating: Bucket(), count: radix)
        
        if Int(pow(Double(radix), Double(counter))) > (array.max()?.toInt())! {
            break
        }
    }
}


/// 最高位优先法
///
/// - Parameter array: <#array description#>
public func msdRadixSort<T: Sortable>(_ array: inout [T],radix: Int,minus: Int = 0) {
    if array.count < 2 {
        return
    }
    typealias Bucket = [T]
    var buckets = Array(repeating: Bucket(), count: radix)
    let max = (array.max()?.toInt())!
    var counter = 0
    while Int(pow(Double(radix), Double(counter))) < max {
        counter += 1
    }
    counter -= 1
    counter = counter > 0 ? counter - minus : counter

        
    for element in array {
        let index = (element.toInt() / Int(pow(Double(radix), Double(counter)))) % radix
        buckets[index].append(element)
    }
    
    for (index,var bucket) in buckets.enumerated() {
        if bucket.count > 1 {
            msdRadixSort(&bucket, radix: radix,minus: 1)
            buckets[index] = bucket
        }
    }
 
    
    array.removeAll()
    for bucket in buckets {
        for element in bucket {
            array.append(element)
        }
    }
}
