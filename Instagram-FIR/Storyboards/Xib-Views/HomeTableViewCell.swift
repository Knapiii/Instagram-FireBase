//
//  HomeTableViewCell.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-19.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import UIKit
import Firebase

@IBDesignable
class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var userProfilePicture: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var likesUIImage: UIImageView!
    @IBOutlet weak var commentsUIImage: UIImageView!
    @IBOutlet weak var shareUIImage: UIImageView!
    @IBOutlet weak var amountOfLikesButton: UIButton!
    @IBOutlet weak var caption: UILabel!

    var homeViewController: HomeViewController?
    var postRef: DatabaseReference!

    var post: PostModel? {
        didSet {
            fetchPostInformation()
        }
    }

    var user: UserModel? {
        didSet {
            fetchUserInformation()
        }
    }

    func fetchPostInformation() {
        caption!.text = post?.caption
        if let photoUrlString = post?.photoUrl {
            let photoUrl = URL(string: photoUrlString)
            postImage.sd_setImage(with: photoUrl)
        }
        self.updateLike(post: self.post!)
    }

    func fetchUserInformation() {
        userName.text = user!.username
        SdSetImage.fetchUserImage(image: userProfilePicture, user: user!, photo: nil)

    }

    override func awakeFromNib() {
        super.awakeFromNib()
        AppStyle.roundedCornersImageView(image: userProfilePicture)
        tapComment_TouchUp()
        tapLike_TouchUp()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        userProfilePicture.image = UIImage(named: ImageName.placeholderProfileImage)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    func tapComment_TouchUp() {
        commentsUIImage.addTapGestureRecognizer {
            if let postId = self.post?.id {
                self.homeViewController?.performSegue(withIdentifier: Identifier.CommentCellIdentifier, sender: postId)
            }
        }
    }
}
