//
//  HomeTableViewCell+Likes.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-24.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import Foundation

extension HomeTableViewCell {

    func tapLike_TouchUp() {
        likesUIImage.addTapGestureRecognizer {
            API.PostLikes.inrementLikes(postId: self.post!.id!, completion: { post in
               self.updateLike(post: post!)
                self.post?.likes = post?.likes
                self.post?.isLiked = post?.isLiked
                self.post?.likeCount = post?.likeCount

            }, onError: { error in
                ProgressHUD.showError(error)
            })
        }
    }

    func updateLike(post: PostModel) {
        let imageName = post.likes == nil || !post.isLiked! ? ImageName.like : ImageName.likeSelected
        likesUIImage.image = UIImage(named: imageName)
        guard let count = post.likeCount else { return }
        if count > 1 {
            amountOfLikesButton.setTitle("\(count) likes", for: .normal)
        } else if count == 1 {
            amountOfLikesButton.setTitle("\(count) like", for: .normal)
        } else {
            amountOfLikesButton.setTitle("Be the first to like", for: .normal)

        }
    }
}
