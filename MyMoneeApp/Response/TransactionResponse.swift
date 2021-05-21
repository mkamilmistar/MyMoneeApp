//
//  TransactionResponse.swift
//  MyMoneeApp
//
//  Created by MacBook on 20/05/21.
//

import Foundation

struct TransactionResponse: Codable {
    var transactionId: String?
    var title: String?
    var amount: Decimal?
    var type: String?
    var createdAt: Date?
    var updatedAt: Date?
    
    enum CodingKeys: String, CodingKey {
        case transactionId = "id"
        case title
        case amount
        case type
        case createdAt
        case updatedAt
    }
}

var transactions: [TransactionResponse] = []
var transaction = TransactionResponse()
