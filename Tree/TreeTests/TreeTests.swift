//
//  TreeTests.swift
//  TreeTests
//
//  Created by duomai on 2016/12/14.
//  Copyright © 2016年 duomai. All rights reserved.
//

import XCTest
@testable import Tree

class TreeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTree() {
        let creature = TreeNode(value: "creature")
        let animal = TreeNode(value: "animal")
        let bird = TreeNode(value: "bird")
        let fish = TreeNode(value: "fish")
        creature.addChild(animal)
        creature.addChild(bird)
        creature.addChild(fish)
        
        let human = TreeNode(value: "hunman")
        let monkey = TreeNode(value: "monkey")
        animal.addChild(human)
        animal.addChild(monkey)
        
        let duck = TreeNode(value: "duck")
        let swan = TreeNode(value: "swan")
        let chiken = TreeNode(value: "chiken")
        
        bird.addChild(duck)
        bird.addChild(swan)
        bird.addChild(chiken)
        
        print(creature)
    }
    
    
}
