//
//  MainView.swift
//  iDine
//
//  Created by Pamela VanLeirsburg on 7/21/26.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView { // allows user to switch between views - tab at bottom
            ContentView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash") //image is a built in image
                }
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil") //image is a built in image
                }
        }
    }
}

#Preview {
    MainView()
        .environmentObject(Order())
}
