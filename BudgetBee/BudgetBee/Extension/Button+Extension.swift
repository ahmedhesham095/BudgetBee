//
//  Button+Extension.swift
//  BeutiServiceProvider
//
//  Created by Mai Abd Elmonem on 6/14/20.
//  Copyright © 2020 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import UIKit

extension UIButton {
  func activeButton() {
    self.backgroundColor = .primaryColor
    self.setTitleColor(.white, for: .normal)
    self.isUserInteractionEnabled = true
  }
  
  func inActiveButton() {
    self.backgroundColor = .whiteSmoke
    self.setTitleColor(.coolGrey, for: .normal)
    self.isUserInteractionEnabled = false
  }
}
