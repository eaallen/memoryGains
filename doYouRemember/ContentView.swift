//
//  ContentView.swift
//  doYouRemember
//
//  Created by Gove Allen on 9/8/21.
//  Copyright © 2021 Eli Allen. All rights reserved.
//

import SwiftUI

//@available(iOS 14.0, *)
@available(iOS 14.0, *)
struct ContentView: View {
    @ObservedObject var viewModel = EmojiViewModel()
    
    
    private func columns(size: CGSize) -> [GridItem]{
        Array(repeating: GridItem(.flexible()), count: Int(size.width / 125 ))
    }
    var body: some View {
        GeometryReader{ geometry in
            LazyVGrid(columns: columns(size: geometry.size)) {
                ForEach(viewModel.cards){card in
                    CardView(card: card).onTapGesture(perform: {
                        self.viewModel.choose(card: card)
                    })
                        .aspectRatio(2/3, contentMode: .fit)
                        .font(self.viewModel.cards.count > 4 ? .title : .largeTitle)
                }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 14.0, *) {
            ContentView(viewModel: EmojiViewModel())
        } else {
            // Fallback on earlier versions
        }
    }
}
