//
//  AnotherManager.swift
//  SwiftUILifeCycle
//
//  Created by Weerawut on 16/2/2569 BE.
//

import Foundation

@Observable
class AnotherManager {
    var text: String = "Another World!!"
    
    init() {
        print("AnotherManager init")
    }
}
