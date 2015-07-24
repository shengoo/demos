//
//  ViewController.swift
//  ShareTestSwift
//
//  Created by sheng qing on 15/7/24.
//  Copyright (c) 2015年 sheng qing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //wechat
        UMSocialWechatHandler.setWXAppId("wx01f19da315b13687", appSecret: "75144b5e0f9f19ed8c4ff7665e623c33", url: "http://www.umeng.com/social")
        //qq
        UMSocialQQHandler.setQQWithAppId("100424468", appKey:"c7394704798a158208a74ab60104f0ba" ,url:"http://www.umeng.com/social");
        
        var shareTypes:NSArray = [UMShareToQQ,UMShareToWechatTimeline,UMShareToWechatSession, UMShareToSina];
        
        UMSocialSnsService.presentSnsIconSheetView(self,
        appKey:"55b054cce0f55a08820008df",
        shareText:"你要分享的文字",
        shareImage:UIImage(named: "icon.png"),
        shareToSnsNames:shareTypes as [AnyObject],
        delegate:nil);


        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

