//
//  CardView.swift
//  Set
//
//  Created by Amanuel Ayele on 4/8/22.
//

import SwiftUI

struct CardView: View {
    let card: SetGame.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                    .foregroundColor(.white)
                HStack {
                    ForEach(0..<getNumber(for: card.number)) { index in
                        getShape(for: card.shape)
                            .aspectRatio(DrawingConstants.aspectRatio, contentMode: .fit)

                    }
                }
                .foregroundColor(getColor(for: card.color))
                .frame(width: geometry.size.width * 2/3, height: geometry.size.height * 2/3)
                
            }
        }
    }
    
    private func getNumber(for feature: SetGame.FeatureType) -> Int {
        switch feature {
        case .featureTypeOne: return 1
        case .featureTypeTwo: return 2
        case .featureTypeThree: return 3
        }
    }

    private func getColor(for feature: SetGame.FeatureType) -> Color {
        switch feature {
        case .featureTypeOne: return .blue
        case .featureTypeTwo: return .orange
        case .featureTypeThree: return .green
        }
    }

    private func getShape(for feature: SetGame.FeatureType) -> some View {
        Group {
            switch feature {
            case .featureTypeOne: getShading { Diamond() }
            case .featureTypeTwo: getShading { Squiggle() }
            case .featureTypeThree: getShading { Capsule() }
            }
        }
    }
    
    private func getShading<ContentView: Shape>(@ViewBuilder for content: @escaping () -> ContentView) -> some View {
        ZStack {
            switch card.shading {
            case .featureTypeOne: EmptyView() // open
            case .featureTypeTwo: HStripe(stripeSize: DrawingConstants.stripeSize).clipShape(content()) // striped
            case .featureTypeThree: content() // solid
            }
            content().stroke(lineWidth: DrawingConstants.lineWidth) // outline for everyone
        }
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 2
        static let lineWidth: CGFloat = 2
        static let aspectRatio: CGFloat = 1/2
        static let stripeSize: CGFloat = 0.7
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: SetGame.Card(shape: .featureTypeTwo, number: .featureTypeTwo, color: .featureTypeOne, shading: .featureTypeThree))
    }
}
