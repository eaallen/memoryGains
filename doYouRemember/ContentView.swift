//
//  ContentView.swift
//  doYouRemember
//
//  Created by Gove Allen on 9/8/21.
//  Copyright © 2021 Eli Allen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var viewModel = EmojiViewModel()
    var body: some View {
        HStack {
            ForEach(viewModel.cards.shuffled()){card in
                CardView(card: card).onTapGesture(perform: {
                    self.viewModel.choose(card: card)
                }).aspectRatio(2/3, contentMode: .fit).font(self.viewModel.cards.count > 4 ? .title : .largeTitle)
            }
        }
    }
}

struct CardView : View{
    var card: DoYouRememberGame<String>.Card
    var body: some View{
        ZStack{
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10).stroke()
                RoundedRectangle(cornerRadius: 10).fill(Color.white)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10)
            }
        }.foregroundColor(.blue)
        
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiViewModel())
    }
}
