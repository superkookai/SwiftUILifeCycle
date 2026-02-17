//
//  SwiftUILifeCycleApp.swift
//  SwiftUILifeCycle
//
//  Created by Weerawut on 16/2/2569 BE.
//

import SwiftUI

@main
struct SwiftUILifeCycleApp: App {
    @State private var appState = AppStateStore()
    
    init () {
        print("DEBUG: App init")
    }
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environment(appState)
        }
    }
}
