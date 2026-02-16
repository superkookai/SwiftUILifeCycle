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
        print("Main View: init")
    }
    
    var body: some View {
        let _ = print("Main View: body")
        VStack {
            Text("Main View")
                .font(.largeTitle)
            
            Text("Counter: \(counter)")
                .font(.title)
            
            Text(appStateStore.text)
                .font(.title)
                .foregroundStyle(.red)
            
            Button {
                counter += 1
                print("Main View: Increase Counter Button")
            } label: {
                Text("Increase Counter")
                    .padding(8)
            }
            .buttonStyle(.borderedProminent)
            .tint(.purple)
            
            Button {
                isPresented = true
                print("Main View: isPresented Button")
            } label: {
                Text("Show Second View")
                    .padding(8)
            }
            .buttonStyle(.borderedProminent)

        }
        .fullScreenCover(isPresented: $isPresented, content: {
//            SecondView(counter: $counter)
            SecondView()
        })
        .task {
            print("Main View: task")
        }
        .onAppear {
            print("Main View: onAppear")
        }
        .onDisappear {
            print("Main View: onDisappear")
        }
        .onChange(of: counter) { _, newValue in
            print("Main View: onChange counter: \(newValue)")
        }
    }
}

#Preview {
    FirstTabView()
        .environment(AppStateStore())
}
