//
//  String+Extension.swift
//  BeutiServiceProvider
//
//  Created by ABDO on 22/12/2021.
//  Copyright © 2021 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import UIKit

extension String {
     // vrify Valid PhoneNumber or Not
    func isValidPhone() -> Bool {
        var value = self
        if value.starts(with: "0") || value.starts(with: "٠") {
            value = "0" + (value.replaceArabicDigitsWithEnglish() ?? "")
        }
        let phoneRegex = "05[0-9]{8}"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        let result = phoneTest.evaluate(with: value)
        return result
     }
    
    func isValidName() -> Bool {
        if count >= 2 && count <= 30 {
            return true
        }
        return false
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
 }

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
