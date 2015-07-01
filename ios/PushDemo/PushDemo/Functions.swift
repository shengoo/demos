//
//  Functions.swift
//  PushDemo
//
//  Created by Qing Sheng on 15/7/1.
//  Copyright (c) 2015年 Sheng Qing. All rights reserved.
//

import Foundation
import UIKit

class Functions {
    static func notificationStatus()->Bool{
        let withedTypes = UIUserNotificationType.Alert | UIUserNotificationType.Badge | UIUserNotificationType.Sound
        let application = UIApplication.sharedApplication()
        let settings = application.currentUserNotificationSettings()
        if settings == nil{
            return false
        }
        if settings.types != withedTypes{
            return false
        }
        return true
    }
}