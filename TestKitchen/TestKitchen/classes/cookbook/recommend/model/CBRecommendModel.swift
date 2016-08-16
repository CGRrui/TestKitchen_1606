//
//  CBRecommendModel.swift
//  TestKitchen
//
//  Created by Rui on 16/8/16.
//  Copyright © 2016年 Rui. All rights reserved.
//

//食材的推荐界面
import UIKit

class CBRecommendModel: NSObject {

    var code: NSNumber?
    var msg: Bool?
    var version: String?
    var timestamp: NSNumber?
    var data: NSDictionary?
    
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
    
    //"widget_data": [
    //    {
    //    "id": 1,
    //    "type": "image",
    //    "content": "http://img.szzhangchu.com/1456222953065_6855615159.png",
    //    "link": "http://h5.izhangchu.com/Tour.html?app_hideheader=1"
    //    },
}










