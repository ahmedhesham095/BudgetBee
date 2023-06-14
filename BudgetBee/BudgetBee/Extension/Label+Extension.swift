//
//  Label+Extension.swift
//  BeutiServiceProvider
//
//  Created by Mai Abd Elmonem on 6/14/20.
//  Copyright © 2020 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import UIKit

extension UILabel {
  func setHeaderAttributes(headerTitle: String) {
    self.text = headerTitle
    self.font = UIFont.boldSystemFont(ofSize: 18)
    self.textColor = .black
  }
}
