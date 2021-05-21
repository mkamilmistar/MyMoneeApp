//
//  UserResponse.swift
//  MyMoneeApp
//
//  Created by MacBook on 21/05/21.
//

import Foundation

struct UserResponse: Codable {
    var userId: String?
    var name: String?
    var profileImage: String?
    
    enum CodingKeys: String, CodingKey {
        case userId = "id"
        case name
        case profileImage
    }
}

var allUserData: [UserResponse] = []
var userDataById = UserResponse()
