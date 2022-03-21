//
//  ContentView.swift
//  Set
//
//  Created by Amanuel Ayele on 3/20/22.
//

import SwiftUI

struct SetGameView: View {
    @ObservedObject var game: SoloSetGame
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]){
            ForEach(game.cards) { card in
                CardView()
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .background(.purple)
    }
}

struct CardView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
            HStack{
                Squiggle()
//                Diamond()
//                    .stroke(lineWidth: 5)
            }
            
        }
    }
}













struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SoloSetGame()
        SetGameView(game: game)
            .previewDevice("iPhone 12 mini")
    }
}
