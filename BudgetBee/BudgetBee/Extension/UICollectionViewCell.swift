//
//  UICollectionViewCell.swift
//  Channels
//
//  Created by EsraaGK on 4/14/20.
//  Copyright © 2020 EsraaGK. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
    static var identifire: String { return String(describing: self) }
    static var nib: UINib { return UINib(nibName: self.identifire, bundle: nil) }
}
