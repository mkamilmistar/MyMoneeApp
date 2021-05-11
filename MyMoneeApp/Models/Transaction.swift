//
//  Transaction.swift
//  MyMoneeApp
//
//  Created by MacBook on 11/05/21.
//

import Foundation

import Foundation
struct Transaction {
    var id: Int
    var title: String
    var date: String
    var price: String
    var status: Bool = false
    
    init(id: Int, title: String, price: String, date: String, status: Bool) {
        self.id = id
        self.title = title
        self.price = price
        self.date = date
        self.status = status
    }
}

let transaction: [Transaction] = [
    Transaction(id: 1, title: "Bayar Listrik", price: "-Rp 256.000", date: "1 Mei 2021 - 19.30", status: true),
    Transaction(id: 2, title: "Gaji", price: "+Rp 1.250.000", date: "1 Mei 2021 - 08.00", status: false),
]
