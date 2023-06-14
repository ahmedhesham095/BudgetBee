//
//  DoubleExtension.swift
//  BeutiServiceProvider
//
//  Created by Passant Abdelatif on 18/08/2022.
//  Copyright © 2022 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import UIKit
extension Double {
    func convert( maxDecimals max: Int) -> Double {
        let stringArr = String(self).split(separator: ".")
        let decimals = Array(stringArr[1])
        var string = "\(stringArr[0])."

        var count = 0;
        for n in decimals {
            if count == max { break }
            string += "\(n)"
            count += 1
        }


        let double = Double(string)!
        return double
    }
}
