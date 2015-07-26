//
//  AppDelegate.swift
//  vis
//
//  Created by Qing Sheng on 15/7/20.
//  Copyright (c) 2015年 Sheng Qing. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var splashView: UIImageView?;


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        window?.makeKeyAndVisible()
        
        splashView = UIImageView(frame: UIScreen.mainScreen().bounds)
//        splashView?.image = UIImage(named: "载入动画-图片")
        
        var background = UIImageView(frame: UIScreen.mainScreen().bounds)
        background.image = UIImage(named: "载入动画-图片")
        splashView?.addSubview(background)
        
        window?.addSubview(splashView!)
        window?.bringSubviewToFront(splashView!)
        
        
        var wordx = UIScreen.mainScreen().bounds.width / 4;
        var wordy = UIScreen.mainScreen().bounds.height / 4;
        var wordw = UIScreen.mainScreen().bounds.width / 2;
        var wordh = UIScreen.mainScreen().bounds.height / 2;
        
        var word = UIImageView(frame: CGRectMake(wordx, wordy, wordw, wordh))
        word.image = UIImage(named: "logo")
        word.alpha = 0
        splashView?.addSubview(word)
        
        
        
        UIView.animateWithDuration(2, delay: 0, options: UIViewAnimationOptions.CurveEaseIn,
            animations: {
                background.transform = CGAffineTransformMakeScale(1.1, 1.1)
            },
            completion: { _ in
                
            }
        )
        UIView.animateWithDuration(2, delay: 2, options: .CurveLinear,
            animations: {
                background.transform = CGAffineTransformMakeScale(1, 1)
            },
            completion: { _ in
                
            }
        )
        
        UIView.animateWithDuration(2, delay: 1, options: UIViewAnimationOptions.CurveLinear,
            animations: {
                word.alpha = 1
            },
            completion: { _ in
                
            }
        );
        
        UIView.animateWithDuration(1.2, delay: 4, options: UIViewAnimationOptions.CurveLinear,
            animations: {
                splashView?.transform = CGAffineTransformMakeTranslation(-UIScreen.mainScreen().bounds.width, 0)
            },
            completion: { _ in
                splashView?.removeFromSuperview()
            }
        );
        
        
        var tabBarController = self.window?.rootViewController as! UITabBarController
        
        var tabBar = tabBarController.tabBar
//        tabBar.backgroundImage = UIImage(named: "iconfont-shu")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal).
        

        
        let tabItems = tabBarController.tabBar.items as! [UITabBarItem]
        
        tabItems[0].image = UIImage(named: "每日精选（未选中）")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        
        tabItems[0].selectedImage = UIImage(named: "每日精选（选中）")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        
        tabItems[1].image = UIImage(named: "视频分类（未选中）")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)

        tabItems[1].selectedImage = UIImage(named: "视频分类（选中）")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)

        
        return true
    }
    

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

