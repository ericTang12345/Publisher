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
}
