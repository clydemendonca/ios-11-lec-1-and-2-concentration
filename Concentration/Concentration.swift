//
//  Concentration.swift
//  Concentration
//
//  Created by Clyde Mendonca on 07/08/18.
//  Copyright © 2018 Weaver Birds. All rights reserved.
//

import Foundation

struct Concentration {
    
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard : Int? {
        get {
//            let faceUpCardIndices = cards.indices.filter { cards[$0].isFaceUp }
//            return faceUpCardIndices.count == 1 ? faceUpCardIndices.first : nil
            
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
            
        }
        
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    init(numberOfPairsOfCards : Int) {
         assert(numberOfPairsOfCards > 0, "Concentration.init(numberOfPairsOfCards: \(numberOfPairsOfCards): You must have atlease one pair of cards")
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        
        // TODO: Shuffle the cards
    }
    
    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index): Chosen index not in the cards")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // Check if cards match
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
        
    }
    
}

extension Collection {
    var oneAndOnly : Element? {
        return count == 1 ? first : nil
    }
}
