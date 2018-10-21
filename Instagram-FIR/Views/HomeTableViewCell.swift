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
    @IBOutlet weak var amountOfLikes: UIButton!
    @IBOutlet weak var caption: UILabel!

    
    var post: Post? {
        didSet {
            updatePostView()
        }
    }
    
    func updatePostView() {
        fetchPostInformation()
        fetchUserInformation()
    }
    
    func fetchPostInformation() {
        caption!.text = post?.caption
        if let photoUrlString = post?.photoUrl {
            let photoUrl = URL(string: photoUrlString)
            postImage.sd_setImage(with: photoUrl)
        }
    }
    
    func fetchUserInformation() {
        if let uid = post?.uid {
            AuthServiceLoadUser.loadUser(uid: uid) { (user) in
                self.userName.text = user.username
                if let photoUrlString = user.profileImageUrl{
                    let photoUrl = URL(string: photoUrlString)
                    self.userProfilePicture.sd_setImage(with: photoUrl)
                }
            }
        }
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
