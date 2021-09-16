//
//  EmojiViewModel.swift
//  doYouRemember
//
//  Created by Gove Allen on 9/8/21.
//  Copyright © 2021 Eli Allen. All rights reserved.
//

import SwiftUI


class EmojiViewModel: ObservableObject{
    @Published var game = createGame()
    @Published var score = 0
    
    
    static let emojis = ["🍏","🍓","🥝","🫑","🥐"]
    
    static func createGame () -> DoYouRememberGame<String>{
        let emojiList = emojis.shuffled().prefix(Int.random(in: 2...emojis.count))
        return DoYouRememberGame<String>(numberOfPairsOfCards: emojiList.count){emojiList[$0]}
    }
    
    // MARK: - Game Control
    func createNewGame(){
        game = EmojiViewModel.createGame()
    }
    
    // MARK: - Access to model
    var cards: Array<DoYouRememberGame<String>.Card>{
        game.cards
    }
    
    // MARK: - Intents
    func choose(card: DoYouRememberGame<String>.Card){
        game.choose(card: card, reportOutcomeScore: addScore)
    }
    
    func addScore(_ score: Int){
        self.score = self.score + score
    }
}
