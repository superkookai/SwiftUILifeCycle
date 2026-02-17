//
//  MainTabView.swift
//  SwiftUILifeCycle
//
//  Created by Weerawut on 16/2/2569 BE.
//

import SwiftUI

struct MainTabView: View {
    init () {
        print("DEBUG: MainTabView: init")
    }
    var body: some View {
        let _ = print("DEBUG: MainTabView: body")
        TabView {
            Tab("First", systemImage: "1.circle") {
                FirstTabView()
            }
            
            Tab("Second", systemImage: "2.circle") {
                SecondTabView()
            }
            
            Tab("Third", systemImage: "3.circle") {
                ThirdTabView()
            }
        }
        .task {
            print("DEBUG: MainTabView: task")
        }
        .onAppear {
            print("DEBUG: MainTabView: onAppear")
        }
        .onDisappear {
            print("DEBUG: MainTabView: onDisappear")
        }
    }
}

#Preview {
    MainTabView()
        .environment(AppStateStore())
}
