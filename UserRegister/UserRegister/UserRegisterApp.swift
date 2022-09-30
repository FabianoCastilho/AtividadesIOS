//
//  UserRegisterApp.swift
//  UserRegister
//
//  Created by user226746 on 9/22/22.
//

import SwiftUI

@main
struct UserRegisterApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext )
        }
    }
}
