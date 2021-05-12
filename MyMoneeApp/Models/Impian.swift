//
//  Impian.swift
//  MyMoneeApp
//
//  Created by MacBook on 12/05/21.
//

import Foundation
struct Impian {
    
    var id: Int
    var title: String
    var price: String
    var progress: Float
    
    init(id: Int, title: String, price: String, progress: Float) {
        self.id = id
        self.title = title
        self.price = price
        self.progress = progress
    }
}

let impian: [Impian] = [
    Impian(id: 0, title: "Membeli Mobil", price: "IDR 999.000 / IDR 200.000.000", progress: 0.1),
    Impian(id: 1, title: "Membeli Airpods Baru", price: "IDR 999.000 / IDR 1.500.000", progress: 0.5),
    Impian(id: 2, title: "Membeli Sepatu Adidas", price: "IDR 999.000 / IDR 500.000", progress: 0.8)
]
