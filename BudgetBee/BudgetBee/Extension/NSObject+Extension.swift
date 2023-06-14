//
//  NSObject+extension.swift
//  Beuti Service Provider
//
//  Created by omnia on 11/20/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation

extension NSObject {

    /// return Class Name
    public static var className: String {
        return String(describing: self)
    }
}
