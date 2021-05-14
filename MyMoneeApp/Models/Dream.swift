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
    var targetAmount: String
    var currentAmount: String
    var progress: Float
    
    init(id: Int, title: String,  currentAmount: String, targetAmount: String, progress: Float) {
        self.id = id
        self.title = title
        self.currentAmount = currentAmount
        self.targetAmount = targetAmount
        self.progress = progress
    }
}

let dreams: [Dream] = [
    Dream(id: 0, title: "Membeli Mobil", currentAmount: "", targetAmount: "IDR 999.000 / IDR 200.000.000", progress: 0.1),
    Dream(id: 1, title: "Membeli Airpods Baru", currentAmount: "", targetAmount: "IDR 999.000 / IDR 1.500.000", progress: 0.5),
    Dream(id: 2, title: "Membeli Sepatu Adidas", currentAmount: "", targetAmount: "IDR 999.000 / IDR 500.000", progress: 0.8)
]
