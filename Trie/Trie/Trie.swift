//
//  Trie.swift
//  Trie
//
//  Created by duomai on 2016/12/22.
//  Copyright © 2016年 duomai. All rights reserved.
//

import Foundation

public class Root {
    var children = [Edge]()
    var counter: Int = 0
    public init() {
       
    }
    public func count() -> Int {
        if children.count < 1 {
            return 1
        }
        var count = 0
        for edge in children {
            count += edge.count()
        }
        return count
    }
    
    public func depth() -> Int {
        if children.count < 1 {
            return 1
        }
        var maxDepth = 1
        for edge in children {
            maxDepth = max(maxDepth, edge.depth())
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
    
    var character: Character
    var parent: Root?
    public init(character: Character) {
        self.character = character
        super.init()
        counter += 1
    }
    
    public override func level() -> Int {
        if let parent = parent {
            return 1 + parent.level()
        } else {
            return 1
        }
    }
    
    public func erase() {
        parent = nil
        for edge in children {
            edge.erase()
            children.remove(at: 0)
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
        print(character)
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

public class Trie {
    var root: Root
    
    public init() {
        root = Root()
    }
    
    public func insert(str: String) -> Bool { // exsit return false
        if str == "" {
            return false
        }
        if root.children.count < 1 {
//            addEdge(edge: root as! Edge, str: str)
            var currentEdge = root
            for character in str.characters {
                currentEdge.children.append(Edge(character: character))
                currentEdge.children[0].parent = currentEdge
                currentEdge = currentEdge.children[0]
            }
            return true
        }
        
        var currentEdge = root
        var comparedStr = ""
        for character in str.characters {
            var found = false
            for edge in currentEdge.children {
                if edge.character == character {
                    found = true
                    currentEdge = edge
                    break
                }
            }
            if !found {
                let range = str.range(of: comparedStr)
                var newStr = str
                if let range = range {
                    newStr = str.substring(from: range.upperBound)
                }
                var tempEdge = currentEdge
                for character in newStr.characters {
                    let newEdge = Edge(character: character)
                    newEdge.parent = tempEdge
                    tempEdge.children.append(newEdge)
                    tempEdge = newEdge
                }
//                addEdge(edge: currentEdge as! Edge, str: str.substring(from: (str.range(of: comparedStr)?.upperBound)!))
                return true
            }
            comparedStr.append(character)
        }
        (currentEdge as! Edge).counter += 1
        return false
    }
    
    private func addEdge(edge: Edge,str: String) {
        var currentEdge = edge
        for character in str.characters {
            let newEdge = Edge(character: character)
            currentEdge.children.append(newEdge)
            newEdge.parent = currentEdge
            currentEdge = newEdge
        }
    }
    
    public func remove(str: String) -> Bool {
        if str == "" {
//            root.counter -= 1
//            for edge in root.children {
//                edge.erase()
//            }
            return true
        }
        
        if root.children.count < 1 {
            return false
        }
        
        var currentEdge = root
        for character in str.characters {
            var found = false
            for edge in currentEdge.children {
                if edge.character == character {
                    found = true
                    currentEdge = edge
                    break
                }
            }
            if !found {
                return false
            }
        }
        currentEdge.counter -= 1
        if currentEdge.counter == 0 {
            (currentEdge as! Edge).erase()
        }
        
        return true
        
    }
    
    public func find(str: String) -> Int {
        if str == "" {
            return root.counter
        }
        
        if root.children.count < 1 {
            return 0
        }
        
        var currentEdge = root
        for character in str.characters {
            var found = false
            for edge in currentEdge.children {
                if edge.character == character {
                    found = true
                    currentEdge = edge
                    break
                }
            }
            if !found {
                return 0
            }
        }
        return currentEdge.counter
    }
    
    public func printTree() {
        root.printRoot()
    }
}

//extension Root: CustomStringConvertible {
//    public var description: String {
//        
//    }
//}
//
//
//
//extension Trie: CustomStringConvertible {
//    public var description: String {
//        return root.description
//    }
//}
