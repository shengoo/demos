//
//  MovieViewController.swift
//  vis
//
//  Created by Qing Sheng on 15/8/5.
//  Copyright (c) 2015年 Sheng Qing. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {
    
    
    var movie:Movie?{
        didSet {
            
            updateView()
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
        
    }
    
    func updateView(){
        self.navigationItem.title = movie?.title
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
