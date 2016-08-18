//
//  CookBookViewController.swift
//  TestKitchen
//
//  Created by Rui on 16/8/15.
//  Copyright © 2016年 Rui. All rights reserved.
//

import UIKit

//食材界面
class CookBookViewController: BaseViewController {

    //食材界面 -> 推荐 -> 最上面的scrollView和pageCtrl
    private var recommendView: CBRecommendView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //导航
        createMyNav()
        
        //初始化视图
        createHomePageView()
        
        //下载推荐的数据
        downloadRecommendData()
    }
    
    //初始化视图
    func createHomePageView(){
        
        self.automaticallyAdjustsScrollViewInsets = false
        //食材界面 -> 推荐 -> 最上面的scrollView和pageCtrl
        recommendView = CBRecommendView()
        view.addSubview(recommendView!)
        
        recommendView?.snp_makeConstraints(closure: {
            [weak self]
            (make) in
            make.edges.equalTo(self!.view).inset(UIEdgeInsetsMake(64, 0, 49, 0))
        })
        
    }
    
    //下载推荐的数据
    func downloadRecommendData(){
        
        //methodName=SceneHome&token=&user_id=&version=4.5
        let dict = ["methodName":"SceneHome","token":"","user_id":"","version":"4.5"]
        let downloader = KTCDownloader()
        downloader.delegate = self
        downloader.postWithUrlString(kHostUrl, params: dict)
        
    }
    
    //创建导航
    func createMyNav(){
        
        //扫一扫
        addNavBtn("saoyisao", target: self, action: #selector(scanAction), isLeft: true)
        
        //搜索
        addNavBtn("search", target: self, action: #selector(searchAction), isLeft: false)
        
    }
    
    //扫一扫
    func scanAction(){
        
        
        
    }
    
    //搜索
    func searchAction(){
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


//MARK: KTCDownloader代理
extension CookBookViewController:KTCDownloaderDelegate {
    
    func downloader(downloader: KTCDownloader, didFailWithError error: NSError) {
        print(error)
    }
    
    func downloader(downloader: KTCDownloader, didFinishWithData data: NSData?) {
        
        if let jsonData = data {
            
            let model = CBRecommendModel.parseModel(jsonData)
            
            //显示数据
            dispatch_async(dispatch_get_main_queue(),{
                [weak self] in
                self!.recommendView?.model = model
                
            })
        }
        
    }
    
}





























