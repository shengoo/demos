//
//  MovieViewController.swift
//  vis
//
//  Created by Qing Sheng on 15/8/5.
//  Copyright (c) 2015年 Sheng Qing. All rights reserved.
//

import UIKit
import MediaPlayer


class MovieViewController: UIViewController,PlayerDelegate {
    
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
        
        self.navigationItem.title = movie?.title
        
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
        
//        println("playMovie from " + urlStr)
        
        playerVC = MPMoviePlayerViewController(contentURL: url)
        
//        var player = MPMoviePlayerController(contentURL: url)
//        player.controlStyle = MPMovieControlStyle.Fullscreen
//        player.movieSourceType = MPMovieSourceType.File
//        player.shouldAutoplay = true
//        self.view.addSubview(player.view)
//        player.setFullscreen(true, animated: true)
        
        NSNotificationCenter.defaultCenter().removeObserver(playerVC!, name: MPMoviePlayerPlaybackDidFinishNotification, object: playerVC!.moviePlayer)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "movieFinishedCallback", name: MPMoviePlayerPlaybackDidFinishNotification, object: playerVC!.moviePlayer)
        
        playerVC!.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        
        presentViewController(playerVC!, animated: true, completion: {})
        
        
        var landscapeTransform = CGAffineTransformMakeRotation(CGFloat(M_PI_2));
        playerVC!.moviePlayer.view.transform = landscapeTransform;
        
        playerVC!.moviePlayer.movieSourceType = MPMovieSourceType.File
        playerVC!.moviePlayer.prepareToPlay()
        playerVC!.moviePlayer.play()
        
//        NSNotificationCenter.defaultCenter().addObserver(self,
//            selector: "doneButtonClick",
//            name: MPMoviePlayerWillExitFullscreenNotification,
//            object: nil)
        
        
//        var player = Player()
//        player.delegate = self
//        player.view.frame = self.view.bounds
//        
//        self.addChildViewController(player)
//        self.view.addSubview(player.view)
//        player.didMoveToParentViewController(self)
//        
//        player.path = urlStr
//        player.playbackLoops = true
//        player.playFromBeginning()
        
    }
    
    func movieFinishedCallback(){
//        var reason = notification.userInfo[MPMoviePlayerPlaybackDidFinishReasonUserInfoKey]
        NSNotificationCenter.defaultCenter().removeObserver(self, name: MPMoviePlayerPlaybackDidFinishNotification, object: playerVC!.moviePlayer)
        dismissMoviePlayerViewControllerAnimated()
    }
    
    func doneButtonClick(){
        println("doneButtonClick")
    }
    
    func updateView(){
        self.navigationItem.title = movie?.title
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func playerReady(player: Player){
        
    }
    func playerPlaybackStateDidChange(player: Player){
        
    }
    func playerBufferingStateDidChange(player: Player){
        
    }
    
    func playerPlaybackWillStartFromBeginning(player: Player){
        
    }
    func playerPlaybackDidEnd(player: Player){
        
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
