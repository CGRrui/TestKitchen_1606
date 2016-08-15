//
//  UIButton+Util.swift
//  TestKitchen
//
//  Created by Rui on 16/8/15.
//  Copyright © 2016年 Rui. All rights reserved.
//

import UIKit

//按钮的封装
extension UIButton {
    
    class func createBtn(title: String?,bgImageName: String?,selectBgImageName: String?,target:AnyObject?,action:Selector) -> UIButton {
        
        let btn = UIButton(type: .Custom)
        if let btnTitle = title {
            btn.setTitle(btnTitle, forState: .Normal)
            btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        }
        
        if let btnBgImageName = bgImageName {
            btn.setBackgroundImage(UIImage(named: btnBgImageName), forState: .Normal)
        }
        
        if let btnSelectBgImageName = selectBgImageName {
            
            btn.setBackgroundImage(UIImage(named: btnSelectBgImageName), forState: .Selected)
            
        }
        
        if let btnTarget = target {
            
            btn.addTarget(btnTarget, action: action, forControlEvents: .TouchUpInside)
            
        }
        return btn
        
    }
    
    
}








