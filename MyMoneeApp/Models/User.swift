//
//  Customer.swift
//  MyMoneeApp
//
//  Created by MacBook on 15/05/21.
//

import Foundation
class User {
    var userId: Int
    var name: String
    var imageProfile: String
    var balance: Decimal

    init(userId: Int, name: String, imageProfile: String, balance: Decimal) {
        self.userId = userId
        self.name = name
        self.imageProfile = imageProfile
        self.balance = balance
    }
}

let totalMoneyIn = transactions.filter({$0.type == "credit"}).map({$0.amount}).reduce(0, +)
let totalMoneyOut = transactions.filter({$0.type == "debit"}).map({$0.amount}).reduce(0, +)
let balance = totalMoneyIn - totalMoneyOut

var users: [User] = [
    User(userId: 0, name: "M. Kamil", imageProfile: "Profile_Photo", balance: balance),
    User(userId: 1, name: "Melia Suspariana", imageProfile: "Profile_Photo2", balance: 999000.0),
    User(userId: 2, name: "Maudy Abdila", imageProfile: "Profile_Photo3", balance: 999000.0)
]
