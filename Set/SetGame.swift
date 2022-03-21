//
//  SetGame.swift
//  Set
//
//  Created by Amanuel Ayele on 3/20/22.
//

import Foundation

struct SetGame {
    private(set) var cards: Array<Card>
    private var selectedCards: Array<Card>
    
    init(){
        cards = []
        selectedCards = []
        var feature = Feature(shape: .first, number: .first, color: .second, shading: .second)
        var card = Card(feature: feature, id: cards.count + 1)
        cards.append(card)
        feature = Feature(shape: .second, number: .first, color: .second, shading: .second)
        card = Card(feature: feature, id: cards.count + 1)
//        cards.append(card)
    }
    
    func select(_ card: Card) {
        
    }
        
    struct Card: Identifiable {
        var isMatch: Bool = false
        let feature: Feature
        let id: Int
    }
    
    struct Feature {
        let shape: FeatureStyle
        let number: FeatureStyle
        let color: FeatureStyle
        let shading: FeatureStyle
    }
    
    enum FeatureStyle {
        case first // diamond, 1, blue, solid
        case second // squigle, 2, red, stripes
        case third // rect, 3, green, none
    }
}
