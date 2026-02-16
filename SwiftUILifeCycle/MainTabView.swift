//
//  MainTabView.swift
//  SwiftUILifeCycle
//
//  Created by Weerawut on 16/2/2569 BE.
//

import SwiftUI

struct MainTabView: View {
    init () {
        print("MainTabView: init")
    }
    var body: some View {
        let _ = print("MainTabView: body")
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
            print("MainTabView: task")
        }
        .onAppear {
            print("MainTabView: onAppear")
        }
        .onDisappear {
            print("MainTabView: onDisappear")
        }
    }
}

#Preview {
    MainTabView()
        .environment(AppStateStore())
}
