//
//  SecondView.swift
//  SwiftUILifeCycle
//
//  Created by Weerawut on 16/2/2569 BE.
//

import SwiftUI

struct SecondView: View {
//    @Binding var counter: Int
    @Environment(\.dismiss) private var dismiss
    @Environment(AppStateStore.self) var appState
    
//    init(counter: Binding<Int>) {
//        self._counter = counter
//        print("Second View: init")
//    }
    
    init() {
        print("Second View: init")
    }
    
    var body: some View {
        @Bindable var appState = appState
        let _ = print("Second View: body")
        VStack {
            Text("Second View")
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
            
//            Button {
//                counter += 1
//            } label: {
//                Text("Increase Counter")
//                    .padding(5)
//            }
//            .buttonStyle(.borderedProminent)
            
            TextField("Change Text", text: $appState.text)
                .padding()
                .background(.regularMaterial, in: .rect(cornerRadius: 5))
                .padding(.horizontal)
            
//            Button {
//                appState.text = "Changed Text"
//                print("Second View: Change Text button")
//            } label: {
//                Text("Change Text")
//                    .padding(5)
//            }
//            .buttonStyle(.borderedProminent)

            
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
            print("Second View: task")
        }
        .onAppear {
            print("Second View: onAppear")
        }
        .onDisappear {
            print("Second View: onDisappear")
        }
    }
}

#Preview {
//    SecondView(counter: .constant(0))
    SecondView()
        .environment(AppStateStore())
}
