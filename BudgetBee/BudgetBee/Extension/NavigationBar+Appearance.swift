//
//  NavigationBar+Appearance.swift
//  BeutiServiceProvider
//
//  Created by Bassem Abbas on 4/26/20.
//  Copyright © 2020 Ibtikar Technologies, Co. Ltd. All rights reserved.
//
// swiftlint:disable all

import UIKit

extension UINavigationBar {

    func clearNavigationBar(backgroundColor: UIColor?) {
        self.setBackgroundImage(UIImage(), for: .default)
        self.shadowImage = UIImage()
        self.barTintColor = backgroundColor
        self.isTranslucent = false
    }

    func addBarShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.barShadowColor.cgColor
        self.layer.shadowOpacity = 1.0
        self.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        self.layer.shadowRadius = 8
    }

    func removeBarShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.clear.cgColor
        self.layer.shadowOpacity = 0
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 0
    }
}
extension UIApplicationDelegate {

    func changeBackBarButtonImage() {

        guard var backButtonBackgroundImage = UIImage(named: "ic_back_arrow") else { return }

        // The background should be pinned to the left and not stretch.
        backButtonBackgroundImage = backButtonBackgroundImage
            .resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: -1, bottom: 0, right: 0))
        let barAppearance = UINavigationBar.appearance(whenContainedInInstancesOf: [UINavigationController.self])
        //        var barAppearance = UINavigationBar.appearance(whenContainedInInstancesOf:[AppNavigationController.self])

        barAppearance.backIndicatorImage = backButtonBackgroundImage
        barAppearance.backIndicatorTransitionMaskImage = backButtonBackgroundImage
    }
}

extension CAShapeLayer {
    func drawCircleAtLocation(location: CGPoint, withRadius radius: CGFloat, andColor color: UIColor, filled: Bool) {
        fillColor = filled ? color.cgColor : UIColor.white.cgColor
        strokeColor = color.cgColor
        let origin = CGPoint(x: location.x - radius, y: location.y - radius)
        path = UIBezierPath(ovalIn: CGRect(origin: origin, size: CGSize(width: radius * 2, height: radius * 2))).cgPath
    }
}

extension UINavigationItem {
    func removeBackBarButtonTitle() {
        // Provide an empty backBarButton to hide the 'Back' text present by
        // default in the back button.
        //
        // NOTE: You do not need to provide a target or action.  These are set
        //       by the navigation bar.
        // NOTE: Setting the title of this bar button item to ' ' (space) works
        //       around a bug in iOS 7.0.x where the background image would be
        //       horizontally compressed if the back button title is empty.

        let backBarButton: UIBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        self.backBarButtonItem = backBarButton

    }

}
