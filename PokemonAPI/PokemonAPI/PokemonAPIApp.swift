//
//  PokemonAPIApp.swift
//  PokemonAPI
//
//  Created by user226746 on 9/30/22.
//

import SwiftUI

@main
struct PokemonAPIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(PokemonsViewModel())
        }
    }
}
