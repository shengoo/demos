//
//  MovieTableViewCell.swift
//  vis
//
//  Created by Qing Sheng on 15/7/26.
//  Copyright (c) 2015年 Sheng Qing. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    func loadItem(title: String, image: String, category:String) {
//        imageview.image = UIImage(named: image)
        var url = NSURL(string: "http://182.92.153.230/file/" + image)
        var data = NSData(contentsOfURL: url!)
        var image = UIImage(data: data!)
        imageview.image = image
        
//        var loader = AsyncImageLoader()
//        loader.loadImageWithURL(url, target: imageview.image, action: "action")
        
//        NSURLConnection.sendAsynchronousRequest(NSURLRequest(URL: url!),
//            queue: NSOperationQueue.mainQueue(),
//            completionHandler: {
//            (response,data,error) in
//                self.imageview.image = UIImage(data: data)
//            })

//        let imageView = CCBufferedImageView(frame:CGRectMake(0, 0, 600, 300))
////        if let url = NSURL(string: "http://example.com/yolo.jpg") {
//            imageView.load(url)
////        }
        
        var textString = title + "  -" + category

        var txt = NSMutableAttributedString(string: textString)
        txt.addAttribute(NSForegroundColorAttributeName, value: UIColor.lightGrayColor(), range: NSMakeRange(count(title), count(textString) - count(title)))
        txt.addAttribute(NSFontAttributeName, value: UIFont.systemFontOfSize(13), range: NSMakeRange(count(title), count(textString) - count(title)))
        
        label.attributedText = txt
//        
//        var labelBg = UIImageView(image: UIImage(named: "文字底"))
//        
//        label.addSubview(labelBg)

    }
    
    func action(){
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
