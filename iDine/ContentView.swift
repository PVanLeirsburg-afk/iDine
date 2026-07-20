//
//  ContentView.swift
//  iDine
//
//  Created by Pamela VanLeirsburg on 7/20/26.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(menu) { section in
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                }
            }
            .navigationTitle("Menu")
        }
    }
}

#Preview {
    ContentView()
}
