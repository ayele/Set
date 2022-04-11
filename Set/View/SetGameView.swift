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
        VStack {
            AspectVGrid(items: game.cards, aspectRatio: 3/2) { card in
                CardView(card: card)
                    .padding(4)
                    .onTapGesture {
                        game.select(card)
                    }
            }
            .padding()
            
            Button {
                
            } label: {
                Text("Deal")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(.red)
            }
            .padding(.horizontal)
            .cornerRadius(8)
        }
        .navigationTitle("Set Game")
        .background(Color(hex: "dcdee2"))
        .toolbar {
            Button("New Game"){}
        }
    }
}












struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SoloSetGame()
        NavigationView {
            SetGameView(game: game)
                .previewDevice("iPhone 12 mini")
            .previewInterfaceOrientation(.portrait)
        }
    }
}
