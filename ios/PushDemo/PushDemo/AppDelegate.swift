//
//  AppDelegate.swift
//  PushDemo
//
//  Created by Qing Sheng on 15/7/1.
//  Copyright (c) 2015年 Sheng Qing. All rights reserved.
//

import UIKit




@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        UMessage.startWithAppkey("55a38bfb67e58e356400140e", launchOptions: launchOptions);
        
        
        var firstAction:UIMutableUserNotificationAction = UIMutableUserNotificationAction()
        firstAction.identifier = Names.firstActionIdentifier
        firstAction.title = Names.firstActionTitle
        
        // run app in background
        firstAction.activationMode = UIUserNotificationActivationMode.Background
        // if set true, button will be red on lockscreen
        firstAction.destructive = true
        // will be true if activationMode set to Foreground
        firstAction.authenticationRequired = false
        
        
        var secondAction:UIMutableUserNotificationAction = UIMutableUserNotificationAction()
        secondAction.identifier = Names.secondActionIdentifier
        secondAction.title = Names.secondActionTitle
        
        secondAction.activationMode = UIUserNotificationActivationMode.Foreground
        secondAction.destructive = false
        secondAction.authenticationRequired = false
        
        
        var thirdAction:UIMutableUserNotificationAction = UIMutableUserNotificationAction()
        thirdAction.identifier = Names.thirdActionIdentifier
        thirdAction.title = Names.thirdActionTitle
        
        thirdAction.activationMode = UIUserNotificationActivationMode.Background
        thirdAction.destructive = false
        thirdAction.authenticationRequired = false
        
        
        // category
        
        var firstCategory:UIMutableUserNotificationCategory = UIMutableUserNotificationCategory()
        firstCategory.identifier = Names.firstCategoryIdentifier
        
        
        let defaultActions:NSArray = [firstAction,secondAction,thirdAction]
        let minimalActions:NSArray = [firstAction,secondAction]
        
        firstCategory.setActions(defaultActions as [AnyObject], forContext: UIUserNotificationActionContext.Default)
        firstCategory.setActions(minimalActions as [AnyObject], forContext: UIUserNotificationActionContext.Minimal)
        
        //NSSet of all our categories
        
        let categories:NSSet = NSSet(object: firstCategory)
        
        
        
        let types:UIUserNotificationType = UIUserNotificationType.Alert | UIUserNotificationType.Badge | UIUserNotificationType.Sound
        
        let mySettings:UIUserNotificationSettings = UIUserNotificationSettings(forTypes: types, categories: categories as Set<NSObject>)
        
        UIApplication.sharedApplication().registerUserNotificationSettings(mySettings)
    
        UIApplication.sharedApplication().registerForRemoteNotifications()
        
        return true
    }
    
    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        println("didReceiveLocalNotification : " + notification.description)
    }
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        println("didReceiveRemoteNotification : " + userInfo.description)
        UMessage.didReceiveRemoteNotification(userInfo)
    }
    
    func application(application: UIApplication, handleActionWithIdentifier identifier: String?, forLocalNotification notification: UILocalNotification, completionHandler: () -> Void) {
        println("handleActionWithIdentifier forLocalNotification : " + notification.description)
        if(identifier == Names.firstActionIdentifier){
            
            NSNotificationCenter.defaultCenter().postNotificationName(Names.actionOnePressed, object: nil)
            
        }else if(identifier == Names.secondActionIdentifier){
            
            NSNotificationCenter.defaultCenter().postNotificationName(Names.actionTwoPressed, object: nil)
            
        }
        completionHandler()
    }
    
    func application(application: UIApplication, handleActionWithIdentifier identifier: String?, forRemoteNotification userInfo: [NSObject : AnyObject], completionHandler: () -> Void) {
        println("handleActionWithIdentifier forRemoteNotification : " + userInfo.description)
        completionHandler()
    }
    
    
    // token can change, need to register every time it launched
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        println(deviceToken)
        var characterSet:NSCharacterSet = NSCharacterSet(charactersInString: "<>")
        var deviceTokenString = (deviceToken.description as NSString).stringByTrimmingCharactersInSet(characterSet)
                                .stringByReplacingOccurrencesOfString(" ", withString: "", options: nil, range: nil)
        println(deviceTokenString)
        UMessage.registerDeviceToken(deviceToken)
        
    }
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        println(error.localizedDescription)
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

