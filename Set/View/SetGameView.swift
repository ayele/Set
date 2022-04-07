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
            }
            .padding()
            
            HStack {
                Button("Deal") {}
                    .foregroundColor(.white)
                    .padding()
                    .background(.blue)
                    .cornerRadius(8)
                Spacer()
                Button("New Game") {}
                    .foregroundColor(.white)
                    .padding()
                    .background(.blue)
                    .cornerRadius(8)
            }
            .padding()
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
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 2)
                    .foregroundColor(.white)
                HStack{
                    ForEach(0..<getNumber(for: card.number)) { index in
                        if card.shape == .featureTypeOne {
                            Diamond()
                                .stroke(lineWidth: DrawingConstants.lineWidth)
                                .aspectRatio(DrawingConstants.aspectRatio, contentMode: .fit)
                        } else if card.shape == .featureTypeTwo {
                            Squiggle()
                                .stroke(lineWidth: DrawingConstants.lineWidth)
                                .aspectRatio(DrawingConstants.aspectRatio, contentMode: .fit)
                        } else {
                            Capsule()
                                .stroke(lineWidth: DrawingConstants.lineWidth)
                                .aspectRatio(DrawingConstants.aspectRatio, contentMode: .fit)
                        }
                        
                    }
                }
                .foregroundColor(getColor(for: card.color))
                .frame(width: geometry.size.width * 2/3, height: geometry.size.height * 2/3)
                
            }
        }
    }
    
    private struct DrawingConstants {
        static let lineWidth: CGFloat = 2
        static let aspectRatio: CGFloat = 1/2
    }
}

private func getNumber(for feature: SetGame.FeatureType) -> Int {
    let number: Int
    switch feature {
    case .featureTypeOne: number = 1
    case .featureTypeTwo: number = 2
    default: number = 3
    }
    return number
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
