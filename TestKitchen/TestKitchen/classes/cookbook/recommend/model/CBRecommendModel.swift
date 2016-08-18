//
//  CBRecommendModel.swift
//  TestKitchen
//
//  Created by Rui on 16/8/16.
//  Copyright © 2016年 Rui. All rights reserved.
//

//食材的推荐界面

import UIKit
import SwiftyJSON

class CBRecommendModel: NSObject {

    var code: NSNumber?
    var msg: Bool?
    var version: String?
    var timestamp: NSNumber?
    var data: CBRecommendDataModel?
    
    //解析
    class func parseModel(data: NSData) -> CBRecommendModel {
        
        let model = CBRecommendModel()
        
        let jsonData = JSON(data: data)
        model.code = jsonData["code"].number
        model.msg = jsonData["msg"].bool
        model.version = jsonData["version"].string
        model.timestamp = jsonData["timestamp"].number
        
        let dataDict = jsonData["data"]
        
        model.data = CBRecommendDataModel.parseModel(dataDict)
        return model
        
    }
//    {
//        "code": 0,
//        "msg": true,
//        "version": null,
//        "timestamp": 1471318802136,
//        "data": {
//            "banner": [
//            {
//            "banner_id": 88,
//            "banner_title": "秋葵鸡蛋卷",
//            "banner_picture": "http://img.szzhangchu.com/1471257588171_9811390087.jpg",
//            "banner_link": "app://food_course_series#58#",
//            "is_link": 1,
//            "refer_key": 18,
//            "type_id": 1
//            },
}


class CBRecommendDataModel: NSObject {
    
    var banner: Array<CBRecommendBannerModel>?
    var widgetList: Array<CBRecommendWidgetListModel>?
    
    class func parseModel(jsonData: JSON) -> CBRecommendDataModel {
        
        let model = CBRecommendDataModel()
        
        //banner
        let bannerArray = jsonData["banner"]
        var bArray = Array<CBRecommendBannerModel>()
        for (_, subjson) in bannerArray {
            
            //subjson是转换成CBRecommendBannerModel类型对象
            let bannerModel = CBRecommendBannerModel.parseModel(subjson)
            bArray.append(bannerModel)
        }
        model.banner = bArray
        
        //widgetList
        let listArray = jsonData["widgetList"]
        var wlArray = Array<CBRecommendWidgetListModel>()
        for (_, subjson) in listArray {
            
            //subjson解析成CBRecommendWidgetListModel类型的对象
            
            let wlModel = CBRecommendWidgetListModel.parseModel(subjson)
            wlArray.append(wlModel)
            
            
        }
        model.widgetList = wlArray
        
        return model
    }
    
//    "widgetList": [
//    {
//    "widget_id": 32,
//    "widget_type": 1,
//    "title": "猜你喜欢",
//    "title_link": null,
//    "desc": null,
//    "widget_data": [
//    {
}


class CBRecommendBannerModel: NSObject {
    
    var banner_id: NSNumber?
    var banner_title: String?
    var banner_picture: String?
    
    var banner_link: String?
    var is_link: NSNumber?
    var refer_key: NSNumber?
    
    var type_id: NSNumber?
    
    class func parseModel(jsonData: JSON) -> CBRecommendBannerModel {
        
        let model = CBRecommendBannerModel()
        
        model.banner_id = jsonData["banner_id"].number
        model.banner_title = jsonData["banner_title"].string
        model.banner_picture = jsonData["banner_picture"].string
        
        model.banner_link = jsonData["banner_link"].string
        model.is_link = jsonData["is_link"].number
        model.refer_key = jsonData["refer_key"].number
        model.type_id = jsonData["type_id"].number
        
        return model
    }

//    "banner": [
//    {
//    "banner_id": 88,
//    "banner_title": "秋葵鸡蛋卷",
//    "banner_picture": "http://img.szzhangchu.com/1471257588171_9811390087.jpg",
//    "banner_link": "app://food_course_series#58#",
//    "is_link": 1,
//    "refer_key": 18,
//    "type_id": 1
//    },
}

class CBRecommendWidgetListModel: NSObject {
    
    var widget_id: NSNumber?
    var widget_type: NSNumber?
    var title: String?
    var title_link: String?
    var desc: String?
    var widget_data: Array<CBRecommendWidgetDataModel>?
    
    class func parseModel(jsonData: JSON) -> CBRecommendWidgetListModel {
        
        let model = CBRecommendWidgetListModel()
        
        model.widget_id = jsonData["widget_id"].number
        model.widget_type = jsonData["widget_type"].number
        model.title = jsonData["title"].string
        model.title_link = jsonData["title_link"].string
        model.desc = jsonData["desc"].string
        
        let dataArray = jsonData["widget_data"]
        var wdArray = Array<CBRecommendWidgetDataModel>()
        for (_, subjson) in dataArray {
            
            let wdModel = CBRecommendWidgetDataModel.parseModel(subjson)
            wdArray.append(wdModel)
            
        }
        model.widget_data = wdArray
        
        return model
        
    }
//    "widgetList": [
//    {
//    "widget_id": 32,
//    "widget_type": 1,
//    "title": "猜你喜欢",
//    "title_link": null,
//    "desc": null,
//    "widget_data": [
//    {
//    "id": 1,
//    "type": "image",
//    "content": "http://img.szzhangchu.com/1456222953065_6855615159.png",
//    "link": "http://h5.izhangchu.com/Tour.html?app_hideheader=1"
//    },
    
}


class CBRecommendWidgetDataModel: NSObject {
    
    var id: NSNumber?
    var type: String?
    var content: String?
    var link: String?
    
    class func parseModel(jsonData: JSON) -> CBRecommendWidgetDataModel {
        
        let model = CBRecommendWidgetDataModel()
        model.id = jsonData["id"].number
        model.type = jsonData["type"].string
        model.content = jsonData["content"].string
        model.link = jsonData["link"].string
        
        return model
    }
    
    //"widget_data": [
    //    {
    //    "id": 1,
    //    "type": "image",
    //    "content": "http://img.szzhangchu.com/1456222953065_6855615159.png",
    //    "link": "http://h5.izhangchu.com/Tour.html?app_hideheader=1"
    //    },
}










