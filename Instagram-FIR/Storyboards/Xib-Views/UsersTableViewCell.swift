//
//  UsersTableViewCell.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-26.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import UIKit

@IBDesignable
class UsersTableViewCell: UITableViewCell {

    @IBOutlet weak var userProfilePicture: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var followButton: UIButton!

    var user: User? {
        didSet {
            updateView()
        }
    }

    func updateView() {
        userName.text = user?.username
        userName.text = user?.username
        SdSetImage.fetchUserImage(image: userProfilePicture, user: user!, photo: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        AppStyle.roundedCornersImageView(image: userProfilePicture)
    }
}
