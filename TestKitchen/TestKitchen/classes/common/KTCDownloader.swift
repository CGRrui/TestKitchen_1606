//
//  KTCDownloader.swift
//  TestKitchen
//
//  Created by Rui on 16/8/16.
//  Copyright © 2016年 Rui. All rights reserved.
//

import UIKit
import Alamofire

public enum KTCDownloaderType: Int {
    
    case Default = 10  //默认的

}

protocol KTCDownloaderDelegate: NSObjectProtocol {
    
    //下载失败
    func downloader(downloader: KTCDownloader, didFailWithError error: NSError)
    
    //下载成功
    func downloader(downloader: KTCDownloader, didFinishWithData data:NSData?)
    
}

class KTCDownloader: NSObject {

    //代理属性
    //一定要用weak修饰(为了防止他们相互强引用,不然内存会是放不掉)
    weak var delegate: KTCDownloaderDelegate?
    
    //类型,用来区分不同下载
    var type: KTCDownloaderType = .Default
    
    //Post请求下载数据的方法
    func postWithUrlString(urlString:String,params: Dictionary<String,String>?) {
        
        //responseData:用这个因为,不知道返回的是不是jsonData数据,所以要用这个
        Alamofire.request(.POST, urlString, parameters: params, encoding: ParameterEncoding.URL, headers: nil).responseData {
            (response) in
            
            switch response.result {
                
            case .Failure(let error):
                self.delegate?.downloader(self, didFailWithError: error)
            case .Success:
                self.delegate?.downloader(self, didFinishWithData: response.data)
                
            }
        }
        
    }
    
    
}




















































