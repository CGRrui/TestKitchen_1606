//
//  UILabel+Util.swift
//  TestKitchen
//
//  Created by Rui on 16/8/15.
//  Copyright © 2016年 Rui. All rights reserved.
//

import UIKit

//类别:labeld的方法封装
extension UILabel {
    
    //因为使用自动布局的方式,所以不用传frame
    class func createLabel(text: String?,font: UIFont?, textAlignment: NSTextAlignment?, textColor: UIColor?) -> UILabel {
        
        let label = UILabel()
        if let labelText = text {
            label.text = labelText
        }
        
        if let labelFont = font {
            label.font = labelFont
        }
        
        if let labelAlign = textAlignment {
            label.textAlignment = labelAlign
        }
        
        if let labelTextColor = textColor {
            label.textColor = labelTextColor
        }
        
        return label
        
    }
    
}


