//
//  NavigateView.swift
//  SwiftUILifeCycle
//
//  Created by Weerawut on 16/2/2569 BE.
//

import SwiftUI

struct ThirdChildView: View {
    
    
    init() {
        print("DEBUG: ThirdChildView: init")
    }
    
    var body: some View {
        let _ = print("DEBUG: ThirdChildView: body")
        NavigationLink(destination: {
            ThirdNextChildView()
        }, label: {
            Text("To Next Child View")
                .padding(5)
        })
        .buttonStyle(.borderedProminent)
        .tint(.pink)
        .task {
            print("DEBUG: ThirdChildView: task")
        }
        .onAppear {
            print("DEBUG: ThirdChildView: onAppear")
        }
        .onDisappear {
            print("DEBUG: ThirdChildView: onDisappear")
        }
    }
}

#Preview {
    NavigationStack {
        ThirdChildView()
            .environment(AppStateStore())
    }
}
