//
//  SetGame.swift
//  Set
//
//  Created by Amanuel Ayele on 3/20/22.
//

import Foundation

struct SetGame {
    private(set) var cards: Array<Card>
    
    init(){
        cards = []
        for shape in FeatureType.allCases {
            for number in FeatureType.allCases {
                for color in FeatureType.allCases {
                    for shading in FeatureType.allCases {
                        let card = Card(shape: shape, number: number, color: color, shading: shading)
                        cards.append(card)
                    }
                }
            }
        }
        cards.shuffle()
    }
    
    func select(_ card: Card) {
        
    }
        
    struct Card: Identifiable {
        var isMatch: Bool = false
        let id = UUID()
        let shape: FeatureType
        let number: FeatureType
        let color: FeatureType
        let shading: FeatureType
    }
    
    enum FeatureType: CaseIterable {
        case featureTypeOne // diamond, 1, blue, solid
        case featureTypeTwo // squigle, 2, red, stripes
        case featureTypeThree // rect, 3, green, none
    }
}

