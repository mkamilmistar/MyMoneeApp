//
//  AppConfig.swift
//  MyMoneeApp
//
//  Created by MacBook on 14/05/21.
//

import Foundation

//============================================ TYPE CONVERT

extension String {
    static func setDecimalToStringCurrencyWithIDR(amountValue: Decimal) -> String {
        let formatter = NumberFormatter()
        formatter.currencyCode = "IDR"
        formatter.groupingSeparator = "."
        formatter.numberStyle = NumberFormatter.Style.currencyISOCode

         if let formatterStr: String = formatter.string(from: NSDecimalNumber(decimal: amountValue))  {
          return formatterStr
        } else {
          return "0.0"
        }
    }
    
    static func setDecimalToStringCurrency(amountValue: Decimal) -> String {
        let formatter = NumberFormatter()

        formatter.groupingSeparator = "."
        formatter.numberStyle = NumberFormatter.Style.decimal

         if let formatterStr: String = formatter.string(from: NSDecimalNumber(decimal: amountValue))  {
          return formatterStr
        } else {
          return "0.0"
        }
    }
    
    static func setDecimalToString(amountValue: Decimal) -> String {
        let formatter = NumberFormatter()

        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal

         if let formatterStr: String = formatter.string(from: NSDecimalNumber(decimal: amountValue))  {
          return formatterStr
        } else {
          return "0.0"
        }
    }
}

extension Decimal {
    static func setStringToDecimal(amountValue: String) -> Decimal {
        if let formatterDecimal: Decimal = Decimal(string: amountValue) {
            return formatterDecimal
        } else {
            return 0.0
        }
    }
}

extension Double {
    static func setDecimalToDouble(value: Decimal) -> Double {
        let formatterDouble = Double(truncating: value as NSNumber)
       
        return formatterDouble
    }
}

//============================================ END OF TYPE CONVERT



//============================================ DATE CONVERT
extension Date {
    static func getDateByString(date:String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.timeZone = TimeZone(abbreviation: "WIB")
        formatter.locale = NSLocale(localeIdentifier: "id") as Locale
        return formatter.date(from: date)!
    }

    static func setDateToString(_ date: Date) -> String {
        let outputFormat = DateFormatter()
        outputFormat.locale = NSLocale(localeIdentifier:"id") as Locale
        outputFormat.timeZone = TimeZone(abbreviation: "WIT")
        outputFormat.dateFormat = "dd MMMM yyyy' - 'HH:mm"
        return outputFormat.string(from: date as Date)
    }
}


//============================================ END OF DATE CONVERT

extension String {
    static func randomCapitalizeWithNumber(length: Int = 6) -> String {
        let base = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString: String = ""

        for _ in 0..<length {
            let randomValue = arc4random_uniform(UInt32(base.count))
            randomString += "\(base[base.index(base.startIndex, offsetBy: Int(randomValue))])"
        }
        return "MM-\(randomString)"
    }
}

extension Date {
    var hour: Int { return Calendar.current.component(.hour, from: self) }
}
