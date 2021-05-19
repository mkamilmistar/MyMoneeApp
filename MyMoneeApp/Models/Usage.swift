//
//  Transaction.swift
//  MyMoneeApp
//
//  Created by MacBook on 11/05/21.
//

import Foundation

enum UsageType {
    case moneyOut
    case moneyIn
}

class Usage {
    var id: String
    var title: String
    var date: Date
    var amount: Decimal
    var status: UsageType
    var userId: Int
    
    init(id: String, title: String, price: Decimal, date: Date, status: UsageType, UserId: Int) {
        self.id = id
        self.title = title
        self.amount = price
        self.date = date
        self.status = status
        self.userId = UserId
    }
}

var usages: [Usage] = [
    Usage(id: String.randomCapitalizeWithNumber(), title: "Bayar Listrik", price: 251000, date: ("2021-05-1 19:30:27").setStringToDate, status: .moneyOut, UserId: 0),
    Usage(id: String.randomCapitalizeWithNumber(), title: "Gaji", price: 1250000, date: ("2021-05-1 08:00:27").setStringToDate, status: .moneyIn, UserId: 0)
]
