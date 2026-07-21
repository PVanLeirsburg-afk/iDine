//
//  iDineApp.swift
//  iDine
//
//  Created by Pamela VanLeirsburg on 7/20/26.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order() // creates a new oject when app lauches - @State keeps it alive throughout - For this to work, Order() must be an observable class
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(order)  // allows other views to use the order object
        }
    }
}

