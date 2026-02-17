//
//  AnotherNavigateView.swift
//  SwiftUILifeCycle
//
//  Created by Weerawut on 16/2/2569 BE.
//

import SwiftUI

struct ThirdNextChildView: View {
    @Environment(AppStateStore.self) var appStateStore
    @State private var anotherManager = AnotherManager()
    
    @State private var fetchedText : String?
    private var networkManager = NetworkManager()
    
    init() {
        print("DEBUG: ThirdNextChildView: init")
    }
    
    var body: some View {
        let _ = print("DEBUG: ThirdNextChildView: body")
        VStack {
            Text("ThirdNextChildView")
                .font(Font.largeTitle)
            
            Text(anotherManager.text)
                .font(.title)
            
            Text(fetchedText ?? "Loading...")
                .font(.title)
            
            Text(appStateStore.text)
                .font(.title)
        }
        .task {
            print("DEBUG: ThirdNextChildView: task")
            fetchedText = await networkManager.fetchData()
        }
        .onAppear {
            print("DEBUG: ThirdNextChildView: onAppear")
        }
        .onDisappear {
            print("DEBUG: ThirdNextChildView: onDisappear")
        }
    }
}

#Preview {
    ThirdNextChildView()
        .environment(AppStateStore())
}
