//
//  Customer.swift
//  MyMoneeApp
//
//  Created by MacBook on 15/05/21.
//

import Foundation
class User {
    var id: Int
    var name: String
    var imageProfile: String
    var balance: Decimal
    
    init(id: Int, name: String, imageProfile: String, balance: Decimal) {
        self.id = id
        self.name = name
        self.imageProfile = imageProfile
        self.balance = balance
    }
}

var users: [User] = [
    User(id: 0, name: "M. Kamil", imageProfile: "Default_Image", balance: 5000000.0),
    User(id: 1, name: "Melia Suspariana", imageProfile: "Default_Image", balance: 5000000.0),
    User(id: 2, name: "Maudy Abdila", imageProfile: "Default_Image", balance: 5000000.0)
]
