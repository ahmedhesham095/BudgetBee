//
//  CALayer.swift
//  BeutiServiceProvider
//
//  Created by Bassem Abbas on 4/26/20.
//  Copyright © 2020 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import UIKit

extension CALayer {

    func dropShadow() {
        masksToBounds = false
        shadowOffset = CGSize(width: 0, height: 1)
        shadowRadius = 4
        shadowColor = UIColor.black.cgColor
        shadowOpacity = 0.1
    }

    func setCornerRadius(radius: CGFloat, maskToBounds: Bool = true) {
        self.cornerRadius = radius
        self.masksToBounds = maskToBounds
    }

    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius,
                                                    height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.mask = mask
    }

    func setShadow(opacity: Float, radius: CGFloat, shadowColor: CGColor) {
        self.shadowColor = shadowColor
        self.shadowOpacity = opacity
        self.shadowOffset = CGSize.zero
        self.shadowRadius = radius
        self.masksToBounds = false
    }

    func setBorder(borderColor: CGColor, width: CGFloat ) {
        self.borderColor = borderColor
        self.borderWidth = width
    }

}
