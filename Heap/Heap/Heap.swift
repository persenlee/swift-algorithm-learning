//
//  Heap.swift
//  Heap
//
//  Created by LeePersen on 2016/12/18.
//  Copyright © 2016年 LeePersen. All rights reserved.
//

import Foundation


public struct Heap<T: Comparable>{
    fileprivate var array = [T]()
    
    public var count: Int {
        return array.count
    }
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public init() {
        
    }
    
    public mutating func buildFromArray(_ array: [T]) {
        self.array = array
        if array.count < 2 {
            return
        }
        for index in stride(from: self.array.count / 2 - 1, through: 0, by: -1) {
           shiftDown(index: index)
        }
    }
    
    public func leftChildIndex(index: Int) -> Int? {
        let leftIndex = 2 * index + 1
        return leftIndex > array.count - 1 ? nil : leftIndex
    }
    
    public func rightChildIndex(index: Int) -> Int? {
        let rightIndex = 2 * index + 2
        return rightIndex > array.count - 1 ? nil : rightIndex
    }
    
    public func parentIndex(index: Int) -> Int {
        return  (index - 1) / 2
    }
    
    public mutating func insert(_ element: T) {
        array.append(element)
        shiftUp(index: self.count - 1)
    }
    
    public mutating func replace(at index: Int,value: T) {
        assert(index < self.count)
        array[index] = value
        shiftUp(index: index)
        shiftDown(index: index)
    
    }
    
    public mutating func remove(at index: Int) -> T? {
        guard index < count else {return nil}
        let element = array[index]
        if index != count - 1 {
            array.swapAt(index, count - 1)
            array.removeLast()
            shiftUp(index: index)
            shiftDown(index: index)
        }
        return element
    }
    
    private mutating func shiftUp(index: Int) {
        var childIndex = index
        let element = array[childIndex]
        var parentIndex = self.parentIndex(index: childIndex)
        while childIndex > 0 {
            if array[parentIndex] < element {
                array[childIndex]  = array[parentIndex]
            }
            childIndex = parentIndex
            parentIndex = self.parentIndex(index: childIndex)
        }
        array[childIndex] = element
    }
    
    private mutating func shiftDown(index: Int) {
        var parentIndex = index
        while true {
            let leftIndex = leftChildIndex(index: parentIndex)
            let rightIndex = rightChildIndex(index: parentIndex)
            
            var maxIndex = parentIndex
            if let leftIndex = leftIndex {
                if self.array[maxIndex] < self.array[leftIndex] {
                    maxIndex = leftIndex
                }
            }
           
            if let rightIndex = rightIndex {
                if self.array[maxIndex] < self.array[rightIndex] {
                    maxIndex = rightIndex
                }
            }
            
            if maxIndex != parentIndex {
                self.array.swapAt(maxIndex, parentIndex)
                parentIndex = maxIndex
            } else {
                return
            }
            if leftIndex == nil || rightIndex == nil  {return}
        }
        
    }
    
}


extension Heap: CustomStringConvertible {
    public var description: String {
        return "\(array)"
    }
}

extension Heap {
    public mutating func sort() -> [T] {
        for i in stride(from:array.count - 1, through: 1, by: -1) {
            array.swapAt(0, i)
            shiftDown(index: 0, heapSize: i)
        }
        return array
    }
    
    public mutating func shiftDown(index: Int , heapSize: Int) {
        var parentIndex = index
        while true {
            let leftIndex = 2 * parentIndex + 1
            let rightIndex = leftIndex + 1
            
            var maxIndex = parentIndex
            
            if  leftIndex < heapSize && self.array[maxIndex] < self.array[leftIndex] {
                maxIndex = leftIndex
            }
            
            
            
            if rightIndex < heapSize && self.array[maxIndex] < self.array[rightIndex] {
                maxIndex = rightIndex
            }
            
            
            if maxIndex != parentIndex {
                self.array.swapAt(maxIndex, parentIndex)
                parentIndex = maxIndex
            } else {
                return
            }
        }
        
    }

}
