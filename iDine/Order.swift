//
//  Order.swift
//  iDine
//
//  Created by Paul Hudson on 27/06/2019.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import SwiftUI
import Combine  // ObservableObject and @Published come from Combine NOT Swift - MISSING FROM VIDEO

// an object (Order can be used in all other views.  It calculates all values below and stores them in an environment that can be accessed by declaring a variable in an alternate view: @EnvirnomentObject var order: Order.  When you want a value from the object, refer to it by order.total (name of variable.name of object)
class Order: ObservableObject { // announces changes to any views that are watching
    @Published var items = [MenuItem]() //will send alert any time it is changed

    var total: Int {
        if items.count > 0 {
            return items.reduce(0) { $0 + $1.price }
        } else {
            return 0
        }
    }

    func add(item: MenuItem) {
        items.append(item)
    }

    func remove(item: MenuItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
}
