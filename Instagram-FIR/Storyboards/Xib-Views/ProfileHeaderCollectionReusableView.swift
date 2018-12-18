//
//  HeaderProfileCollectionReusableView.swift
//  InstagramClone
//
//  Created by The Zero2Launch Team on 1/15/17.
//  Copyright © 2017 The Zero2Launch Team. All rights reserved.
//

import UIKit
class ProfileHeaderCollectionReusableView: UICollectionReusableView {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var myPostsCountLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!
    @IBOutlet weak var followersCountLabel: UILabel!

    var user: UserModel? {
        didSet {
            updateView()
        }
    }

    func updateView() {
        self.nameLabel.text = user!.username
        SdSetImage.fetchUserImage(image: profileImage, user: user!) { _ in
            AppStyle.roundedCornersImageView(image: self.profileImage)
        }
    }
}
