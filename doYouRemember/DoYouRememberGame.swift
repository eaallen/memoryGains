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
            cards.append(Card(content: cardContent))
            cards.append(Card(content: cardContent))
        }
    }
    
    func choose(card: Card){
        print("you chose \(card)")
    }
    
    struct Card{
        var isFaceUp = true
        var isMathced = true
        var content: CardContent
    }
}
