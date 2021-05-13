//
//  Penggunaan.swift
//  MyMoneeApp
//
//  Created by MacBook on 13/05/21.
//

import Foundation

enum PenggunaanType {
    case pengeluaran
    case pemasukan
}

class Penggunaan {
    let title: String
    let type: PenggunaanType
    
    init(title: String, type: PenggunaanType) {
        self.title = title
        self.type = type
    }
}

let penggunaanType: [Penggunaan] = [
    Penggunaan(title: "Pemasukan", type: .pemasukan),
    Penggunaan(title: "Pengeluaran", type: .pengeluaran)
]
