//
//  CBRecommendLikeCell.swift
//  TestKitchen
//
//  Created by Rui on 16/8/17.
//  Copyright © 2016年 Rui. All rights reserved.
//

import UIKit
//食材界面 -> 推荐 -> 猜你喜欢界面
class CBRecommendLikeCell: UITableViewCell {

    //显示数据
    var model: CBRecommendWidgetListModel?{
        
        didSet {
            
            //显示图片和文字
            showData()
            
        }
        
        
    }
    
    //显示图片和文字
    func showData(){
        
        //因为图片+加文字=8,所以遍历8次
        for var i in 0..<8{
            
            //图片
            if model?.widget_data?.count > i {//防止越界
                
                let imageModel = model?.widget_data![i]
                if imageModel?.type == "image" {//有图片
                    
                    //获取图片的视图
                    //CBRecommendLikeCell中的4个ImageView的tag值,通过tag来标记
                    //tag:200 201 202 203  
                    let index = i/2
                    let subView = self.contentView.viewWithTag(200+index)
                    if ((subView?.isKindOfClass(UIImageView.self)) == true){
                        
                        let imageView = subView as! UIImageView
                        let url = NSURL(string: (imageModel?.content)!)
                        imageView.kf_setImageWithURL(url, placeholderImage: UIImage(named: "sdefaultImage"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
                        
                    }
                }
            }
            
            //文字
            if model?.widget_data?.count > i+1 {
                
                let textModel = model?.widget_data![i+1]
                
                if textModel?.type == "text" { //文字
                    
                    //tag:300 301 302 303
                    let subView = self.contentView.viewWithTag(300+i/2)
                    if ((subView?.isKindOfClass(UILabel.self)) == true){
                        
                        let label = subView as! UILabel
                        label.text = textModel?.content
                        
                    }
                }
            }
            
            //每一次遍历两个,因为按钮和文字相当于一个
            i += 1
            
        }
    }
    
    //创建cell的方法
    class func createLikeCellFor(tabView: UITableView, atIndexPath indexPath: NSIndexPath, withListModel listModel: CBRecommendWidgetListModel) -> CBRecommendLikeCell {
        
            //integerValue:整数
            //猜你喜欢
            let cellId = "recommendLikeCellId"
            var cell = tabView.dequeueReusableCellWithIdentifier(cellId) as? CBRecommendLikeCell
            if nil == cell {
                cell = NSBundle.mainBundle().loadNibNamed("CBRecommendLikeCell", owner: nil, options: nil).last as? CBRecommendLikeCell
            }
            cell?.model = listModel
            return cell!
        }
    
    
    @IBAction func clickBtn(sender: UIButton) {
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
























































































