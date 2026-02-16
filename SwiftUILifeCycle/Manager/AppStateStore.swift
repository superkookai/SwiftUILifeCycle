//
//  AppStateStore.swift
//  SwiftUILifeCycle
//
//  Created by Weerawut on 16/2/2569 BE.
//

import Foundation

@Observable
class AppStateStore {
    var text: String = "Hello, World!"
    
    init () {
        print("AppStateStore init")
    }
}
