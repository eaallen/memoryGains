//
//  DoYouRememberGame.swift
//  doYouRemember
//
//  Created by Gove Allen on 9/8/21.
//  Copyright © 2021 Eli Allen. All rights reserved.
//

import Foundation

struct DoYouRememberGame<CardContent>{
    var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int)->CardContent){
        cards = Array<Card>()
        for i in 0 ..< numberOfPairsOfCards{
            let cardContent = cardContentFactory(i)
            cards.append(Card(content: cardContent, id: "\(i)_part_a"))
            cards.append(Card(content: cardContent, id: "\(i)_part_b"))
        }
        cards = cards.shuffled()
    }
    
    mutating func choose(card: Card){
        if let i = index(of: card){
            cards[i].flip()
            print("you chose \(cards[i])")
        }
    }
    
    private func index(of cardWanted: Card) -> Int?{
        for i in 0..<cards.count{
            let card = cards[i]
            if card.id == cardWanted.id {
                return i
            }
        }
        return nil
    }
    
    
    struct Card: Identifiable{
        var isFaceUp = true
        var isMathced = true
        var content: CardContent	
        var id: String
        
        mutating func flip(){
            isFaceUp.toggle()
        }
    }
}
