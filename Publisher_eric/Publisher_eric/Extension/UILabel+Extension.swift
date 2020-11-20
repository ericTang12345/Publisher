//
//  UILabel+Extension.swift
//  Publisher_eric
//
//  Created by 唐紹桓 on 2020/11/20.
//

import UIKit

class LabelPadding: UILabel {
    
    let padding = UIEdgeInsets(top: 2, left: 8, bottom: 2, right: 8)
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }
    
    override var intrinsicContentSize : CGSize {
            let superContentSize = super.intrinsicContentSize
            let width = superContentSize.width + padding.left + padding.right
            let heigth = superContentSize.height + padding.top + padding.bottom
            return CGSize(width: width, height: heigth)
        }

}
