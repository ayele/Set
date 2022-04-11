//
//  SetGame.swift
//  Set
//
//  Created by Amanuel Ayele on 3/20/22.
//

import Foundation

struct SetGame {
    private(set) var deck: Array<Card>
    private(set) var dealtCards: Array<Card>
    private(set) var selectedCards: Array<Card>
    
    init(){
        deck = []
        dealtCards = []
        selectedCards = []
        for shape in FeatureType.allCases {
            for number in FeatureType.allCases {
                for color in FeatureType.allCases {
                    for shading in FeatureType.allCases {
                        let card = Card(shape: shape, number: number, color: color, shading: shading)
                        deck.append(card)
                    }
                }
            }
        }
        deck.shuffle()
        deal(12)
    }
    
    mutating func select(_ card: Card) {
        
        if let index = dealtCards.index(matching: card) {
            dealtCards[index].isSelected.toggle()
        }
        
        
        
        
        
        
        
        
        
//        if !card.isMatch {
//            if let selectedIndex = dealtCards.firstIndex(where: { $0.id == card.id }) {
//                dealtCards[selectedIndex].isSelected.toggle()
//
//                if dealtCards[selectedIndex].isSelected {
//                    selectedCards.append(dealtCards[selectedIndex])
//                } else {
//                    if let itemToRemoveIndex = selectedCards.firstIndex(where: { $0.id == dealtCards[selectedIndex].id }) {
//                        selectedCards.remove(at: itemToRemoveIndex)
//                    }
//                }
//
//                if selectedCards.count == 3 {
//                    if isASet(selectedCards) {
//                        for card in selectedCards {
//                            if let selectedIndex = dealtCards.firstIndex(where: { $0.id == card.id }) {
//                                dealtCards[selectedIndex].isMatch = true
//                            }
//                        }
//                    } else {
//
//                    }
//                }
//            }
//        }
    }
    
    private func isASet(_ cards: Array<Card>) -> Bool {
        let cardOne = cards[0]
        let cardTwo = cards[1]
        let cardThree = cards[2]

        let allSameShapes = cardOne.shape == cardTwo.shape && cardOne.shape == cardThree.shape
        let allDifferentShapes = cardOne.shape != cardTwo.shape && cardOne.shape != cardThree.shape
        
        let allSameColors = cardOne.color == cardTwo.color && cardOne.color == cardThree.color
        let allDifferentColors = cardOne.color != cardTwo.color && cardOne.color != cardThree.color

        let allSameNumbers = cardOne.number == cardTwo.number && cardOne.number == cardThree.number
        let allDifferentNumbers = cardOne.number != cardTwo.number && cardOne.number != cardThree.number
        
        let allSameShadings = cardOne.shading == cardTwo.shading && cardOne.shading == cardThree.shading
        let allDifferentShadings = cardOne.shading != cardTwo.shading && cardOne.shading != cardThree.shading
        
        return (allSameShapes || allDifferentShapes) && (allSameColors || allDifferentColors) &&
        (allSameNumbers || allDifferentNumbers) && (allSameShadings || allDifferentShadings)
    }
    
    private func thereAreThreeSelectedCards() -> Bool {
        var selectedCount = 0
        for card in dealtCards {
            if card.isSelected {
                selectedCount += 1
            }
        }
        return selectedCount == 3
    }
    
    mutating func deal(_ numberOfCards: Int) {
        for _ in 0...numberOfCards - 1 {
            if let card = deck.first {
                dealtCards.append(card)
                // remove dealt card from deck
                deck.remove(card)
            }
        }
    }
        
    struct Card: Identifiable {
        var isMatch: Bool = false
        var isSelected: Bool = false
        var isDealt = false
        
        let id = UUID()
        let shape: FeatureType
        let number: FeatureType
        let color: FeatureType
        let shading: FeatureType
    }
 
    enum FeatureType: CaseIterable {
        case featureTypeOne // diamond, 1, blue, solid
        case featureTypeTwo // squigle, 2, red, stripes
        case featureTypeThree // capsule, 3, green, none
    }
}

