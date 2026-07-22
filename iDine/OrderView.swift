//
//  OrderView.swift
//  iDine
//
//  Created by Pamela VanLeirsburg on 7/21/26.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }
                    .onDelete(perform: deleteItems) // performs the deleteItems function - Delete occurs when items are swiped.
                }
                
                Section {
                    NavigationLink("Place Order") {
                        CheckoutView()
                    }
                }
                .disabled(order.items.isEmpty)  //disables when no items are present - grays out, does not disappear
            }
            .navigationTitle("Order")
            .toolbar {
                EditButton()  // adds an option to modify order
            }
        }
    }
    
    func deleteItems(at offsets: IndexSet) { // deletes items previously added.
        order.items.remove(atOffsets: offsets) //remove is a built in method
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(Order())
    }
}
