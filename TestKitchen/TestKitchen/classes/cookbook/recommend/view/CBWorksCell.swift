//
//  CBWorksCell.swift
//  TestKitchen
//
//  Created by Rui on 16/8/22.
//  Copyright © 2016年 Rui. All rights reserved.
//

import UIKit

class CBWorksCell: UITableViewCell {
    
    //显示数据
    var model: CBRecommendWidgetListModel? {
        didSet{
            showData()
        }
    }
    
    func showData(){
        
        //i表示列的序号
        for i in 0..<3 {
            
            //i         0  1  2
            
            //大图片
            //index     0  3  6
            if model?.widget_data?.count > i*3 {
                let imageModel = model?.widget_data![i*3]
                if imageModel?.type == "image" {
                    
                    //显示,要先获取按钮
                    let subView = contentView.viewWithTag(100+i)
                    if subView?.isKindOfClass(UIButton.self) == true{
                        //如果是UIButton类型的话,因为cell上面的类型就是UIButton
                        let btn = subView as! UIButton
                        let url = NSURL(string: (imageModel?.content)!)
                        btn.kf_setImageWithURL(url!, forState: .Normal, placeholderImage: UIImage(named: "sdefaultImage"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
                    }
                    
                }
            }
            
            //用户图片
            //index     1  4  7
            if model?.widget_data?.count > i*3+1 {
                let imageModel = model?.widget_data![i*3+1]
                if imageModel?.type == "image" {
                    
                    //显示,要先获取按钮
                    let subView = contentView.viewWithTag(200+i)
                    if subView?.isKindOfClass(UIButton.self) == true{
                        //如果是UIButton类型的话,因为cell上面的类型就是UIButton
                        let btn = subView as! UIButton
                        
                        //设置btn的圆角
                        btn.layer.cornerRadius = 20
                        let url = NSURL(string: (imageModel?.content)!)
                        btn.kf_setImageWithURL(url!, forState: .Normal, placeholderImage: UIImage(named: "sdefaultImage"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
                    }
                }
            }
            
            //用户名     2  5  8
            if model?.widget_data?.count > i*3+2 {
                let nameModel = model?.widget_data![i*3+2]
                if nameModel?.type == "text" {
                    
                    //获取用户名的label
                    let subView = contentView.viewWithTag(300+i)
                    if subView?.isKindOfClass(UILabel.self) == true{
                        //如果是UILabel类型的话,因为cell上面的类型就是UILabel
                        let nameLabel = subView as! UILabel
                        nameLabel.text = nameModel?.content
                        
                    }
                }
            }
        }
        
        //描述文字
        let subView = contentView.viewWithTag(400)
        if subView?.isKindOfClass(UILabel.self) == true {
            let descLabel = subView as! UILabel
            descLabel.text = model?.desc
        }
        
    }
    
    //创建cell的方法
    class func createWorksCellFor(tableView: UITableView, atIndexPath indexPath: NSIndexPath, withListModel listModel: CBRecommendWidgetListModel) -> CBWorksCell {
        
        let cellId = "worksCellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? CBWorksCell
        if nil == cell {
            cell = NSBundle.mainBundle().loadNibNamed("CBWorksCell", owner: nil, options: nil).last as? CBWorksCell
        }
        
        cell?.model = listModel
        return cell!
        
    }

    
    @IBAction func clickBtn(sender: UIButton) {
    }
    
    @IBAction func clickUserBtn(sender: UIButton) {
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
