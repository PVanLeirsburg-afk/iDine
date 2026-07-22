//
//  CheckoutView.swift
//  iDine
//
//  Created by Pamela VanLeirsburg on 7/21/26.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    
    let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    @State private var  paymentType = "Cash"
    
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var showingPaymentAlert = false
    
    let tipAmounts = [10, 15, 20, 25, 0]
    @State private var tipAmount = 15
    
    var totalPrice: String {  //formats a calculated number and stores it in a variable as a string
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        return (total + tipValue).formatted(.currency(code: "USD"))
    }
    
    var body: some View { //body is invoked any time a state variable changes
        Section {
            Form { // puts label next to what you will pick
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0) // first value in array
                    }
                }
                Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails.animation()) //.animation() makes the TextField display more smoothly
                
                if addLoyaltyDetails {
                    TextField("Enter your iDine ID", text: $loyaltyNumber)
                }
                Section("Add a tip?") {
                    Picker("Percentage:", selection: $tipAmount) {
                        ForEach(tipAmounts, id:\.self) {
                            Text("\($0)%")
                        }
                    }
                    .pickerStyle(.segmented) // all options show up at one time.  Not a dropdown
                }
                
                Section("total: \(totalPrice)") {
                    Button("Confirm Order") {
                        showingPaymentAlert.toggle() // when button is pushed showingPaymentAlert value toggles to true
                    }
                    
                }
            }
            .navigationTitle("Payment")
            .navigationBarTitleDisplayMode(.inline)
            .alert("Order confirmed", isPresented: $showingPaymentAlert) {
                // add buttons here - default makes an ok button
            } message: {
                Text("Your total was \(totalPrice) - thank you!")
            }
        }
    }
}

#Preview {
    CheckoutView()
        .environmentObject(Order())
}
