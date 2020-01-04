//
//  ViewController.swift
//  concentration-game
//
//  Created by Eve Le on 1/1/20.
//  Copyright © 2020 Eve Le. All rights reserved.
//

import UIKit

class ConcentrationViewController: UIViewController {
    lazy var game = Concentration(numberOfPairsOfCards: (cardCollection.count + 1) / 2)
    
    var gameIsOver: Bool = false {
        didSet {
            gameResult.text = "You win!"
        }
    }
    
    @IBOutlet weak var gameResult: UILabel!
    @IBOutlet var cardCollection: [UIButton]!
    

    
    @IBAction func tapHeart(_ sender: UIButton) {
        if let cardIndex = cardCollection.firstIndex(of: sender) {
            game.chooseCard(at: cardIndex)
            
            
            if game.isOver() {
//                updateViewFromModel()
                gameIsOver = true
            }
            updateViewFromModel()
        }
    }
    
    private func updateViewFromModel(){
        if cardCollection != nil {
            for index in cardCollection.indices {
                let button = cardCollection[index]
                let card =  game.cards[index]
                if card.isFacedUp {
                    button.setTitle(emoji(for: card), for: UIControl.State.normal)
                    button.backgroundColor = #colorLiteral(red: 0.9552925229, green: 0.6590597034, blue: 0.5464593172, alpha: 1)
                } else {
                    let icon = card.isMatched ? "💛" : ""
                    button.setTitle(icon, for: UIControl.State.normal)
                    button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9950817681, green: 0.9950817681, blue: 0.9950817681, alpha: 0.02588578345) : #colorLiteral(red: 0.07206108421, green: 0.3676509857, blue: 0.4513658285, alpha: 1)

                }
            }
        }

    }
    
    var theme: Array<String>? {
        didSet{
            emojiChoices = theme ?? []
            emojis = [:]
            updateViewFromModel()
        }
    }
    
    private var emojiChoices = [String]()
    private var emojis = [Int:String]()
    
    private func emoji(for card:Card) -> String  {
        if emojis[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            
            emojis[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emojis[card.identifier] ?? "?"
    } 
    
}

