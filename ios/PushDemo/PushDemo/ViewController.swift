//
//  ViewController.swift
//  PushDemo
//
//  Created by Qing Sheng on 15/7/1.
//  Copyright (c) 2015年 Sheng Qing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "localNotificationActionOnePressed:", name: Names.actionOnePressed, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "localNotificationActionTwoPressed:", name: Names.actionTwoPressed, object: nil)
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        let calendar = NSCalendar.currentCalendar()
        let date = calendar.dateByAddingUnit(.CalendarUnitSecond, value: 10, toDate: NSDate(), options: nil)
        
        
        var notification:UILocalNotification = UILocalNotification()
        notification.category = Names.firstCategoryIdentifier
        notification.alertBody = "HI, I'm a notification"
        notification.fireDate = date
        notification.soundName = UILocalNotificationDefaultSoundName
        notification.applicationIconBadgeNumber = UIApplication.sharedApplication().applicationIconBadgeNumber + 1
        
        
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
        
        // get current setting
        let setting = UIApplication.sharedApplication().currentUserNotificationSettings()
        println(Functions.notificationStatus())
    }
    
    func localNotificationActionOnePressed(notification:NSNotification){
        label.text = "Action one pressed"
    }
    
    func localNotificationActionTwoPressed(notification:NSNotification){
        label.text = "Action two pressed"
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

