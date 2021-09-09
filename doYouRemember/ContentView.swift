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
            ForEach(0 ..< 4){index in
                CardView(card: self.viewModel.cards[index])
            }
        }
    }
}

struct CardView : View{
    var card: DoYouRememberGame<String>.Card
    var body: some View{
        ZStack{
            if card.isFaceUp{
                RoundedRectangle(cornerRadius: 10).stroke()
                RoundedRectangle(cornerRadius: 10).fill(Color.white)
                Text(card.content)
                    .font(.largeTitle)
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
