//
//  MovieViewController.swift
//  vis
//
//  Created by Qing Sheng on 15/8/5.
//  Copyright (c) 2015年 Sheng Qing. All rights reserved.
//

import UIKit
import MediaPlayer


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
        
//        self.navigationItem.title = movie?.title
        
        var url = NSURL(string: "http://182.92.153.230/file/" + movie!.image)
        image.sd_setImageWithURL(url)
        
        
        self.titleLbl.text = movie?.title
//        self.descLbl.text = movie?.description
        var txt = NSMutableAttributedString(string: movie!.description)
        var style = NSMutableParagraphStyle()
        style.lineSpacing = 10
        txt.addAttribute(NSParagraphStyleAttributeName, value: style, range: NSMakeRange(0, count(movie!.description)))
//        txt.addAttributes(style, range: NSMakeRange(0, count(movie!.description)))
        descLbl.attributedText = txt
        
//        descLbl.lineBreakMode = .ByWordWrapping // or NSLineBreakMode.ByWordWrapping
//        descLbl.numberOfLines = 0
//        descLbl.frame = CGRectMake(0, 0, 200, 600)
//        descLbl.sizeToFit()
        
        let singleTap = UITapGestureRecognizer(target: self, action: "playMovie")
        singleTap.numberOfTapsRequired = 1
        image.userInteractionEnabled = true
        image.addGestureRecognizer(singleTap)
    }
    
    var playerVC:MPMoviePlayerViewController?
    
    func playMovie(){
        var urlStr = "http://182.92.153.230/file/" + movie!.video;
//        var urlStr = "http://www.sheng00.com/jwplayer/video.mp4"
        var url = NSURL(string: urlStr)
        
        
        playerVC = MPMoviePlayerViewController(contentURL: url)
        
        
        NSNotificationCenter.defaultCenter().removeObserver(playerVC!, name: MPMoviePlayerPlaybackDidFinishNotification, object: playerVC!.moviePlayer)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "movieFinishedCallback", name: MPMoviePlayerPlaybackDidFinishNotification, object: playerVC!.moviePlayer)
        
        playerVC!.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        
        presentViewController(playerVC!, animated: true, completion: {})
        
        
        var landscapeTransform = CGAffineTransformMakeRotation(CGFloat(M_PI_2));
        playerVC!.moviePlayer.view.transform = landscapeTransform;
        
        playerVC!.moviePlayer.movieSourceType = MPMovieSourceType.File
        playerVC!.moviePlayer.prepareToPlay()
        playerVC!.moviePlayer.play()

        
    }
    
    func movieFinishedCallback(){
        NSNotificationCenter.defaultCenter().removeObserver(self, name: MPMoviePlayerPlaybackDidFinishNotification, object: playerVC!.moviePlayer)
        dismissMoviePlayerViewControllerAnimated()
    }
    
    func doneButtonClick(){
        println("doneButtonClick")
    }
    
    func share(){
        var url = "http://182.92.153.230/\(movie!.id)"
        //wechat
        UMSocialWechatHandler.setWXAppId("wx6edc904b2fb2ca36", appSecret: "3457e00b56a26d4399f7fda669f3a037", url: url)
        
        //qq
        UMSocialQQHandler.setQQWithAppId("1104708147", appKey:"BEvrXcIO5hMusbWv" ,url:url);
        
//        UMSocialConfig.hiddenNotInstallPlatforms([UMShareToQQ,UMShareToWechatTimeline,UMShareToWechatSession, UMShareToSina])
        
        var shareTypes:NSArray = [UMShareToQQ,UMShareToWechatTimeline,UMShareToWechatSession, UMShareToSina];

        UMSocialSnsService.presentSnsIconSheetView(self,
            appKey:"55c32328e0f55ae881000579",
            shareText:movie?.title,
            shareImage:image.image,
            shareToSnsNames:shareTypes as [AnyObject],
            delegate:nil);

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool){
        super.viewWillAppear(animated)
        if let movieName = movie?.title{
            MobClick.beginLogPageView(movieName)
        }
    }
    override func viewWillDisappear(animated: Bool){
        super.viewWillDisappear(animated)
        if let movieName = movie?.title{
            MobClick.endLogPageView(movieName)
        }
    }
    

    
    @IBAction func shareBtnPressed(sender: UIButton) {
        share()
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
