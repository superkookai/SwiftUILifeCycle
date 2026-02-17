//
//  ContentView.swift
//  SwiftUILifeCycle
//
//  Created by Weerawut on 16/2/2569 BE.
//

import SwiftUI

struct FirstTabView: View {
    @State private var isPresented: Bool = false
    @State private var counter: Int = 0
    
    @Environment(AppStateStore.self) private var appStateStore
    
    init () {
        print("DEBUG: FirstTabView: init")
    }
    
    var body: some View {
        let _ = print("DEBUG: FirstTabView: body")
        VStack {
            Text("FirstTabView")
                .font(.largeTitle)
            
            Text("Counter: \(counter)")
                .font(.title)
            
            Text(appStateStore.text)
                .font(.title)
                .foregroundStyle(.red)
            
            Button {
                counter += 1
                print("DEBUG: FirstTabView: Increase Counter Button")
            } label: {
                Text("Increase Counter")
                    .padding(8)
            }
            .buttonStyle(.borderedProminent)
            .tint(.purple)
            
            Button {
                isPresented = true
                print("DEBUG: FirstTabView: isPresented Button")
            } label: {
                Text("Show First Child View")
                    .padding(8)
            }
            .buttonStyle(.borderedProminent)

        }
        .fullScreenCover(isPresented: $isPresented, content: {
            FirstChildView()
        })
        .task {
            print("DEBUG: FirstTabView: task")
        }
        .onAppear {
            print("DEBUG: FirstTabView: onAppear")
        }
        .onDisappear {
            print("DEBUG: FirstTabView: onDisappear")
        }
        .onChange(of: counter) { _, newValue in
            print("DEBUG: FirstTabView: onChange counter: \(newValue)")
        }
    }
}

#Preview {
    FirstTabView()
        .environment(AppStateStore())
}
