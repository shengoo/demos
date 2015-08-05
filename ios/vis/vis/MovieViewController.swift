//
//  MovieViewController.swift
//  vis
//
//  Created by Qing Sheng on 15/8/5.
//  Copyright (c) 2015年 Sheng Qing. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    
    var movie:Movie?{
        didSet {
            
//            updateView()
        }
    }

    @IBOutlet weak var image: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var url = NSURL(string: "http://182.92.153.230/file/" + movie!.image)
        image.sd_setImageWithURL(url)
        
//        let playBtn = UIImageView(image: UIImage(named: "play"))
//        playBtn.center = image.center
//        image.addSubview(playBtn)
        
        self.titleLbl.text = movie?.title
        self.descLbl.text = movie?.description
//        descLbl.lineBreakMode = .ByWordWrapping // or NSLineBreakMode.ByWordWrapping
//        descLbl.numberOfLines = 0
//        descLbl.frame = CGRectMake(0, 0, 200, 600)
//        descLbl.sizeToFit()
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
