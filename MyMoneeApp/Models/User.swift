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

    init(id: Int, name: String, imageProfile: String, balance: Decimal) {
        self.userId = id
        self.name = name
        self.imageProfile = imageProfile
        self.balance = balance
    }
}

var users: [User] = [
    User(id: 0, name: "M. Kamil", imageProfile: "Profile_Photo", balance: 2500000.0),
    User(id: 1, name: "Melia Suspariana", imageProfile: "Profile_Photo2", balance: 999000.0),
    User(id: 2, name: "Maudy Abdila", imageProfile: "Profile_Photo3", balance: 999000.0)
]
//
//class UDM {
//
//    static let shared = UDM()
//    let defaults = UserDefaults(suiteName: "com.myMonee.data")
//}
