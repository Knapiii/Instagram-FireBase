//
//  Sd_setImage.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-26.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import Foundation

class SdSetImage {

    static func fetchUserImage(image: UIImageView, user: User, photo: ((UIImageView) -> Void)? = nil) {
        if let photoUrlString = user.profileImageUrl {
            let photoUrl = URL(string: photoUrlString)
            image.sd_setImage(with: photoUrl)
            photo?(image)
        }
    }

    static func fetchPostImage(image: UIImageView, post: Post, photo: ((UIImageView) -> Void)? = nil) {
        if let photoUrlString = post.photoUrl {
            let photoUrl = URL(string: photoUrlString)
            image.sd_setImage(with: photoUrl)
            photo?(image)
        }
    }

}
