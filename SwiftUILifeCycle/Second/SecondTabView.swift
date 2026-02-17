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
        print("DEBUG: SecondTabView: init")
    }
    
    var body: some View {
        let _ = print("DEBUG: SecondTabView: body")
        VStack {
            Text("SecondTabView")
                .font(.largeTitle)
            
            Button {
                showThird = true
            } label: {
                Text("Show Second Child View")
                    .padding(5)
            }
            .buttonStyle(.borderedProminent)
            .tint(.orange)
            
        }
        .task {
            print("DEBUG: SecondTabView: task")
        }
        .onAppear {
            print("DEBUG: SecondTabView: onAppear")
        }
        .onDisappear {
            print("DEBUG: SecondTabView: onDisappear")
        }
        .fullScreenCover(isPresented: $showThird) {
            SecondChildView()
        }
    }
}

#Preview {
    SecondTabView()
        .environment(AppStateStore())
}
