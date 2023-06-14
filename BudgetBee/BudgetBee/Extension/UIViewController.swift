//
//  UIViewController.swift
//  BeutiServiceProvider
//
//  Created by Bassem Abbas on 4/26/20.
//  Copyright © 2020 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import UIKit
import SwiftMessages
extension UIViewController {

    public func isViewLoadedAndShowing() -> Bool { return isViewLoaded && view.window != nil }

    func push( viewController: UIViewController, completion: (() -> Void)? = nil) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        navigationController?.pushViewController(viewController, animated: true)
        CATransaction.commit()
    }

    func presentBottomSheet(destinationVC: UIViewController, backgroundColor: UIColor? = nil) {

        let segue = SwiftMessagesSegue(identifier: nil, source: self, destination: destinationVC)
        segue.messageView.bounceAnimationOffset = 0
        segue.containment = .content
        if let bkGColor = backgroundColor {
            segue.dimMode = .color(color: bkGColor, interactive: true)
        } else {
            segue.dimMode = .color(color: UIColor.black.withAlphaComponent(0.7), interactive: true)
        }
        segue.containerView.cornerRadius = 0
        segue.containerView.roundsLeadingCorners = false
        segue.messageView.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 30, right: 20)
        segue.messageView.collapseLayoutMarginAdditions = true
        let animation = TopBottomAnimation(style: .bottom)

        animation.springDamping = 1
        segue.presentationStyle = .custom(animator: animation)
        segue.perform()

    }

    func presentCenteredSheet(destinationVC: UIViewController) { //da el sheet
        let segue = SwiftMessagesSegue(identifier: nil, source: self, destination: destinationVC)
        segue.messageView.bounceAnimationOffset = 0
        segue.configure(layout: .centered)
        segue.containment = .background
        segue.containerView.cornerRadius = 3
        segue.dimMode = .color(color: UIColor.black.withAlphaComponent(0.7), interactive: true)
        // segue.containerView.cornerRadius = 0
        segue.containerView.roundsLeadingCorners = false
        segue.messageView.layoutMarginAdditions = UIEdgeInsets(
            top: 0,
            left: 43,
            bottom: UIScreen.main.bounds.height / 3,
            right: 42)
        segue.messageView.collapseLayoutMarginAdditions = true
        let animation = TopBottomAnimation(style: .bottom)
        animation.springDamping = 1
        segue.presentationStyle = .custom(animator: animation)
        segue.perform()

    }
    
    func presentCutomAlert(destinationVC: UIViewController) {
        let segue = SwiftMessagesSegue(identifier: nil, source: self, destination: destinationVC)
        segue.messageView.bounceAnimationOffset = 0
        segue.containment = .content
        segue.dimMode = .color(color: UIColor.black.withAlphaComponent(0.7), interactive: false)
        segue.containerView.cornerRadius = 0
        segue.containerView.roundsLeadingCorners = false
        segue.messageView.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 30, right: 20)
        segue.messageView.collapseLayoutMarginAdditions = true
        segue.presentationStyle = .center
        segue.perform()
    }
}

extension UIViewController {
    func add(_ child: UIViewController, toView: UIView) {
        addChild(child)
        toView.addSubview(child.view)
        child.view.fillToSuperview()
        child.didMove(toParent: self)
    }

    func remove() {
        // Just to be safe, we check that this view controller
        // is actually added to a parent before removing it.
        guard parent != nil else {
            return
        }

        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}

extension UIViewController {
    func setUpNavigationStyle() {
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        ]
        let shadowView = UIView(frame: self.navigationController!.navigationBar.frame)
        shadowView.backgroundColor = UIColor.white
        shadowView.layer.masksToBounds = false
        shadowView.layer.shadowOpacity = 0.2
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 1)
        shadowView.layer.shadowRadius =  1
        self.view.addSubview(shadowView)
    }
}
