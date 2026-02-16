//
//  AnotherNavigateView.swift
//  SwiftUILifeCycle
//
//  Created by Weerawut on 16/2/2569 BE.
//

import SwiftUI

struct AnotherNavigateView: View {
    @Environment(AppStateStore.self) var appStateStore
    @State private var anotherManager = AnotherManager()
    
    @State private var fetchedText : String?
    private var networkManager = NetworkManager()
    
    init() {
        print("AnotherNavigateView: init")
    }
    
    var body: some View {
        let _ = print("AnotherNavigateView: body")
        VStack {
            Text("AnotherNavigateView:")
                .font(Font.largeTitle)
            
            Text(anotherManager.text)
                .font(.title)
            
            Text(fetchedText ?? "Loading...")
                .font(.title)
            
            Text(appStateStore.text)
                .font(.title)
        }
        .task {
            print("AnotherNavigateView: task")
            fetchedText = await networkManager.fetchData()
        }
        .onAppear {
            print("AnotherNavigateView: onAppear")
        }
        .onDisappear {
            print("AnotherNavigateView: onDisappear")
        }
    }
}

#Preview {
    AnotherNavigateView()
        .environment(AppStateStore())
}
