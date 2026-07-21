//
//  ItemDetail.swift
//  iDine
//
//  Created by Pamela VanLeirsburg on 7/21/26.
//

import SwiftUI

struct ItemDetail: View {
    let item: MenuItem
    
    @EnvironmentObject var order: Order
    // default item not necessary.  Swift expects that oder value will be set.
    // also any time value changes, it will reload and update everywhere.
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                // .bottomTrailing moves it to the bottom
                // .offset moves it up and left a bit
                Image(item.mainImage)
                    .resizable()  // allows you to change the number of pixels for an image (distorts and fills screen)
                    .scaledToFit() // keeps the original aspect ratio - no longer distorted - .scaledToFill will make picture cover entire screen
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            Text(item.description)
                .padding()
            
            Button("Order This") {
                order.add(item: item)
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ItemDetail(item: MenuItem.example)
                .environmentObject(Order())
        }
    }
}
