//
//  ViewController.swift
//  PushDemo
//
//  Created by Qing Sheng on 15/7/1.
//  Copyright (c) 2015年 Sheng Qing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "drawAShape:", name: Names.actionOnePressed, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "showAMessage:", name: Names.actionTwoPressed, object: nil)
        
        
        
        let calendar = NSCalendar.currentCalendar()
        let date = calendar.dateByAddingUnit(.CalendarUnitSecond, value: 10, toDate: NSDate(), options: nil)
        
        
        var notification:UILocalNotification = UILocalNotification()
        notification.category = Names.firstCategoryIdentifier
        notification.alertBody = "HI, I'm a notification"
        notification.fireDate = date
        notification.alertAction = "View detail"
        notification.alertTitle = "Push notification demo"
        notification.soundName = UILocalNotificationDefaultSoundName
        notification.applicationIconBadgeNumber = UIApplication.sharedApplication().applicationIconBadgeNumber + 1
        
        
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
        
        // get current setting
        let setting = UIApplication.sharedApplication().currentUserNotificationSettings()
        println(Functions.notificationStatus())
        
    }
    
    func drawAShape(notification:NSNotification){
        var view:UIView = UIView(frame: CGRectMake(10, 10, 100, 100))
        view.backgroundColor = UIColor.redColor()
        
        self.view.addSubview(view)
    }
    
    func showAMessage(notification:NSNotification){
        var message:UIAlertController = UIAlertController(title: "A Notification Meaasge", message: "Hello", preferredStyle: UIAlertControllerStyle.Alert)
        message.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(message, animated: true, completion: nil)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

