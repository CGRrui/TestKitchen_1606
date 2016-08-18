//
//  MainTabBarController.swift
//  TestKitchen
//
//  Created by Rui on 16/8/15.
//  Copyright © 2016年 Rui. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    //tabbar的背景视图
    private var bgView: UIView?
    
    //json文件对应的数组
    private var array: Array<Dictionary<String,String>>? {
        
        get {
            
            //直接读文件
            let path = NSBundle.mainBundle().pathForResource("Ctrl.json", ofType: nil)
            var myArray: Array<Dictionary<String,String>>? = nil
            if let filePath = path {
                
                let data = NSData(contentsOfFile: filePath)
                if let jsonData = data {
                    do {
                        
                        let jsonVale = try NSJSONSerialization.JSONObjectWithData(jsonData, options: .MutableContainers)
                        if jsonVale.isKindOfClass(NSArray.self) {
                            
                            myArray = jsonVale as? Array<Dictionary<String,String>>
                            
                        }
                    } catch {
                        
                        //如果有错误的话,打印错误信息
                        //程序出现异常
                        print(error)
                        return nil
                    }
                    
                }
            }
            return myArray
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Swift里面,一般在类的内部调用属性和方法的时候,可以不写self,一般在闭包中写self
        //创建视图控制器
        createViewControllers()
        
    }
    
    //创建视图控制器
    func createViewControllers(){
        
        //let ctrlNames = ["CookBookViewController","CommunityViewController","MallViewController","FoodClassViewController","ProfileViewController"]
        
        //视图控制器
        var ctrlNames = [String]()
        
        //tabbar上面的图片
        var imageNames =  [String]()
        
        //tabbar上面标题文字
        var titleNames = [String]()
        
        if let tmpArray = self.array {
            
            //json文件的数据解析成功
            //并且数组里面有数据
            for dict in tmpArray {
                let name = dict["ctrlName"]
                let titleName = dict["titleName"]
                let imageName = dict["imageName"]
                ctrlNames.append(name!)
                titleNames.append(titleName!)
                imageNames.append(imageName!)
            }

        }else{
            ctrlNames = ["CookBookViewController","CommunityViewController","MallViewController","FoodClassViewController","ProfileViewController"]
            
            titleNames = ["食材","社区","商城","食课","我的"]
            imageNames = ["home","community","shop","shike","mine"]
            
        }
        
        var vCtrlArray = Array<UINavigationController>()
        
        for i in 0..<ctrlNames.count {
         
            //创建视图控制器
            let ctrlName = "TestKitchen." + ctrlNames[i]
            let cls = NSClassFromString(ctrlName) as! UIViewController.Type
            let ctrl = cls.init()
            
            //导航视图控制器
            let navCtrl = UINavigationController(rootViewController: ctrl)
            vCtrlArray.append(navCtrl)
            
        }
        
        self.viewControllers = vCtrlArray
        
        //自定制tabbar
        self.createCustomTabbar(titleNames, imageNames: imageNames)
        
    }
    
    //自定制tabbar
    /*
     @param titleNames
     @param imageNames
     */
    func createCustomTabbar(titleNames: [String], imageNames: [String]) {
        
        //1.创建背景视图(使用自动布局来写)
        bgView = UIView.createView()
        bgView?.backgroundColor = UIColor.whiteColor()
        
        //设置边框
            bgView?.layer.borderWidth = 1
            bgView?.layer.borderColor = UIColor.grayColor().CGColor
            view.addSubview(self.bgView!)
        
        //2.添加背景图片的约束(在AppDelegate中导入SnapKit库)
            bgView?.snp_makeConstraints(closure: {
            [weak self]
            (make) in
            make.left.right.equalTo(self!.view)  //约束左边和self.view的右边相等
            make.bottom.equalTo(self!.view)  //约束下面和self.view一样
            make.top.equalTo(self!.view.snp_bottom).offset(-49)
        })
        
        //循环添加按钮
        
        //按钮的宽度
        let width = kScreenWidth/5.0
        
        //按钮的高度
        //let height = kScreenWidth/5.0
        for i in 0..<imageNames.count {
            //home_normal@2x       home_select@2x
            //community_normal@2x  community_select@2x
            //shop_normal@2x       shop_select@2x
            //shike_normal@2x      shike_select@2x
            //mine_normal@2x       mine_select@2x
            //图片
            let imageName = imageNames[i]
            let titleName = titleNames[i]
            
            //2.1按钮
            let bgImageName = imageName+"_normal"
            let selectBgImageName = imageName+"_select"  //选中的图片
            let btn = UIButton.createBtn(nil, bgImageName: bgImageName, selectBgImageName: selectBgImageName, target: self, action: #selector(clickBtn(_:)))
            bgView?.addSubview(btn)
            
            //添加按钮的frame(约束)
            btn.snp_makeConstraints(closure: {
                [weak self]
                (make) in
                make.top.bottom.equalTo(self!.bgView!)
                make.width.equalTo(width)
                make.left.equalTo(width*CGFloat(i))   //
            })
            
            //2.2文字
            let label = UILabel.createLabel(titleName, font: UIFont.systemFontOfSize(8), textAlignment: .Center, textColor: UIColor.grayColor())
            btn.addSubview(label)
            
            
            //文字的约束
            label.snp_makeConstraints(closure: {
                (make) in
                make.left.right.equalTo(btn)
                make.top.equalTo(btn).offset(32)
                make.height.equalTo(12)
            })
            
            btn.tag = 30+i
            label.tag = 40
            
            //第一次运行程序,默认选中第一个按钮
            if i == 0 {
                btn.selected = true
                label.textColor = UIColor.orangeColor()
            }
            
        }
    }
    
    //按钮的点击事件
    func clickBtn(curBtn: UIButton){
        
        //1.取消之前选中的按钮的状态
        let lastBtnView = self.view.viewWithTag(30+selectedIndex)
        if let tmpBtn = lastBtnView {
            //上次选中的按钮
            let lastBtn = lastBtnView as! UIButton
            let lastView = tmpBtn.viewWithTag(40)
            if let tmpLabel = lastView {
                //上次选中的标签
                let lastLabel = tmpLabel as! UILabel
                lastBtn.selected = false
                lastLabel.textColor = UIColor.grayColor()
            }
            
        }
        
        //2.要设置当前选中按钮的状态
        let curLabelView = curBtn.viewWithTag(40)
        if let tmpLabel = curLabelView {
            let curLabel = tmpLabel as! UILabel
            curBtn.selected = true
            curLabel.textColor = UIColor.orangeColor()
        }
        
        //3.选中视图控制器
        selectedIndex = curBtn.tag - 30
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























