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
    formatter.dateFormat = "dd-MM-yyyy"
    return formatter.date(from: date)!
}

func setDateToString(_ date: NSDate) -> String {
    let date = NSDate()
    let outputFormat = DateFormatter()
    outputFormat.locale = NSLocale(localeIdentifier:"id") as Locale
    outputFormat.dateFormat = "dd MMMM yyyy' - 'HH:mm"
    let final = outputFormat.string(from: date as Date)
    
    return final
}
