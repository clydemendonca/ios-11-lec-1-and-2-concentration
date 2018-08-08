//
//  Card.swift
//  Concentration
//
//  Created by Clyde Mendonca on 07/08/18.
//  Copyright © 2018 Weaver Birds. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var indentifierFactory = 0;
    
    static func getUniqueIdentifier() -> Int {
        indentifierFactory += 1
        return indentifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
