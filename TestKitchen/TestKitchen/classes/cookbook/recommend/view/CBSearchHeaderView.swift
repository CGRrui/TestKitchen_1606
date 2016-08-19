//
//  CBSearchHeaderView.swift
//  TestKitchen
//
//  Created by Rui on 16/8/18.
//  Copyright © 2016年 Rui. All rights reserved.
//

//食材界面 -> 推荐 -> 搜索界面
import UIKit

class CBSearchHeaderView: UIView {

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        
        //搜索框
        /*
        let searchBar = UISearchBar(frame: CGRectMake(40,0,bounds.size.width-2*40,bounds.size.height))
        
        searchBar.placeholder = "输入菜名或食材搜索"
        searchBar.alpha = 0.5
        addSubview(searchBar)
 */
       
        //可以使用UITextField来代替
        let textField = UITextField(frame: CGRectMake(40,4,bounds.size.width-40*2,bounds.size.height-4*2))
        textField.placeholder = "输入菜名或食材搜索"
        textField.borderStyle = .RoundedRect
        addSubview(textField)
        
        //左边的搜索图片
        let imgView = UIImageView.createImageView("search1")
        imgView.frame = CGRectMake(0, 0, 24, 24)
        textField.leftView = imgView
        textField.leftViewMode = .Always

        backgroundColor = UIColor(white: 0.8, alpha: 1.0)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
}





















































































