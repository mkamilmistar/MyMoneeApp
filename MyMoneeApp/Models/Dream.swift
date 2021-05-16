//
//  Impian.swift
//  MyMoneeApp
//
//  Created by MacBook on 12/05/21.
//

import Foundation
struct Dream {
    var id: Int
    var title: String
    var targetAmount: Decimal
    
    init(id: Int, title: String, targetAmount: Decimal) {
        self.id = id
        self.title = title
        self.targetAmount = targetAmount
    }
}

var dreams: [Dream] = [
//    Dream(id: 0, title: "Membeli Mobil", targetAmount: 200000000.0),
//    Dream(id: 1, title: "Membeli Airpods Baru", targetAmount: 1500000.0),
//    Dream(id: 2, title: "Membeli Sepatu Adidas", targetAmount: 500000.0)
]

var dreams2: [Dream] = [
    Dream(id: 0, title: "Membeli Mobil", targetAmount: 200000000.0),
    Dream(id: 1, title: "Membeli Airpods Baru", targetAmount: 1500000.0),
    Dream(id: 2, title: "Membeli Sepatu Adidas", targetAmount: 500000.0)
]

var dreams3: [Dream] = [
    Dream(id: 0, title: "Membeli Mobil", targetAmount: 200000000.0),
    Dream(id: 1, title: "Membeli Airpods Baru", targetAmount: 1500000.0),
    Dream(id: 2, title: "Membeli Sepatu Adidas", targetAmount: 500000.0)
]
