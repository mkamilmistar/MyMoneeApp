//
//  Wallet.swift
//  MyMoneeApp
//
//  Created by MacBook on 16/05/21.
//

import Foundation

class Wallet {
    var walletId: Int
    var balance: Decimal
    var userId: Int
    
    init(walletId: Int, balance: Decimal, userId: Int) {
        self.walletId = walletId
        self.balance = balance
        self.userId = userId
    }
}

var wallets: [Wallet] = [
    Wallet(walletId: 0, balance: 5000000.0, userId: 0),
    Wallet(walletId: 1, balance: 5000000.0, userId: 1),
    Wallet(walletId: 2, balance: 5000000.0, userId: 2)
]
