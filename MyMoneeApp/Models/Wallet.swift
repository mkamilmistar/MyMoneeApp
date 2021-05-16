//
//  Wallet.swift
//  MyMoneeApp
//
//  Created by MacBook on 16/05/21.
//

import Foundation

class Wallet {
    var id: Int
    var balance: Decimal
    var userId: Int
    
    init(id: Int, balance: Decimal, userId: Int) {
        self.id = id
        self.balance = balance
        self.userId = userId
    }
}

var wallets: [Wallet] = [
    Wallet(id: 0, balance: 5000000.0, userId: 0),
    Wallet(id: 1, balance: 5000000.0, userId: 1),
    Wallet(id: 2, balance: 5000000.0, userId: 2)
]
