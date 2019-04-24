//
//  TimeLineTableViewCell.swift
//  InstaSample
//
//  Created by 土屋光暉 on 2018/06/08.
//  Copyright © 2018年 mitsuki.com. All rights reserved.
//

import UIKit

class TimeLineTableViewCell: UITableViewCell {
    
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var likeCountLabel: UILabel!
    @IBOutlet var commentTextView: UITextView!
    @IBOutlet var timeStampLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        //画像をまるくする
        userImageView.layer.cornerRadius = userImageView.bounds.width / 2.0
        userImageView.layer.masksToBounds = true
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
