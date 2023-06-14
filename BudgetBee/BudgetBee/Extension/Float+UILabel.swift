//
//  Float.swift
//  BeutiServiceProvider
//
//  Created by Bassem Abbas on 5/11/20.
//  Copyright © 2020 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    func crossLine() {
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: self.text ?? "" )
        attributeString.addAttribute(
            NSAttributedString.Key.strikethroughStyle,
            value: 1,
            range: NSRange(location: 0, length: attributeString.length))
        self.attributedText = attributeString
    }
}
