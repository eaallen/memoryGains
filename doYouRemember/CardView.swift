//
//  CardView.swift
//  CardView
//
//  Created by Gove Allen on 9/14/21.
//  Copyright © 2021 Eli Allen. All rights reserved.
//

import Foundation
import SwiftUI
struct CardView : View{
    var card: DoYouRememberGame<String>.Card
    var body: some View{
        GeometryReader{ geometry in
            if !card.isMathced {
                ZStack{
                    if card.isFaceUp {
                        RoundedRectangle(cornerRadius: Constants.cornerRadius).stroke()
                        RoundedRectangle(cornerRadius: Constants.cornerRadius).fill(Color.white)
                        Text(card.content).font(self.systemFont(for: geometry.size))
                    } else {
                        RoundedRectangle(cornerRadius: Constants.cornerRadius)
                    }
                }.foregroundColor(.blue)
            }
            
        }.aspectRatio(2/3, contentMode: .fit)
        
        
    }
    
    private func systemFont(for size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * Constants.emojiRatio)
    }
    
    // MARK: - Constants
    struct Constants{
        static let cornerRadius: CGFloat = 10
        static let emojiRatio = 0.75
    }
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: DoYouRememberGame<String>.Card(isFaceUp: true, isMathced: false, content: "🌽", id: "1"))
            .padding(50)
    }
}
