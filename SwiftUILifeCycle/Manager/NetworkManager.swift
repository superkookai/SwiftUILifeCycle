//
//  NetworkManager.swift
//  SwiftUILifeCycle
//
//  Created by Weerawut on 16/2/2569 BE.
//

import Foundation

class NetworkManager {
    init() {
        print("DEBUG: Network Manager: init")
    }
    
    func fetchData() async -> String {
        return "Data is fetched!"
    }
}
