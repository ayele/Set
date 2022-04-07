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
            AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
                CardView(card: card)
                    .padding(4)
            }
            .padding(.horizontal)
            
            Button("Deal") {}
                .foregroundColor(.white)
                .padding()
                .background(.blue)
                .cornerRadius(8)
        }
        .background(Color(hex: "dcdee2"))
        .toolbar {
            Button("New Game"){}
        }
    }
}

struct CardView: View {
    let card: SetGame.Card
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
            HStack{
                Diamond()
                    .stroke(lineWidth: 2)
                    .frame(width: 30, height: 60)
                    .foregroundColor(getColor(for: card.color))
            }
            
        }
    }
}

private func getColor(for feature: SetGame.FeatureType) -> Color {
    if feature == .featureTypeOne {
        return Color.blue
    } else if feature == .featureTypeTwo {
        return Color.orange
    } else {
        return Color.green
    }
}












struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SoloSetGame()
        SetGameView(game: game)
            .previewDevice("iPhone 12 mini")
.previewInterfaceOrientation(.portrait)
    }
}
