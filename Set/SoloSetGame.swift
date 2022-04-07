//
//  SoloSetGame.swift
//  Set
//
//  Created by Amanuel Ayele on 3/20/22.
//

import Foundation

class SoloSetGame: ObservableObject {
    typealias Card = SetGame.Card
    
    @Published private var model = SetGame()
    
    var cards: Array<Card> {
        return model.dealtCards
    }

    // MARK: - intent(s)

    func choose(_ card: Card) {
        model.select(card)
    }
}


