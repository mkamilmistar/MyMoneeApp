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
    var currentAmount: Decimal
    var progress: Float
    
    init(id: Int, title: String,  currentAmount: Decimal, targetAmount: Decimal, progress: Float) {
        self.id = id
        self.title = title
        self.currentAmount = currentAmount
        self.targetAmount = targetAmount
        self.progress = progress
    }
}

var dreams: [Dream] = [
    Dream(id: 0, title: "Membeli Mobil", currentAmount: 200000000.0, targetAmount: 200000000.0, progress: 0.1),
    Dream(id: 1, title: "Membeli Airpods Baru", currentAmount: 750000.0, targetAmount: 1500000.0, progress: 0.5),
    Dream(id: 2, title: "Membeli Sepatu Adidas", currentAmount: 450000.0, targetAmount: 500000.0, progress: 0.8)
]
