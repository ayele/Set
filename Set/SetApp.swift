//
//  SetApp.swift
//  Set
//
//  Created by Amanuel Ayele on 3/20/22.
//

import SwiftUI

@main
struct SetApp: App {
    private let game = SoloSetGame()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                SetGameView(game: game)
            }
        }
    }
}
