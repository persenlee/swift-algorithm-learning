//
//  Tree.swift
//  Tree
//
//  Created by duomai on 2016/12/15.
//  Copyright © 2016年 duomai. All rights reserved.
//

import Foundation

public class TreeNode<T> {
    public weak var parent: TreeNode?
    fileprivate var children = [TreeNode]()
    public  var value: T
//    public var intro: String?
    public init(value: T) {
        self.value = value
    }
    
    public func addChild(_ element: TreeNode) {
        element.parent = self
        children.append(element)
    }
}

extension TreeNode: CustomStringConvertible {
    public var description: String {
        if children.isEmpty {
            return "\(value)"
        }
        let arr = children.map { element in
            "\(element.description)"
        }
        return "[\(value) : {" + arr.joined(separator: ",") + "}]"
    }
}
