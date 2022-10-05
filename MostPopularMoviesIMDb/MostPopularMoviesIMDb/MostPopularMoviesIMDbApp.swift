//
//  MostPopularMoviesIMDbApp.swift
//  MostPopularMoviesIMDb
//
//  Created by user226746 on 10/4/22.
//

import SwiftUI

@main
struct MostPopularMoviesIMDbApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(MoviesViewModel())
        }
    }
}
