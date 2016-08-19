//
//  CBRecommendNewCell.swift
//  TestKitchen
//
//  Created by Rui on 16/8/19.
//  Copyright © 2016年 Rui. All rights reserved.
//

//食材界面 -> 推荐 -> 猜你喜欢界面
import UIKit

class CBRecommendNewCell: UITableViewCell {
    
    //显示数据
    var model: CBRecommendWidgetListModel? {
        didSet {
            showData()
        }
    }
    
    func showData(){
        
        //按照三列来遍历(一共12个)
        for i in 0..<3 {
            
            //图片
            //图片序号 0  4  8
            if model?.widget_data?.count > i*4 {
                
                let imageModel = model?.widget_data![i*4]
                if imageModel?.type == "image" {  //判断类型一定是"image"
                    
                    let url = NSURL(string: (imageModel?.content)!)
                    let dImage = UIImage(named: "sdefaultImage")
                    
                    //获取图片视图(通过取tag值)
                    let subView = contentView.viewWithTag(200+i)
                    if ((subView?.isKindOfClass(UIImageView.self)) == true){
                        
                        let imageView = subView as! UIImageView
                        imageView.kf_setImageWithURL(url, placeholderImage: dImage, optionsInfo: nil, progressBlock: nil, completionHandler: nil)
                    }
                    
            }
            
            }
            
            //视频
            //视频序号 1  5  9
            
            //标题文字
            //标题文字 2  6  10
            if model?.widget_data?.count > i*4+2 {
                
                let titleModel = model?.widget_data![i*4+2]
                if titleModel?.type == "text" {
                    
                    //获取标题的label
                    let subView = contentView.viewWithTag(400+i)
                    if subView?.isKindOfClass(UILabel.self) == true {
                        let titleLabel = subView as!UILabel
                        titleLabel.text = titleModel?.content
                        
                    }
                    
                }
                
            }
            
            //描述文字
            //描述文字 3  7  11
            if model?.widget_data?.count > i*4+3 {
                
                let descModel = model?.widget_data![i*4+3]
                if descModel?.type == "text" {
                    
                    //描述文字的label
                    let subView = contentView.viewWithTag(500+i)
                    if subView?.isKindOfClass(UILabel.self) == true {
                        
                        let descLabel = subView as! UILabel
                        descLabel.text = descModel?.content
                        
                    }
                    
                }
                
            }
            
        }
        
    }
    
    //创建cell的方法
    class func createNewCellFor(tableView: UITableView, atIndexPath indexPath: NSIndexPath, withListModel listModel: CBRecommendWidgetListModel) -> CBRecommendNewCell {
        
        let cellId = "recommendNewCellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? CBRecommendNewCell
        if nil == cell {
            cell = NSBundle.mainBundle().loadNibNamed("CBRecommendNewCell", owner: nil, options: nil).last as? CBRecommendNewCell
        }
        
        cell?.model = listModel
        return cell!
        
    }
    
    
    //点击进入详情Btn
    @IBAction func clickBtn(sender: UIButton) {
    }
    
    //播放视频Btn
    @IBAction func playAction(sender: UIButton) {
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






















