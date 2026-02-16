//
//  ThridView.swift
//  SwiftUILifeCycle
//
//  Created by Weerawut on 16/2/2569 BE.
//

import SwiftUI

struct ThridView: View {
    @State private var anotherManager = AnotherManager()
    @State private var fetchedData: String?
    
    @Environment(\.dismiss) private var dismiss
    @Environment(AppStateStore.self) private var appStateStore
    
    private var networkManager = NetworkManager()
    
    init() {
        print("Third View: init")
    }
    
    var body: some View {
        let _ = print("Third View: body")
        VStack {
            Text("Thrid View")
                .font(.largeTitle)
            
            Text(anotherManager.text)
                .font(.title)
            
            Text(fetchedData ?? "Loading...")
                .font(.title)
            
            Text(appStateStore.text)
                .font(.title)
            
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
            print("Third View: task")
            fetchedData = await  networkManager.fetchData()
        }
        .onAppear {
            print("Third View: onAppear")
        }
        .onDisappear {
            print("Third View: onDisappear")
        }
    }
}

#Preview {
    ThridView()
        .environment(AppStateStore())
}
