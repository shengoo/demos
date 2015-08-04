//
//  MovieService.swift
//  vis
//
//  Created by Qing Sheng on 15/7/27.
//  Copyright (c) 2015年 Sheng Qing. All rights reserved.
//

import Foundation

class MovieService {
    
    
    var settings:Settings
    
    
    init(){
        self.settings = Settings()
    }
    
    func getAll(callback:(NSArray)->()){
        println("get all")
        request(settings.all, callback: callback)
    }
    
    func getCategory(callback:(NSArray)->()){
        request(settings.category, callback: callback)
    }
    
    func request(url:String,callback:(NSArray)->()){
        var nsurl = NSURL(string: url)
        println(callback)
        let task = NSURLSession.sharedSession().dataTaskWithURL(nsurl!, completionHandler: {
            (data,response,error) in
            var error:NSError?
            var response = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &error) as! NSArray
            callback(response)
        })
        task.resume()
    }
    
}