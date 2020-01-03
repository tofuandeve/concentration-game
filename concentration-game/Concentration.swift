//
//  Concentration.swift
//  concentration-game
//
//  Created by Eve Le on 1/2/20.
//  Copyright © 2020 Eve Le. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
//    var isOver = false
    
    func chooseCard(at index: Int) {
        // if card is not matched yet, flip it
        if !cards[index].isMatched {
            // if there is a faceup card, check the new choosen card and the faceup card
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                // the card tapped should be flipped regardless
                cards[index].isFacedUp = true
                // there are two cards facing up, indexOfOneAndOnlyFaceUpCard should be set to nil
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // either no cards or 2 cards are face up, flip all the cards down
               flipAllCards()
                // then  flip the choosen one up and set the indexOfOneAndOnlyFaceUpCard to the choosen card index
                cards[index].isFacedUp = true
                indexOfOneAndOnlyFaceUpCard = index
                
            }
            
        }
    }
    
    func flipAllCards() {
        for flipDownIndex in cards.indices {
            cards[flipDownIndex].isFacedUp = false
        }
    }
    
    func isOver() -> Bool {
        for card in cards {
            if !card.isMatched {
                return false
            }
        }
        flipAllCards()
        return true
    }
    
    init(numberOfPairsOfCards: Int){
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
    
       
}
