//
//  ThridView.swift
//  SwiftUILifeCycle
//
//  Created by Weerawut on 16/2/2569 BE.
//

import SwiftUI

struct SecondChildView: View {
    @State private var anotherManager = AnotherManager()
    @State private var fetchedData: String?
    
    @Environment(\.dismiss) private var dismiss
    @Environment(AppStateStore.self) private var appStateStore
    
    private var networkManager = NetworkManager()
    
    init() {
        print("DEBUG: SecondChildView: init")
    }
    
    var body: some View {
        let _ = print("DEBUG: SecondChildView: body")
        VStack {
            Text("SecondChildView")
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
            print("DEBUG: SecondChildView: task")
            fetchedData = await  networkManager.fetchData()
        }
        .onAppear {
            print("DEBUG: SecondChildView: onAppear")
        }
        .onDisappear {
            print("DEBUG: SecondChildView: onDisappear")
        }
    }
}

#Preview {
    SecondChildView()
        .environment(AppStateStore())
}
