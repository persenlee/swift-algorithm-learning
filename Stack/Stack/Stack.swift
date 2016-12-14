//
//  Stack.swift
//  Stack
//
//  Created by duomai on 2016/12/14.
//  Copyright © 2016年 duomai. All rights reserved.
//

import Foundation

public struct Stack<T> {
    private var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func push(_ element: T) {
        array.append(element)
    }
    
    public mutating func pop() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.popLast()
        }
    }
    
    public func peek() -> T? {
        return array.last
    }
}
