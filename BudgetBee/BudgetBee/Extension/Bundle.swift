//
//  Bundle.swift
//  BeutiServiceProvider
//
//  Created by Bassem Abbas on 4/26/20.
//  Copyright © 2020 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation
import UIKit

extension Bundle {

    static func loadView<T: UIView>(withType type: T.Type) -> T {
        let nibName = String(describing: T.self)
        if let view = Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)?.first as? T {
            return view
        }

        fatalError("Could not load view with type " + String(describing: type))
    }
}
