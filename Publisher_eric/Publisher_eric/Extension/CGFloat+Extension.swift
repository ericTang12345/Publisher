//
//  CGFloat+Extension.swift
//  Publisher_eric
//
//  Created by 唐紹桓 on 2020/11/20.
//

import UIKit

extension CGFloat {
    
    static func random() -> CGFloat {
        
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
    
}
