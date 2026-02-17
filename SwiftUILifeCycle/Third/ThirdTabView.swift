//
//  ThirdTabView.swift
//  SwiftUILifeCycle
//
//  Created by Weerawut on 16/2/2569 BE.
//

import SwiftUI

struct ThirdTabView: View {
    init() {
        print("DEBUG: ThirdTabView: init")
    }
    
    var body: some View {
        let _ = print("DEBUG: ThirdTabView: body")
        NavigationStack {
            NavigationLink {
                ThirdChildView()
            } label: {
                Text("To Third Child View")
                    .padding(5)
            }
            .buttonStyle(.borderedProminent)
            .navigationBarTitle("ThirdTabView")
        }
        .task {
            print("DEBUG: ThirdTabView: task")
        }
        .onAppear {
            print("DEBUG: ThirdTabView: onAppear")
        }
        .onDisappear {
            print("DEBUG: ThirdTabView: onDisappear")
        }
    }
}

#Preview {
    ThirdTabView()
        .environment(AppStateStore())
}
