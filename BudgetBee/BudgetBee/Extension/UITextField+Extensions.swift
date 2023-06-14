//
//  UITextField+Extensions.swift
//  BeutiServiceProvider
//
//  Created by AbdulrhmanNoon on 1/19/21.
//  Copyright © 2021 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import UIKit

extension UITextField {
    var stringValue: String {
        return self.text ?? ""
    }
    
    var isReallyEmpty: Bool {
        return text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty ?? true
    }
    
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
