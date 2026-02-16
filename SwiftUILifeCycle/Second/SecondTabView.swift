//
//  SecondTabView.swift
//  SwiftUILifeCycle
//
//  Created by Weerawut on 16/2/2569 BE.
//

import SwiftUI

struct SecondTabView: View {
    @State private var showThird: Bool = false
    
    init() {
        print("Second Tab View: init")
    }
    
    var body: some View {
        let _ = print("Second Tab View: body")
        VStack {
            Text("Second Tab View")
                .font(.largeTitle)
            
            Button {
                showThird = true
            } label: {
                Text("Show Third View")
                    .padding(5)
            }
            .buttonStyle(.borderedProminent)
            .tint(.orange)
            
        }
        .task {
            print("Second Tab View: task")
        }
        .onAppear {
            print("Second Tab View: onAppear")
        }
        .onDisappear {
            print("Second Tab View: onDisappear")
        }
        .fullScreenCover(isPresented: $showThird) {
            ThridView()
        }
    }
}

#Preview {
    SecondTabView()
        .environment(AppStateStore())
}
