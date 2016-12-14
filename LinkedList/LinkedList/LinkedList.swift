//
//  LinkedList.swift
//  LinkedList
//
//  Created by duomai on 2016/12/14.
//  Copyright © 2016年 duomai. All rights reserved.
//

import Foundation

public class LinkedListNode<T> {
    var value: T
    weak var previous: LinkedListNode<T>?
    var next: LinkedListNode<T>?
    
    public init(value: T) {
        self.value = value
    }
}


public class LinkedList<T> {
    public typealias Node = LinkedListNode<T>
    public private(set) var count: Int = 0
    
    fileprivate var rootNode: Node?
    private var lastNode: Node?
    
    public var isEmpty: Bool {
        return count==0
    }
    
    public var first: T? {
        return rootNode?.value
    }
    
    public var last: T? {
        return lastNode?.value
    }
    
    public subscript(index: Int) -> T? {
        assert(index >= 0 && index < count && count > 0)
        var counter = 0
        var node = rootNode
        while (node?.next) != nil {
            if counter == index {
                break
            }
            node = node?.next
            counter += 1
        }
        return node?.value
    }
    
    public  func append(_ element: T) {
        let node = Node(value:element)
        if rootNode == nil {
            rootNode = node
            lastNode = node
        } else {
            node.previous = lastNode
            lastNode?.next = node
            lastNode = node
        }
        self.count+=1
    }
    
    public  func remove(at index: Int) -> T {
        assert(index >= 0 && index < count && count > 0)
        var value: T?
        if index == 0 {
            value = (rootNode?.value)!
            rootNode = rootNode?.next
        } else if index == self.count-1 {
            value = (lastNode?.value)!
            lastNode = lastNode?.previous
            lastNode?.next  = nil
        } else {
            var counter = 1
            let node = rootNode
            while let node = node?.next {
                if counter == index {
                    value = node.value
                    node.previous?.next = node.next
                    node.next?.previous = node.previous
                    break
                }
                counter += 1
            }
        }
        self.count -= 1
        return value!
    }
    
    public  func removeAll() {
        rootNode = nil
        self.count = 0
    }
    
    public func reverse() {
        var node = rootNode
        while let currentNode = node {
            node = currentNode.next
            swap(&currentNode.previous, &currentNode.next)
        }
        swap(&rootNode, &lastNode)
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        var node = rootNode
        var str = "["
        while node != nil {
            str += "\(node!.value)"
            node = node?.next
            if node != nil {
                str += ","
            }
        }
        str += "]"
        return str
    }
}
