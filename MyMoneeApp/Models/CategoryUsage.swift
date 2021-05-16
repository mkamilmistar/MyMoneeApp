//
//  Usages.swift
//  MyMoneeApp
//
//  Created by MacBook on 13/05/21.
//

import Foundation

class CategoryUsage {
    let icon: String
    let label: String
    let type: UsageType
    
    init(icon: String, label: String, type: UsageType) {
        self.icon = icon
        self.label = label
        self.type = type
    }
}

let categoryUsage: [CategoryUsage] = [
    CategoryUsage(icon: "Arrow_Up", label: "Pemasukan", type: .moneyIn),
    CategoryUsage(icon: "Arrow_Down", label: "Pengeluaran", type: .moneyOut)
]
