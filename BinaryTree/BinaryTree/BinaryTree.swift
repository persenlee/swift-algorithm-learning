//
//  BinaryTree.swift
//  BinaryTree
//
//  Created by duomai on 2016/12/20.
//  Copyright © 2016年 duomai. All rights reserved.
//

import Foundation
import Queue

public indirect enum BinaryTree<T: CustomStringConvertible> {
    case Empty
    case TreeNode(BinaryTree<T>,T,BinaryTree<T>)
    
    public var count: Int {
        switch self {
        case .Empty:
            return 0
        case let .TreeNode(leftTree , _ , rightTree):
            return leftTree.count + 1 + rightTree.count
        }
    }
    
    public var depth: Int {
        switch self {
        case .Empty:
            return 0
        case let .TreeNode(leftTree , _ , rightTree):
            return 1 + max(leftTree.depth, rightTree.depth)
        }
    }
}

extension BinaryTree: CustomStringConvertible {
    public var description: String {
        switch self {
        case .Empty:
            return ""
        case let .TreeNode(leftTree,rootValue,rightTree):
            
            return "[value: \(rootValue) ] [leftTree: \(leftTree )+ ] [rightTree: \(rightTree)]"
        }
    }
}

extension BinaryTree {
    public func traversePreOrder(process: (T) -> Void) {
        if case let .TreeNode(leftTree,value,rightTree) = self {
            process(value)
            leftTree.traversePreOrder(process: process)
            rightTree.traversePreOrder(process: process)
        }
    }
    
    public func traverseInOrder(process: (T) -> Void) {
        if case let .TreeNode(leftTree,value,rightTree) = self {
            leftTree.traverseInOrder(process: process)
            process(value)
            rightTree.traverseInOrder(process: process)
        }
    }
    
    public func traversePostOrder(process: (T) -> Void) {
        if case let .TreeNode(leftTree,value,rightTree) = self {
            leftTree.traversePostOrder(process: process)
            rightTree.traversePostOrder(process: process)
            process(value)
        }
    }
    
    public func traverseLevelOrder(process: (T) -> Void) {
        var queue = Queue<BinaryTree<T>>()
        queue.enqueue(self)
        while queue.count > 0 {
            let tree = queue.dequeue()
            if case let .TreeNode(leftTree,value,rightTree) = tree! {
                process(value)
                queue.enqueue(leftTree)
                queue.enqueue(rightTree)
            }
        }
        
    }
}
