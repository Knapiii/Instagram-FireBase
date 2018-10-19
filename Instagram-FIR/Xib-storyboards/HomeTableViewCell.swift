//
//  HomeTableViewCell.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-19.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import UIKit

@IBDesignable
class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var userProfilePicture: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var likesUIImage: UIImageView!
    @IBOutlet weak var commentsUIImage: UIImageView!
    @IBOutlet weak var shareUIImage: UIImageView!
    @IBOutlet weak var amountOfLikes: UIButton!
    @IBOutlet weak var caption: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        AppStyle.roundedCornersImageView(image: userProfilePicture)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
