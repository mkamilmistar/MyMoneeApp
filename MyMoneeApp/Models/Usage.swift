//
//  Transaction.swift
//  MyMoneeApp
//
//  Created by MacBook on 11/05/21.
//

import Foundation

enum UsageType {
    case pengeluaran
    case pemasukan
}

class Usage {
    var id: String
    var title: String
    var date: Date
    var price: Decimal
    var status: UsageType
    
    init(id: String, title: String, price: Decimal, date: Date, status: UsageType) {
        self.id = id
        self.title = title
        self.price = price
        self.date = date
        self.status = status
    }
}

var usages: [Usage] = [
//    Usage(id: "MM-128371", title: "Bayar Listrik", price: 256000, date: getDateByString(date: "2021-05-1 19:30:27"), status: .pengeluaran),
//    Usage(id: "MM-584933", title: "Gaji", price: 1250000, date: getDateByString(date: "2021-05-1 08:00:27"), status: .pemasukan),
]

var usages2: [Usage] = [
    Usage(id: "MM-128371", title: "Bayar Listrik", price: 125000, date: getDateByString(date: "2021-05-1 19:30:27"), status: .pengeluaran),
    Usage(id: "MM-584933", title: "Gaji", price: 1250000, date: getDateByString(date: "2021-05-1 19:30:27"), status: .pemasukan),
]

var usages3: [Usage] = [
    Usage(id: "MM-128371", title: "Bayar Listrik", price: 125000, date: getDateByString(date: "2021-05-1 19:30:27"), status: .pengeluaran),
    Usage(id: "MM-584933", title: "Gaji", price: 1250000, date: getDateByString(date: "2021-05-1 08:00:27"), status: .pemasukan),
]
