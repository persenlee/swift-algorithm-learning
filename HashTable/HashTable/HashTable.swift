//
//  HashTable.swift
//  HashTable
//
//  Created by duomai on 2016/12/15.
//  Copyright © 2016年 duomai. All rights reserved.
//

import Foundation

public struct HashTable<Key: Hashable,Value> {
    fileprivate typealias Element = (key: Key,value: Value)
    fileprivate typealias Bucket = [Element]
    fileprivate var buckets: [Bucket]
    
    public private(set) var count = 0
    
    public var isEmpty: Bool {
        return count == 0
    }
    
    public init(capacity: Int) {
        assert(capacity > 0)
        buckets = Array<Bucket>(repeating: [], count: capacity)
    }
    
    public subscript(key: Key) -> Value? {
        get {
            return self.value(forKey: key)
        }
        set {
            if let value = newValue {
                self.add(value: value, forKey: key)
            } else {
                self.removeValue(forKey: key)
            }
        }
    }
    
    public func value(forKey key: Key) -> Value? {
        let bucket = self.buckets[index(of: key)]
        for element in bucket {
            if element.0 == key  {
                return element.1
            }
        }
        return nil
    }
    
    public mutating func add(value: Value, forKey key: Key) {
        let index = self.index(of: key)
        let bucket = self.buckets[index]
        for (i,element) in bucket.enumerated() {
            if element.key == key  {
                self.buckets[index][i].value = value
                return
            }
        }
        self.buckets[index].append((key: key,value: value))
        count += 1
    }
    
    public mutating func removeValue(forKey key: Key) {
        let index = self.index(of: key)
        let bucket = self.buckets[index]
        for (i,element) in bucket.enumerated() {
            if element.0 == key  {
                self.buckets[index].remove(at: i)
                count -= 1
            }
        }
    }
    
    public mutating func removeAll() {
        buckets = Array<Bucket>(repeating: [], count: buckets.count)
        count = 0
    }
    
    private func index(of key: Key) -> Int {
        return key.hashValue % buckets.count
    }
}

extension HashTable: CustomStringConvertible {
    public var description: String {
        var str = ""
        for (i, bucket) in buckets.enumerated() {
            let pairs = bucket.map { element in "\(element.key) = \(element.value)" }
            str += "bucket \(i): " + pairs.joined(separator: ", ") + "\n"
        }
        return str
    }
}
