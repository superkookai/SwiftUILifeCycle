//
//  ThirdTabView.swift
//  SwiftUILifeCycle
//
//  Created by Weerawut on 16/2/2569 BE.
//

import SwiftUI

struct ThirdTabView: View {
    init() {
        print("ThirdTabView: init")
    }
    
    var body: some View {
        let _ = print("ThirdTabView: body")
        NavigationStack {
            NavigationLink {
                NavigateView()
            } label: {
                Text("To Navigated View")
                    .padding(5)
            }
            .buttonStyle(.borderedProminent)
            .navigationBarTitle("Third Tab")
        }
        .task {
            print("ThirdTabView: task")
        }
        .onAppear {
            print("ThirdTabView: onAppear")
        }
        .onDisappear {
            print("ThirdTabView: onDisappear")
        }
    }
}

#Preview {
    ThirdTabView()
        .environment(AppStateStore())
}
