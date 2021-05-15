//
//  AppConfig.swift
//  MyMoneeApp
//
//  Created by MacBook on 14/05/21.
//

import Foundation

func setDecimalToStringCurrency(amountValue: Decimal) -> String {
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

func anotherSetDecimalToStringCurrency(amountValue: Decimal) -> String {
    let formatter = NumberFormatter()

    formatter.groupingSeparator = "."
    formatter.numberStyle = NumberFormatter.Style.decimal

     if let formatterStr: String = formatter.string(from: NSDecimalNumber(decimal: amountValue))  {
      return formatterStr
    } else {
      return "0.0"
    }
}

func setDecimalToString(amountValue: Decimal) -> String {
    let formatter = NumberFormatter()

    formatter.groupingSeparator = "."
    formatter.numberStyle = .decimal

     if let formatterStr: String = formatter.string(from: NSDecimalNumber(decimal: amountValue))  {
      return formatterStr
    } else {
      return "0.0"
    }
}

func setStringToDecimal(amountValue: String) -> Decimal {
    if let formatterDecimal: Decimal = Decimal(string: amountValue) {
        return formatterDecimal
    } else {
        return 0.0
    }
}

func setDecimalToDouble(value: Decimal) -> Double {
    let formatterDouble = Double(truncating: value as NSNumber)
   
    return formatterDouble
}
