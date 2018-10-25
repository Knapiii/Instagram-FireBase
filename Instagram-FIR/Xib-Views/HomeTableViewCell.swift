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
    
    var post: Post? {
        didSet {
            fetchPostInformation()
        }
    }
    
    var user: User? {
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
        API.PostLikes.observeLikes(postId: post!.id!) { (post) in
            self.updateLike(post: post)
        }
        
        API.LoadPost.observePost(withId: post!.id!) { post in
            self.updateLike(post: post)
        }
        
        API.PostLikes.observeLikeCount(postId: post!.id!) { (value) in
            self.amountOfLikesButton.setTitle("\(value) likes", for: .normal)
        }
    }

    func fetchUserInformation() {
        userName.text = user!.username
        if let photoUrlString = user!.profileImageUrl{
            let photoUrl = URL(string: photoUrlString)
            userProfilePicture.sd_setImage(with: photoUrl)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
                self.homeViewController?.performSegue(withIdentifier: Identifier.CommentIdentifier, sender: postId)
            }
        }
    }
}
