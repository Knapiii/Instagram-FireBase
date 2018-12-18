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

    var user: UserModel? {
        didSet {
            updateView()
            updateFollowButton()
        }
    }

    func updateView() {
        userName.text = user?.username
        SdSetImage.fetchUserImage(image: userProfilePicture, user: user!, photo: nil)
    }

    func updateFollowButton() {
        API.Follow.isFollowing(userId: user!.id!) { (value) in
            if value == true{
               self.configureUnfollowButton()
            } else {
                self.configureFollowButton()
            }
        }
    }

    func configureFollowButton() {
        self.followButton.setTitle("Follow", for: .normal)
        AppStyle.followUser(button: followButton)
        followButton.addTarget(self, action: #selector(self.followAction), for: UIControl.Event.touchUpInside)
    }

    func configureUnfollowButton() {
        self.followButton.setTitle("Following", for: .normal)
        AppStyle.unFollowUser(button: followButton)
        followButton.addTarget(self, action: #selector(self.unFollowAction), for: UIControl.Event.touchUpInside)
    }

    @objc func followAction() {
        if user!.isFollowing! == false {
            API.Follow.followAction(withUser: user!.id!)
            configureUnfollowButton()
            user!.isFollowing! = true
        }
    }

    @objc func unFollowAction() {
        if user!.isFollowing! == true {
            API.Follow.unFollowAction(withUser: user!.id!)
            configureFollowButton()
            user!.isFollowing! = false
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        AppStyle.roundedCornersImageView(image: userProfilePicture)
    }
}
