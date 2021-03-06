//
//  CBRecommendView.swift
//  TestKitchen
//
//  Created by Rui on 16/8/17.
//  Copyright © 2016年 Rui. All rights reserved.
//

import UIKit

//食材界面 -> 推荐界面
class CBRecommendView: UIView {

   //表格
    private var tbView: UITableView?
    
    //显示数据
    var model: CBRecommendModel? {
        
        didSet {
            
            //刷新表格
            tbView?.reloadData()
            
        }
    }
    
    init() {
        
        super.init(frame: CGRectZero)
        
        //创建表格视图
        tbView = UITableView(frame: CGRectZero, style: .Plain)
        tbView?.delegate = self
        tbView?.dataSource = self
        
        //去掉分割线
        tbView?.separatorStyle = .None
        
        addSubview(tbView!)
        
        //约束
        tbView?.snp_makeConstraints(closure: {
            
            [weak self]
            (make) in
            make.edges.equalTo(self!)
            
        })
    
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}






//MARK: UITabelView代理
extension CBRecommendView: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        //广告数据显示一个分组
        var sectionNum = 1
        
        if model?.data?.widgetList?.count > 0 {
            
                sectionNum += (model?.data?.widgetList?.count)!
            
        }
        return sectionNum
    }
    
    //显示几行
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var rowNum = 0
        if section == 0 {
            //scrollView和pageCtrl的Cell显示
            if model?.data?.banner?.count > 0 {
                
                rowNum = 1
                
            }
            
        }else{
            
            //其他的情况
            let listModel = model?.data?.widgetList![section-1]
            if listModel?.widget_type?.integerValue == WidgetType.GuessYourLike.rawValue{
                //猜你喜欢的显示
                rowNum = 1  //显示1行
                
                
            }else if listModel?.widget_type?.integerValue == WidgetType.RedPackage.rawValue {
                //红包入口(滚动视图)
                rowNum = 1
            }else if listModel?.widget_type?.integerValue == WidgetType.NewProduct.rawValue{
                    //今日新品
                    rowNum = 1  //显示1行
            }else if listModel?.widget_type?.integerValue == WidgetType.Special.rawValue{
                //早餐日记,健康100岁等
                rowNum = 1  //显示1行
            }else if listModel?.widget_type?.integerValue == WidgetType.Scene.rawValue{
                //全部场景
                rowNum = 1  //显示1行
            }else if listModel?.widget_type?.integerValue == WidgetType.Talent.rawValue{
                //推荐达人
                //判断,只有返回的json数据是4个才显示数据,不然就不显示
                rowNum = (listModel?.widget_data?.count)! / 4
            }
        }
        return rowNum
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        var height: CGFloat = 0
        
        //修改高度的值
        if indexPath.section == 0 {
            //广告的高度(scrollView和pageCtrl的)
            if model?.data?.banner?.count > 0 {
                //CBRecommendADCell的高度
                height = 160
            }
            
        }else{
            
            //其他情况
            let listModel = model?.data?.widgetList![indexPath.section-1]
            if listModel?.widget_type?.integerValue == WidgetType.GuessYourLike.rawValue {
                //猜你喜欢
                height = 80
            }else if listModel?.widget_type?.integerValue == WidgetType.RedPackage.rawValue {
                //红包入口
                height = 100
            }else if listModel?.widget_type?.integerValue == WidgetType.NewProduct.rawValue {
                //今日新品
                height = 300
            }else if listModel?.widget_type?.integerValue == WidgetType.Special.rawValue {
                //早餐日记,健康100岁等
                height = 200
            }else if listModel?.widget_type?.integerValue == WidgetType.Scene.rawValue {
                //全部场景
                height = 60
            }else if listModel?.widget_type?.integerValue == WidgetType.Talent.rawValue {
                //推荐达人
                height = 80
            }
            
        }
        return height
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        if indexPath.section == 0 {
            //广告的Cell显示(scrollView和pageCtrl)
            if model?.data?.banner?.count >  0 {
                
                cell = CBRecommendADCell.createAdCellFor(tableView, atIndexPath: indexPath, withModel: model!)
                
            }
        }else{
            
            //其他情况
            let listModel = model?.data?.widgetList![indexPath.section-1]
            if listModel?.widget_type?.integerValue == WidgetType.GuessYourLike.rawValue {
                //猜你喜欢
                cell = CBRecommendLikeCell.createLikeCellFor(tableView, atIndexPath: indexPath, withListModel: listModel!)
            }else if listModel?.widget_type?.integerValue == WidgetType.RedPackage.rawValue {
                //红包入口
                cell = CBRedPacketCell.createRedPackageCellFor(tableView, atIndexPath: indexPath, withListModel: listModel!)
            }else if listModel?.widget_type?.integerValue == WidgetType.NewProduct.rawValue {
                //今日新品
                cell = CBRecommendNewCell.createNewCellFor(tableView, atIndexPath: indexPath, withListModel: listModel!)
            }else if listModel?.widget_type?.integerValue == WidgetType.Special.rawValue {
                //早餐日记、健康100岁
                cell = CBSpecialCell.createSpecialCellFor(tableView, atIndexPath: indexPath, withListModel: listModel!)
            }else if listModel?.widget_type?.integerValue == WidgetType.Scene.rawValue {
                //全部场景
                cell = CBSceneCell.createSceneCellFor(tableView, atIndexPath: indexPath, withListModel: listModel!)
            }else if listModel?.widget_type?.integerValue == WidgetType.Talent.rawValue {
                //推荐达人
                cell = CBTalentCell.createTalentCellFor(tableView, atIndexPath: indexPath, withListModel: listModel!)
            }
        }
     return cell
}
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        var headView: UIView? = nil
        if section > 0 {
            
            //其他的情况
            let listModel = model?.data?.widgetList![section-1]
            if listModel?.widget_type?.integerValue == WidgetType.GuessYourLike.rawValue{
            
                //猜你喜欢的显示
                headView = CBSearchHeaderView(frame: CGRectMake(0,0,kScreenWidth,44))
            
            }else if listModel?.widget_type?.integerValue == WidgetType.NewProduct.rawValue || listModel?.widget_type?.integerValue == WidgetType.Special.rawValue || listModel?.widget_type?.integerValue == WidgetType.Talent.rawValue{
                
                //今日新品的显示(json返回的数据不同,所以显示的今日新品会变化) -> NewProduct
                //早餐日记、健康100岁(动态数据,会换)   -> Special
                //推荐达人                          -> Talent
                let tmpView = CBHeaderView(frame: CGRectMake(0,0,kScreenWidth,44))
                tmpView.configTitle((listModel?.title)!)
                headView = tmpView
                
            }
        
    }
        return headView
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        //其他的情况
        var height:CGFloat = 0
        if section > 0 {
            
            //其他情况
            let listModel = model?.data?.widgetList![section-1]
            if listModel?.widget_type?.integerValue == WidgetType.GuessYourLike.rawValue || listModel?.widget_type?.integerValue == WidgetType.NewProduct.rawValue || listModel?.widget_type?.integerValue == WidgetType.Special.rawValue || (listModel?.widget_type?.integerValue == WidgetType.Talent.rawValue){
                
                //猜你喜欢的显示       -->      GuessYourLike
                //今日新品的显示       -->      NewProduct
                //早餐日记、健康100岁  -->      Special
                //推荐达人            -->      Talent
                height = 44
                
            }
            
        }
        
        return height
}
}



























