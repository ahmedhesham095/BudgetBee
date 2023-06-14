//
//  UIColor+app.swift
//  Beuti Service Provider
//
//  Created by omnia on 9/8/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import UIKit

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}
//swiftlint:disable identifier_name
extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
//swiftlint:enable identifier_name
extension UIColor {

    class var primaryColor: UIColor {
        guard let color = UIColor(named: "Primary Color") else {
            return UIColor()
        }
        return color
    }

    class var secandaryColor: UIColor {
        guard let color = UIColor(named: "Secandary Color") else {
            return UIColor()
        }
        return color
    }

    class var barShadowColor: UIColor {
        guard let color = UIColor(named: "BarShadow Color") else {
            return UIColor()
        }
        return color
    }

    class var subjectTextColor: UIColor {
        guard let color = UIColor(named: "Subject Color") else {
            return UIColor()
        }
        return color
    }

    class var tabBarShadowColor: UIColor {
        guard let color = UIColor(named: "TabBarShadow Color") else {
            return UIColor()
        }
        return color
    }

    class var loaderBackgroundColor: UIColor {
        guard let color = UIColor(named: "Loader Background Color") else {
            return UIColor()
        }
        return color
    }
}

// swiftlint:disable all
extension UIColor {

    class var lightRose: UIColor {
        return UIColor(red: 255.0 / 255.0, green: 229 / 255.0, blue: 229 / 255.0, alpha: 0.2)
    }

    class var mustard: UIColor {
        return UIColor(red: 255.0 / 255.0, green: 198.0 / 255.0, blue: 89.0 / 255.0, alpha: 1.0)
    }

    class var vermilion: UIColor {
        return UIColor(red: 242.0 / 255.0, green: 64.0 / 255.0, blue: 36.0 / 255.0, alpha: 1.0)
    }

    class var isabelline: UIColor {
        return UIColor(red: 238.0 / 255.0, green: 237.0 / 255.0, blue: 237.0 / 255.0, alpha: 1.0)
    }

    class var isabelline1: UIColor {
        return UIColor(red: 237.0 / 255.0, green: 237.0 / 255.0, blue: 237.0 / 255.0, alpha: 1.0)
    }

    class var pastelGray: UIColor {
        return UIColor(red: 203.0 / 255.0, green: 202.0 / 255.0, blue: 200.0 / 255.0, alpha: 1.0)
    }

    class var kuCrimson: UIColor {
        return UIColor(red: 237.0 / 255.0, green: 0.0 / 255.0, blue: 0.0 / 255.0, alpha: 1.0)
    }

    class var teaGreen: UIColor {
        return UIColor(red: 224.0 / 255.0, green: 255.0 / 255.0, blue: 196.0 / 255.0, alpha: 1.0)
    }

    class var fandango: UIColor {
        return UIColor(red: 155.0 / 255.0, green: 38.0 / 255.0, blue: 143.0 / 255.0, alpha: 1.0)
    }

    class var fandango1: UIColor {
        return UIColor(red: 155.0 / 255.0, green: 39.0 / 255.0, blue: 143.0 / 255.0, alpha: 1.0)
    }

    class var fandango2: UIColor {
        return UIColor(red: 159.0 / 255.0, green: 27.0 / 255.0, blue: 150.0 / 255.0, alpha: 1.0)
    }

    class var battleshipGrey: UIColor {
        return UIColor(red: 133.0 / 255.0, green: 130.0 / 255.0, blue: 126.0 / 255.0, alpha: 1.0)
    }

    class var uclaGold: UIColor {
        return UIColor(red: 237.0 / 255.0, green: 176.0 / 255.0, blue: 0.0 / 255.0, alpha: 1.0)
    }

    class var white: UIColor {
        return UIColor(red: 255.0 / 255.0, green: 255.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
    }

    class var white1: UIColor {
        return UIColor(red: 252.0 / 255.0, green: 252.0 / 255.0, blue: 254.0 / 255.0, alpha: 1.0)
    }

    class var darkGray: UIColor {
        return UIColor(red: 177.0 / 255.0, green: 175.0 / 255.0, blue: 172.0 / 255.0, alpha: 1.0)
    }

    class var darkGray1: UIColor {
        return UIColor(red: 168.0 / 255.0, green: 166.0 / 255.0, blue: 163.0 / 255.0, alpha: 1.0)
    }

    class var darkGray2: UIColor {
        return UIColor(red: 170.0 / 255.0, green: 173.0 / 255.0, blue: 186.0 / 255.0, alpha: 1.0)
    }

    class var darkJungleGreen: UIColor {
        return UIColor(red: 29.0 / 255.0, green: 29.0 / 255.0, blue: 29.0 / 255.0, alpha: 1.0)
    }

    class var darkJungleGreen1: UIColor {
        return UIColor(red: 26.0 / 255.0, green: 26.0 / 255.0, blue: 29.0 / 255.0, alpha: 1.0)
    }

    class var coolGrey: UIColor {
        return UIColor(red: 141.0 / 255.0, green: 146.0 / 255.0, blue: 163.0 / 255.0, alpha: 1.0)
    }

    class var whiteSmoke: UIColor {
        return UIColor(red: 246.0 / 255.0, green: 246.0 / 255.0, blue: 246.0 / 255.0, alpha: 1.0)
    }

    class var liver: UIColor {
        return UIColor(red: 81.0 / 255.0, green: 77.0 / 255.0, blue: 71.0 / 255.0, alpha: 1.0)
    }

    class var snow: UIColor {
        return UIColor(red: 250.0 / 255.0, green: 250.0 / 255.0, blue: 250.0 / 255.0, alpha: 1.0)
    }

    class var snow1: UIColor {
        return UIColor(red: 249.0 / 255.0, green: 249.0 / 255.0, blue: 249.0 / 255.0, alpha: 1.0)
    }

    class var kellyGreen: UIColor {
        return UIColor(red: 74.0 / 255.0, green: 157.0 / 255.0, blue: 0.0 / 255.0, alpha: 1.0)
    }

    class var gainsboro: UIColor {
        return UIColor(red: 220.0 / 255.0, green: 219.0 / 255.0, blue: 218.0 / 255.0, alpha: 1.0)
    }

    class var deepCarminePink: UIColor {
        return UIColor(red: 255.0 / 255.0, green: 42.0 / 255.0, blue: 48.0 / 255.0, alpha: 1.0)
    }

    class var uscGold: UIColor {
        return UIColor(red: 255.0 / 255.0, green: 204.0 / 255.0, blue: 1.0 / 255.0, alpha: 1.0)
    }

    class var munsell: UIColor {
        return UIColor(red: 239.0 / 255.0, green: 237.0 / 255.0, blue: 249.0 / 255.0, alpha: 1.0)
    }

    class var munsell1: UIColor {
        return UIColor(red: 243.0 / 255.0, green: 243.0 / 255.0, blue: 243.0 / 255.0, alpha: 1.0)
    }

    class var lavenderGray: UIColor {
        return UIColor(red: 199.0 / 255.0, green: 199.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0)
    }

    class var manatee: UIColor {
        return UIColor(red: 159.0 / 255.0, green: 157.0 / 255.0, blue: 154.0 / 255.0, alpha: 1.0)
    }

    class var aurometalsaurus: UIColor {
        return UIColor(red: 118.0 / 255.0, green: 118.0 / 255.0, blue: 128.0 / 255.0, alpha: 1.0)
    }

    class var rifleGreen: UIColor {
        return UIColor(red: 72.0 / 255.0, green: 68.0 / 255.0, blue: 62.0 / 255.0, alpha: 1.0)
    }

    class var mediumSpringBud: UIColor {
        return UIColor(red: 185.0 / 255.0, green: 221.0 / 255.0, blue: 139.0 / 255.0, alpha: 1.0)
    }

    class var black: UIColor {
        return UIColor(red: 0.0 / 255.0, green: 0.0 / 255.0, blue: 0.0 / 255.0, alpha: 1.0)
    }

    class var ivory: UIColor {
        return UIColor(red: 249.0 / 255.0, green: 255.0 / 255.0, blue: 243.0 / 255.0, alpha: 1.0)
    }

    class var wenge: UIColor {
        return UIColor(red: 98.0 / 255.0, green: 95.0 / 255.0, blue: 90.0 / 255.0, alpha: 1.0)
    }

    class var silver: UIColor {
        return UIColor(red: 194.0 / 255.0, green: 193.0 / 255.0, blue: 191.0 / 255.0, alpha: 1.0)
    }

    class var taupeGray: UIColor {
        return UIColor(red: 150.0 / 255.0, green: 148.0 / 255.0, blue: 145.0 / 255.0, alpha: 1.0)
    }

    class var taupeGray1: UIColor {
        return UIColor(red: 142.0 / 255.0, green: 139.0 / 255.0, blue: 136.0 / 255.0, alpha: 1.0)
    }

    class var taupeGray2: UIColor {
        return UIColor(red: 142.0 / 255.0, green: 142.0 / 255.0, blue: 147.0 / 255.0, alpha: 1.0)
    }

    class var slateBlue: UIColor {
        return UIColor(red: 114.0 / 255.0, green: 101.0 / 255.0, blue: 210.0 / 255.0, alpha: 1.0)
    }

    class var glitter: UIColor {
        return UIColor(red: 223.0 / 255.0, green: 236.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
    }

    class var mediumTealBlue: UIColor {
        return UIColor(red: 0.0 / 255.0, green: 85.0 / 255.0, blue: 202.0 / 255.0, alpha: 1.0)
    }

    class var trolleyGrey: UIColor {
        return UIColor(red: 124.0 / 255.0, green: 121.0 / 255.0, blue: 117.0 / 255.0, alpha: 1.0)
    }

    class var davyGrey: UIColor {
        return UIColor(red: 89.0 / 255.0, green: 86.0 / 255.0, blue: 80.0 / 255.0, alpha: 1.0)
    }

    class var davyGrey1: UIColor {
        return UIColor(red: 80.0 / 255.0, green: 85.0 / 255.0, blue: 92.0 / 255.0, alpha: 1.0)
    }

    class var davyGrey2: UIColor {
        return UIColor(red: 92.0 / 255.0, green: 92.0 / 255.0, blue: 92.0 / 255.0, alpha: 1.0)
    }

    class var canary: UIColor {
        return UIColor(red: 255.0 / 255.0, green: 246.0 / 255.0, blue: 164.0 / 255.0, alpha: 1.0)
    }

    class var coralPink: UIColor {
        return UIColor(red: 255.0 / 255.0, green: 132.0 / 255.0, blue: 132.0 / 255.0, alpha: 1.0)
    }

    class var blond: UIColor {
        return UIColor(red: 255.0 / 255.0, green: 242.0 / 255.0, blue: 196.0 / 255.0, alpha: 1.0)
    }

    class var timberwolf: UIColor {
        return UIColor(red: 216.0 / 255.0, green: 216.0 / 255.0, blue: 216.0 / 255.0, alpha: 1.0)
    }

    class var platinum: UIColor {
        return UIColor(red: 229.0 / 255.0, green: 228.0 / 255.0, blue: 227.0 / 255.0, alpha: 1.0)
    }

    class var platinum1: UIColor {
        return UIColor(red: 228.0 / 255.0, green: 228.0 / 255.0, blue: 228.0 / 255.0, alpha: 1.0)
    }

    class var lightGray: UIColor {
        return UIColor(red: 211.0 / 255.0, green: 210.0 / 255.0, blue: 209.0 / 255.0, alpha: 1.0)
    }

    class var lightGray1: UIColor {
        return UIColor(red: 209.0 / 255.0, green: 213.0 / 255.0, blue: 219.0 / 255.0, alpha: 1.0)
    }

    class var ashGrey: UIColor {
        return UIColor(red: 185.0 / 255.0, green: 184.0 / 255.0, blue: 181.0 / 255.0, alpha: 1.0)
    }

    class var ashGrey1: UIColor {
        return UIColor(red: 172.0 / 255.0, green: 180.0 / 255.0, blue: 190.0 / 255.0, alpha: 1.0)
    }

    class var ashGrey2: UIColor {
        return UIColor(red: 182.0 / 255.0, green: 182.0 / 255.0, blue: 182.0 / 255.0, alpha: 1.0)
    }

    class var lightPastelPurple: UIColor {
        return UIColor(red: 155.0 / 255.0, green: 145.0 / 255.0, blue: 233.0 / 255.0, alpha: 1.0)
    }

    class var mistyRose: UIColor {
        return UIColor(red: 255.0 / 255.0, green: 229.0 / 255.0, blue: 229.0 / 255.0, alpha: 1.0)
    }

    class var dimGray: UIColor {
        return UIColor(red: 116.0 / 255.0, green: 113.0 / 255.0, blue: 108.0 / 255.0, alpha: 1.0)
    }

    class var dimGray1: UIColor {
        return UIColor(red: 107.0 / 255.0, green: 104.0 / 255.0, blue: 99.0 / 255.0, alpha: 1.0)
    }

    class var yellowGreen: UIColor {
        return UIColor(red: 146.0 / 255.0, green: 212.0 / 255.0, blue: 59.0 / 255.0, alpha: 1.0)
    }

    class var princetonOrange: UIColor {
        return #colorLiteral(red: 255.0 / 255.0, green: 149.0 / 255.0, blue: 0.0 / 255.0, alpha: 1.0)
    }

    class var auroMetalSaurus: UIColor {
        return #colorLiteral(red: 118.0 / 255.0, green: 118.0 / 255.0, blue: 128.0 / 255.0, alpha: 1.0)
    }
    
    class var lavenderMist: UIColor {
        return UIColor(red: 228 / 255.0, green: 230 / 255.0, blue: 239 / 255.0, alpha: 1.0)
    }
}
