//
//  Concentration.swift
//  Concentration
//
//  Created by Clyde Mendonca on 07/08/18.
//  Copyright © 2018 Weaver Birds. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard : Int?
    
    init(numberOfPairsOfCards : Int) {
         assert(numberOfPairsOfCards > 0, "Concentration.init(numberOfPairsOfCards: \(numberOfPairsOfCards): You must have atlease one pair of cards")
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        
        // TODO: Shuffle the cards
    }
    
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index): Chosen index not in the cards")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // Check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // Either no or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
        
    }
    
}
