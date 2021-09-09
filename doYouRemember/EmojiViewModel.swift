//
//  EmojiViewModel.swift
//  doYouRemember
//
//  Created by Gove Allen on 9/8/21.
//  Copyright © 2021 Eli Allen. All rights reserved.
//

import SwiftUI


class EmojiViewModel{
    var game = createGame()
        
    static func createGame () -> DoYouRememberGame<String>{
        DoYouRememberGame<String>(numberOfPairsOfCards: 2){$0 > 0 ? "🥥":"🍍"}
    }
    // MARK: - Access to model
    var cards: Array<DoYouRememberGame<String>.Card>{
        game.cards
    }
    
    // MARK - Intents
    func choose(card: DoYouRememberGame<String>.Card){
        game.choose(card: card)
    }
}
