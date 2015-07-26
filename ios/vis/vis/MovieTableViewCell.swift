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
    
    func loadItem(title: String, image: String) {
        imageview.image = UIImage(named: image)
        label.text = title
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
