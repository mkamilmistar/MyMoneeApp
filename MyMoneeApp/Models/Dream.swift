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
    var progress: Float
    
    init(id: Int, title: String, targetAmount: Decimal, progress: Float) {
        self.id = id
        self.title = title
        self.targetAmount = targetAmount
        self.progress = progress
    }
}

var dreams: [Dream] = [
    Dream(id: 0, title: "Membeli Mobil", targetAmount: 200000000.0, progress: 0.1),
    Dream(id: 1, title: "Membeli Airpods Baru", targetAmount: 1500000.0, progress: 0.5),
    Dream(id: 2, title: "Membeli Sepatu Adidas", targetAmount: 500000.0, progress: 0.8)
]

var dreams2: [Dream] = [
    Dream(id: 0, title: "Membeli Mobil", targetAmount: 200000000.0, progress: 0.1),
    Dream(id: 1, title: "Membeli Airpods Baru", targetAmount: 1500000.0, progress: 0.5),
    Dream(id: 2, title: "Membeli Sepatu Adidas", targetAmount: 500000.0, progress: 0.8)
]

var dreams3: [Dream] = [
    Dream(id: 0, title: "Membeli Mobil", targetAmount: 200000000.0, progress: 0.1),
    Dream(id: 1, title: "Membeli Airpods Baru", targetAmount: 1500000.0, progress: 0.5),
    Dream(id: 2, title: "Membeli Sepatu Adidas", targetAmount: 500000.0, progress: 0.8)
]
