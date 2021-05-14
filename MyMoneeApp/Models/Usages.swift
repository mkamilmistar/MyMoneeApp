//
//  Usages.swift
//  MyMoneeApp
//
//  Created by MacBook on 13/05/21.
//

import Foundation

enum UsageType {
    case pengeluaran
    case pemasukan
}

class Usages {
    let title: String
    let type: UsageType
    
    init(title: String, type: UsageType) {
        self.title = title
        self.type = type
    }
}

let usagesType: [Usages] = [
    Usages(title: "Pemasukan", type: .pemasukan),
    Usages(title: "Pengeluaran", type: .pengeluaran)
]
