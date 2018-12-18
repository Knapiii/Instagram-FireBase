//
//  CommentTableViewCell.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-22.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import UIKit

@IBDesignable
class CommentTableViewCell: UITableViewCell {

    @IBOutlet weak var userProfilePicture: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!

    var comments: Comment? {
        didSet {
            fetchCommentInformation()
        }
    }

    var user: UserModel? {
        didSet {
            fetchUserInformation()
        }
    }

    func fetchCommentInformation() {
        commentLabel.text = comments?.commentText
    }

    func fetchUserInformation() {
        userNameLabel.text = user?.username
        SdSetImage.fetchUserImage(image: userProfilePicture, user: user!, photo: nil)

    }

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
