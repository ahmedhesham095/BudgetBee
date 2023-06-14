//
//  DesignableLabel.swift
//  BeutiServiceProvider
//
//  Created by Ahmed Hesham on 07/06/2022.
//  Copyright © 2022 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class DesignableLabel: UILabel {
    @IBInspectable var lineHeight: CGFloat = 20 {
        didSet {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.minimumLineHeight = lineHeight
            paragraphStyle.maximumLineHeight = lineHeight
            paragraphStyle.alignment = self.textAlignment

            let attrString = NSMutableAttributedString(string: text!)
            attrString.addAttribute(NSAttributedString.Key.font, value: font, range: NSRange(location: 0, length: attrString.length))
            attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attrString.length))
            attributedText = attrString
        }
    }
}
