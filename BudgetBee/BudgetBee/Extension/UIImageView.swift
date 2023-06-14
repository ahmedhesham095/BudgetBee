//
//  UIImageView.swift
//  BeutiServiceProvider
//
//  Created by Bassem Abbas on 4/26/20.
//  Copyright © 2020 Ibtikar Technologies, Co. Ltd. All rights reserved.
//
// swiftlint:disable all
import UIKit

extension UIImageView {
    
    @IBInspectable var flipedImage: UIImage? {
        set {
            guard let rawImage = newValue else { return }
            self.image = rawImage.flip()
        }
        get {
            self.image
        }
    }

    func flipImage() {
        let image = self.image
        let flipedImage = image?.imageFlippedForRightToLeftLayoutDirection()
        self.image = flipedImage
    }

    func setImageWith(urlString: String?) {
        let imagePlaceholder = UIImage(named: "")
        self.image = imagePlaceholder
        guard let imageurl = urlString ,
            let url = URL(string: imageurl)
            else { return }
        self.kf.setImage(with: url, placeholder: imagePlaceholder )
    }
}

extension UIImage {
    func flip() -> UIImage {
        return self.imageFlippedForRightToLeftLayoutDirection()
    }
}
