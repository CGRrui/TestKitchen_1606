//
//  CBHeaderView.swift
//  TestKitchen
//
//  Created by Rui on 16/8/19.
//  Copyright © 2016年 Rui. All rights reserved.
//

import UIKit

//灰色的背景视图和今日新品的显示(今日新品根据json传过来的数据会改变的)
class CBHeaderView: UIView {

    //标题
    private var titleLabel: UILabel?
    
    //图片
    private var imageView: UIImageView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //背景视图
        let bgView = UIView.createView()
        bgView.frame = CGRectMake(0, 10, bounds.size.width, bounds.size.height-10)
        bgView.backgroundColor = UIColor.whiteColor()
        addSubview(bgView)
        
        let titleW: CGFloat = 160
        let imageW: CGFloat = 24
        
        let x = (bounds.size.width-titleW-imageW)/2
        
        //标题文字
        titleLabel = UILabel.createLabel(nil, font: UIFont.systemFontOfSize(18), textAlignment: .Center, textColor: UIColor.blackColor())
        titleLabel?.frame = CGRectMake(x, 10, titleW, bounds.size.height-10)
        addSubview(titleLabel!)
        
        //右边的图片
        imageView = UIImageView.createImageView("more_icon")
        imageView?.frame = CGRectMake(x+titleW, 14, imageW, imageW)
        addSubview(imageView!)
        
        //灰色
        backgroundColor = UIColor(white: 0.8, alpha: 1.0)
        
    }
    
    //显示标题(会变化)
    func configTitle(title: String) {
        
        titleLabel?.text = title
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
































































