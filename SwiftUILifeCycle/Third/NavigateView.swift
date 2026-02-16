//
//  NavigateView.swift
//  SwiftUILifeCycle
//
//  Created by Weerawut on 16/2/2569 BE.
//

import SwiftUI

struct NavigateView: View {
    
    
    init() {
        print("NavigateView: init")
    }
    
    var body: some View {
        let _ = print("NavigateView: body")
        NavigationLink(destination: {
            AnotherNavigateView()
        }, label: {
            Text("To Another Navigation View")
                .padding(5)
        })
        .buttonStyle(.borderedProminent)
        .tint(.pink)
        .task {
            print("NavigateView: task")
        }
        .onAppear {
            print("NavigateView: onAppear")
        }
        .onDisappear {
            print("NavigateView: onDisappear")
        }
    }
}

#Preview {
    NavigationStack {
        NavigateView()
            .environment(AppStateStore())
    }
}
