//
//  RadixTree.swift
//  RadixTree
//
//  Created by duomai on 2016/12/21.
//  Copyright © 2016年 duomai. All rights reserved.
//

import Foundation

public class Root {
    var children = [Edge]()
    public init() {
        
    }
    public func depth() -> Int {
        if children.count < 1 {
            return 1
        }
        var maxDepth = 1
        for edge in children {
            maxDepth = max(edge.depth(),maxDepth)
        }
        return maxDepth + 1
    }
    
    public func level() -> Int {
        return 0
    }
    
    // Prints the tree for debugging/visualization purposes.
    public func printRoot() {
        // Print the first half of the children
        if children.count > 1 {
            for c in 0...children.count/2-1 {
                children[c].printEdge()
                print("|")
            }
        } else if children.count > 0 {
            children[0].printEdge()
        }
        // Then print the root
        print("ROOT")
        // Print the second half of the children
        if children.count > 1 {
            for c in children.count/2...children.count-1 {
                children[c].printEdge()
                print("|")
            }
        }
        print()
    }

}

public class Edge: Root {
    var label: String
    var parent: Root?
    public init(label: String) {
        self.label = label
        super.init()
    }
    public func erase() {
        parent = nil
        for element in children {
            element.erase()
            children.remove(at: 0)
        }
    }
    
    public override func level() -> Int {
        // Recurse up the tree incrementing level by one until the root is reached
        if parent != nil {
            return 1 + parent!.level()
        }
            // If an edge has no parent, it's level is one
            // NOTE: THIS SHOULD NEVER HAPPEN AS THE ROOT IS ALWAYS THE TOP OF THE TREE
        else {
            return 1
        }
    }

    
    public func printEdge() {
        // Print the first half of the edge's children
        if children.count > 1 {
            for c in 0...children.count/2-1 {
                children[c].printEdge()
            }
        } else if children.count > 0 {
            children[0].printEdge()
        }
        // Tab over once up to the edge's level
        for x in 1...level() {
            if x == level() {
                print("|------>", terminator: "")
            } else {
                print("|       ", terminator: "")
            }
        }
        print(label)
        // Print the second half of the edge's children
        if children.count == 0 {
            for _ in 1...level() {
                print("|       ", terminator: "")
            }
            print()
        }
        if children.count > 1 {
            for c in children.count/2...children.count-1 {
                children[c].printEdge()
            }
        }
    }

}

public class RadixTree {
    var root: Root = Root()
    
    public func insert(_ str: String) -> Bool {
        if str == "" { //root
            return true
        }
        if root.children.count < 1 {
            let element = Edge(label: str)
            element.parent = root
            root.children.append(element)
            return true
        }
        
        var searchStr = str
        var currentEdge = root
        
        while true {
            var found = false
            for edge in currentEdge.children {
                if edge.label == searchStr {
                    return false
                }
                let sharedStr = edge.label.commonPrefix(with: searchStr)
                if sharedStr == edge.label {
                    let range = searchStr.range(of: sharedStr)!
                    searchStr = searchStr.substring(from: range.upperBound)
                    currentEdge = edge
                    found = true
                    break
                } else if sharedStr.characters.count > 0 {
                    let range = searchStr.range(of: sharedStr)!
                    searchStr = searchStr.substring(from: range.upperBound)
                    
                    let element1 = Edge(label: edge.label.substring(from: range.upperBound))
                    element1.parent = edge
                    
                    edge.label = sharedStr
                    
                    let element2 = Edge(label: searchStr)
                    element2.parent = edge
                    
                    for element in edge.children {
                        element1.children.append(element)
                        element.parent = element1
                    }
                    edge.children.removeAll()
                    edge.children.append(element1)
                    edge.children.append(element2)
                    return true
                } else {
                    continue
                }
            }
            if !found {
                let element = Edge(label: searchStr)
                element.parent = currentEdge
                currentEdge.children.append(element)
                return true
            }
        }

    }
    
    public func remove(_ str: String) -> Bool {
        if str == "" { //root
            for element in root.children {
                element.erase()
            }
            return true
        }
        if root.children.count < 1 {
            return false
        }
        
        var searchStr = str
        var currentEdge = root
        
        while true {
            var found = false
            for edge in currentEdge.children {
                if edge.label == searchStr {
                    edge.erase()
                    return true
                }
                let sharedStr = edge.label.commonPrefix(with: searchStr)
                if sharedStr.characters.count > 0 {
                    currentEdge = edge
                    let range = searchStr.range(of: sharedStr)!
                    searchStr = searchStr.substring(from: range.upperBound)
                    found = true
                    break
                } else {
                    continue
                }
            }
            if !found {
                return false
            }
        }
    }
    
    public func find(_ str: String) -> Bool {
        if str == "" { //root
            return true
        }
        if root.children.count < 1 {
            return false
        }
        
        var searchStr = str
        var currentEdge = root
        
        while true {
            var found = false
            for edge in currentEdge.children {
                if edge.label == searchStr {
                    return true
                }
                let sharedStr = edge.label.commonPrefix(with: searchStr)
                if sharedStr.characters.count > 0 {
                    if sharedStr == edge.label {
                        currentEdge = edge
                        let range = searchStr.range(of: sharedStr)!
                        searchStr = searchStr.substring(from: range.upperBound)
                        found = true
                        break
                    }else if sharedStr == searchStr {
                        return true
                    } else {
                        return false
                    }
                    
                } else {
                    continue
                }
            }
            if !found {
                return false
            }
        }
    }
    
    public func printTree() {
        root.printRoot()
    }

}
