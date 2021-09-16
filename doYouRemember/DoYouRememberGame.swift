//
//  DoYouRememberGame.swift
//  doYouRemember
//
//  Created by Gove Allen on 9/8/21.
//  Copyright © 2021 Eli Allen. All rights reserved.
//

import Foundation


struct DoYouRememberGame<CardContent> where CardContent: Equatable {
    var cards: Array<Card>
    
    var indexOfTheOneAndOnlyFaceUpCard: Int?
    var score = 0
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int)->CardContent){
        cards = Array<Card>()
        for i in 0 ..< numberOfPairsOfCards{
            let cardContent = cardContentFactory(i)
            cards.append(Card(content: cardContent, id: "\(i)_part_a"))
            cards.append(Card(content: cardContent, id: "\(i)_part_b"))
        }
        cards = cards.shuffled()
    }
    
    mutating func choose(card: Card, reportOutcomeScore: (Int) -> Void){
        if let choosenIndex = cards.firstIndex(of: card), !cards[choosenIndex].isMathced, !cards[choosenIndex].isFaceUp {
            
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                // print(cards[potentialMatchIndex].content , cards[choosenIndex].content)
                if cards[potentialMatchIndex].content == cards[choosenIndex].content {
                    // we found a match!
                    cards[choosenIndex].isFaceUp = true
                    cards[potentialMatchIndex].isFaceUp = true
                    cards[choosenIndex].isMathced = true
                    cards[potentialMatchIndex].isMathced = true
                    reportOutcomeScore(2)
                }else{
                    // did not find a match
                    reportOutcomeScore(-1)
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            }else{
                // we did not
                // there has got to be a better way to do this... refactor
                for index in cards.indices{
                    if !cards[index].isMathced {
                        cards[index].isFaceUp = false
                    }
                }
                
                indexOfTheOneAndOnlyFaceUpCard = choosenIndex
                
            }
            cards[choosenIndex].isFaceUp = true
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
        var isFaceUp = false
        var isMathced = false
        var content: CardContent	
        var id: String
        
        mutating func flip(){
            isFaceUp.toggle()
        }
    }
}
