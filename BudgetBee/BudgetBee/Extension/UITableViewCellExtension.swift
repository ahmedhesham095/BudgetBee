//
//  UITableViewCellExtension.swift
//  BeutiServiceProvider
//
//  Created by EsraaGK on 4/29/20.
//  Copyright © 2020 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import UIKit

extension UITableViewCell {
    static var identifire: String { return String(describing: self) }
    static var nib: UINib { return UINib(nibName: self.identifire, bundle: nil) }
}
