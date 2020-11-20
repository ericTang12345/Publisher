//
//  UIColor+Extension.swift
//  Publisher_eric
//
//  Created by 唐紹桓 on 2020/11/20.
//

import UIKit

extension UIColor {
    
    static func random() -> UIColor {
        
        return UIColor(
            red: .random(),
            green: .random(),
            blue: .random(),
            alpha: 1.0
        )
    }
    
    static func colorToString(color: UIColor) -> String {
            let colorString = "\(color)"
            let colorArray: [String] = colorString.components(separatedBy: " ")

            if colorArray.count > 1 {
                var r: CGFloat = CGFloat((Float(colorArray[1]) ?? 1))
                var g: CGFloat = CGFloat((Float(colorArray[2]) ?? 1))
                var b: CGFloat = CGFloat((Float(colorArray[3]) ?? 1))
//                let alpha: CGFloat = CGFloat((Float(colorArray[4]) ?? 1))

                if (r < 0.0) {r = 0.0}
                if (g < 0.0) {g = 0.0}
                if (b < 0.0) {b = 0.0}

                if (r > 1.0) {r = 1.0}
                if (g > 1.0) {g = 1.0}
                if (b > 1.0) {b = 1.0}

                // Update hex
                let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
                return String(format: "#%06X", rgb)
            } else {
                return ""
            }
        }
    
    convenience init?(hexaRGB: String, alpha: CGFloat = 1) {
        var chars = Array(hexaRGB.hasPrefix("#") ? hexaRGB.dropFirst() : hexaRGB[...])
        switch chars.count {
        case 3: chars = chars.flatMap { [$0, $0] }
        case 6: break
        default: return nil
        }
        self.init(red: .init(strtoul(String(chars[0...1]), nil, 16)) / 255,
                  green: .init(strtoul(String(chars[2...3]), nil, 16)) / 255,
                  blue: .init(strtoul(String(chars[4...5]), nil, 16)) / 255,
                  alpha: alpha)
    }
}
