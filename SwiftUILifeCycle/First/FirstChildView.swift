//
//  SecondView.swift
//  SwiftUILifeCycle
//
//  Created by Weerawut on 16/2/2569 BE.
//

import SwiftUI

struct FirstChildView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(AppStateStore.self) var appState
    
    init() {
        print("DEBUG: FirstChildView: init")
    }
    
    var body: some View {
        @Bindable var appState = appState
        let _ = print("DEBUG: FirstChildView: body")
        VStack {
            Text("FirstChildView")
                .font(.largeTitle)
            
            Group {
                if appState.text.isEmpty {
                    Text(" ")
                } else {
                    Text(appState.text)
                }
            }
            .font(.title)
            .foregroundStyle(.teal)
            
            TextField("Change Text", text: $appState.text)
                .padding()
                .background(.regularMaterial, in: .rect(cornerRadius: 5))
                .padding(.horizontal)
            
            
            Button {
                dismiss()
            } label: {
                Text("Dismiss")
                    .padding(5)
            }
            .buttonStyle(.borderedProminent)
            .tint(.green)

        }
        .task {
            print("DEBUG: FirstChildView: task")
        }
        .onAppear {
            print("DEBUG: FirstChildView: onAppear")
        }
        .onDisappear {
            print("DEBUG: FirstChildView: onDisappear")
        }
    }
}

#Preview {
    FirstChildView()
        .environment(AppStateStore())
}
