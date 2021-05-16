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
    
    init(id: Int, name: String, imageProfile: String) {
        self.id = id
        self.name = name
        self.imageProfile = imageProfile
    }
}

var users: [User] = [
    User(id: 0, name: "M. Kamil", imageProfile: "Default_Image"),
    User(id: 1, name: "Melia Suspariana", imageProfile: "Default_Image"),
    User(id: 2, name: "Maudy Abdila", imageProfile: "Default_Image")
]
