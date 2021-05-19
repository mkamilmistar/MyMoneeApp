//
//  Impian.swift
//  MyMoneeApp
//
//  Created by MacBook on 12/05/21.
//

import Foundation
struct Dream {
    var id: String
    var title: String
    var targetAmount: Decimal
    var userId: Int
    
    init(id: String, title: String, targetAmount: Decimal, userId: Int) {
        self.id = id
        self.title = title
        self.targetAmount = targetAmount
        self.userId = userId
    }
}

var dreams: [Dream] = [
    Dream(id: NSUUID().uuidString, title: "Membeli Mobil", targetAmount: 200000000.0, userId: 0),
    Dream(id: NSUUID().uuidString, title: "Membeli Airpods Baru", targetAmount: 1500000.0, userId: 0),
    Dream(id: NSUUID().uuidString, title: "Membeli Sepatu Adidas", targetAmount: 500000.0, userId: 0)
]

var dreams2: [Dream] = [
    Dream(id: NSUUID().uuidString, title: "Membeli Mobil", targetAmount: 200000000.0, userId: 1),
    Dream(id: NSUUID().uuidString, title: "Membeli Airpods Baru", targetAmount: 1500000.0, userId: 1),
    Dream(id: NSUUID().uuidString, title: "Membeli Sepatu Adidas", targetAmount: 500000.0, userId: 1)
]

var dreams3: [Dream] = [
    Dream(id: NSUUID().uuidString, title: "Membeli Mobil", targetAmount: 200000000.0, userId: 2),
    Dream(id: NSUUID().uuidString, title: "Membeli Airpods Baru", targetAmount: 1500000.0, userId: 2),
    Dream(id: NSUUID().uuidString, title: "Membeli Sepatu Adidas", targetAmount: 500000.0, userId: 2)
]
