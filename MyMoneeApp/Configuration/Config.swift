//
//  Auth.swift
//  MyMoneeApp
//
//  Created by MacBook on 15/05/21.
//

import UIKit

struct AuthUser {
    static var data: User = users[1]
}

func getDateByString(date:String)->Date{
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    formatter.timeZone = TimeZone(abbreviation: "WIT")
    formatter.locale = NSLocale(localeIdentifier: "id") as Locale
    return formatter.date(from: date)!
}

func setDateToString(_ date: Date) -> String {
    let outputFormat = DateFormatter()
    outputFormat.locale = NSLocale(localeIdentifier:"id") as Locale
    outputFormat.timeZone = TimeZone(abbreviation: "WIT")
    outputFormat.dateFormat = "dd MMMM yyyy' - 'HH:mm:ss"
    return outputFormat.string(from: date as Date)
    
}
