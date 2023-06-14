//
//  StringExtension.swift
//  Beuti Service Provider
//
//  Created by omnia on 9/8/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//
// swiftlint:disable all

import Foundation
import UIKit

extension String {

    func replaceArabicDigitsWithEnglish() -> String? {

        let formatter = NumberFormatter()
        formatter.locale = NSLocale(localeIdentifier: "EN") as Locale
        guard let number = formatter.number(from: self) else {
            return nil
        }
        return number.stringValue
    }
    
    var isNumber: Bool {
            return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
        }
    
    func isStringContainsNumber() -> Bool {
        let str = self
        let decimalCharacters = CharacterSet.decimalDigits
        let decimalRange = str.rangeOfCharacter(from: decimalCharacters)
        if decimalRange != nil {
            print("Numbers found")
            return true
        } else {
            return false
        }
    }

    func isStringContainsLetter() -> Bool {

        let str = self
        let characterSet = CharacterSet.letters
        let letterRange = str.rangeOfCharacter(from: characterSet)
        if  letterRange != nil {
            print("letters found")
            return true
        } else {
            print("letters not found")
            return false
        }
    }

    func isValidDouble(maxDecimalPlaces: Int) -> Bool {
        // Use NumberFormatter to check if we can turn the string into a number
        // and to get the locale specific decimal separator.
        let formatter = NumberFormatter()
        formatter.allowsFloats = true // Default is true, be explicit anyways
        let decimalSeparator = formatter.decimalSeparator ?? "."  // Gets the locale specific decimal separator.
        //If for some reason there is none we assume "." is used as separator.

        // Check if we can create a valid number. (The formatter creates a NSNumber, but
        // every NSNumber is a valid double, so we're good!)
        if formatter.number(from: self) != nil {
            // Split our string at the decimal separator
            let split = self.components(separatedBy: decimalSeparator)

            // Depending on whether there was a decimalSeparator we may have one
            // or two parts now. If it is two then the second part is the one after
            // the separator, aka the digits we care about.
            // If there was no separator then the user hasn't entered a decimal
            // number yet and we treat the string as empty, succeeding the check
            let digits = split.count == 2 ? split.last ?? "" : ""

            let numberBeforeDot = split[0]

            // Finally check if we're <= the allowed digits
            return digits.count <= maxDecimalPlaces && numberBeforeDot.count <= 6
        }

        if self.isEmpty {
            return true
        }

        return false // couldn't turn string into a valid number
    }

    func timeConversion12() -> String {
        let dateAsString = self
        let dataFormatter = DateFormatter()
        let identifier = "en_US"
        dataFormatter.locale = Locale(identifier: identifier)
        dataFormatter.dateFormat = "HH:mm:ss"

        let date = dataFormatter.date(from: dateAsString) ?? Date()
        dataFormatter.dateFormat = "hh:mm a"

        let time12 = dataFormatter.string(from: date)
        return time12
    }

    func timeConversionFloat12() -> String {

        let dateAsString = self
        let dataFormatter = DateFormatter()
        dataFormatter.locale = Locale(identifier: "en_US")
        dataFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        dataFormatter.dateFormat = "HH:mm:ss.S"

        let date = dataFormatter.date(from: dateAsString) ?? Date()
        dataFormatter.dateFormat = "hh:mma"

        let time12 = dataFormatter.string(from: date)
        return time12
    }

    func timeConversionfrom12to24() -> String {
        let dateFormatter = DateFormatter()
        let dateAsString = self  // "1:15 PM"
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "h:mm a"
        
        let date = dateFormatter.date(from: dateAsString)
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "HH:mm:ss"
        
        let date24 = dateFormatter.string(from: date ?? Date())
        return date24
        
    }
    
    func is12hClockFormat() -> Bool {
        let formatString = DateFormatter.dateFormat(
            fromTemplate: "j",
            options: 0,
            locale: Locale.current
        )!
        return formatString.contains("a")
    }

    func stringDateWithFormatte(oldFormatte: String, newFormatte: String) -> String {
        
        let dateString = self //"2016-01-01 04:31:32.0"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = oldFormatte
        //TODO: force crash
        if let oldDate = dateFormatter.date(from: dateString){
            let identifier = "en_US"
            dateFormatter.locale = Locale(identifier: identifier)
            dateFormatter.dateFormat = newFormatte
            return dateFormatter.string(from: oldDate)
        } else {
            return ""
        }
    }
    
    func stringDateWithEnFormatte(oldFormatte: String, newFormatte: String) -> String {
        
        let dateString = self //"2016-01-01 04:31:32.0"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = oldFormatte
        //TODO: force crash
        if let oldDate = dateFormatter.date(from: dateString){
            let identifier = "en_US"
            dateFormatter.locale = Locale(identifier: identifier)
            dateFormatter.dateFormat = newFormatte
            return dateFormatter.string(from: oldDate)
        } else {
            return ""
        }
    }

    func stringToDate(format: String = "yyyy-MM-dd") -> Date? {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
            // dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
           dateFormatter.locale = Locale.current
        return dateFormatter.date(from: self)
    }
    
    var isBlank: Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    var isArabic: Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", "(?s).*\\p{Arabic}.*")
        return predicate.evaluate(with: self)
    }
    var isNameMoreThantwoCharacters: Bool {
        if self.count > 2 {
            return true
        } else {
            return false
        }
    }
    
    var isNameMoreThanOneCharacters: Bool {
        if self.count > 1 {
            return true
        } else {
            return false
        }
    }
    
    var isNameMoreThanMaxLimited30Characters: Bool {
        if self.count > 30 {
            return true
        } else {
            return false
        }
    }
    var isNameMoreThanMaxLimited50Characters: Bool {
        if self.count > 50 {
            return true
        } else {
            return false
        }
    }

    var isNameMoreThanMaxLimited150Characters: Bool {
        if self.count > 150 {
            return true
        } else {
            return false
        }
    }
}

extension Int {

    var toString: String {
        return String(describing: self)
    }
}

extension String {
    var isComplexPassword: Bool {
        //https://stackoverflow.com/questions/39284607/how-to-implement-a-regex-for-password-validation-in-swift
        let regex = "^(?=.*[a-z])(?=.*\\d)(?=.*[$@$!%*?&#])[A-Za-z\\d$@$!%*?&#]{8,20}"

        //           let regex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&#])[A-Za-z\\d$@$!%*?&#]{8,20}"

        return range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
}

//    func  replacedArabicDigitsWithEnglish () -> String? {
//        var str = self
//        let map = ["٠": "0",
//                   "١": "1",
//                   "٢": "2",
//                   "٣": "3",
//                   "٤": "4",
//                   "٥": "5",
//                   "٦": "6",
//                   "٧": "7",
//                   "٨": "8",
//                   "٩": "9"]
//        map.forEach { str = str.replacingOccurrences(of: $0, with: $1) }
//        return str
//    }

//    func isAlphabet(ignoreDiacritics: Bool = false) -> Bool {
//           if ignoreDiacritics {
//            //"[^a-zA-Z0-9]"
//            "[^a-zA-Z0-9]"
//               return self.range(of: "[^a-zA-Z]", options: .regularExpression) == nil && self != ""
//           }
//           else {
//               return self.isAlphanumeric()
//           }
//       }

extension Collection {
    //swiftlint:disable statement_position
    public var secand: Element? {
        let start = self.index(startIndex, offsetBy: 1)
        if start < endIndex { return self[start] }
        else { return nil }
    }

    public var third: Element? {
        let start = self.index(startIndex, offsetBy: 2)
        if start < endIndex { return self[start] }
        else { return nil }
    }
}

extension String {
    var isNotEmpty: Bool {
        return !isEmpty
    }
}

extension String {
    var nilIfEmpty: String? {
        return isEmpty ? nil : self
    }
    
    var isReallyEmpty: Bool {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty 
    }
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
    
        return ceil(boundingBox.height)
    }
}
