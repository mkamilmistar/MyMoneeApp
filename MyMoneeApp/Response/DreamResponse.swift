//
//  DreamResponse.swift
//  MyMoneeApp
//
//  Created by MacBook on 20/05/21.
//

import Foundation

struct DreamResponse: Codable {
    var dreamId: String
    var title: String
    var targetAmount: Decimal
    var userId: String
    
    enum CodingKeys: String, CodingKey {
        case dreamId = "id"
        case title = "title"
        case targetAmount = "target_amount"
        case userId = "user_id"
    }
}

var dreamResponse: [DreamResponse] = []
