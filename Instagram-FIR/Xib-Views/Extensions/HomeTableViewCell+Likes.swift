//
//  HomeTableViewCell+Likes.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-24.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import Foundation
import Firebase

extension HomeTableViewCell {
    
    func tapLike_TouchUp() {
        likesUIImage.addTapGestureRecognizer {
            self.postRef = API.LoadPost.refPost.child(self.post!.id!)
            self.incrementLikes(forRef: self.postRef)
        }
    }
    
    func updateLike(post: Post) {
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
    
    func incrementLikes(forRef ref: DatabaseReference) {
        ref.runTransactionBlock({ (currentData: MutableData) -> TransactionResult in
            if var post = currentData.value as? [String : AnyObject], let uid = Auth.auth().currentUser?.uid {
                var likes: Dictionary<String, Bool>
                likes = post[PostLikes.likes] as? [String : Bool] ?? [:]
                var likesCount = post[PostLikes.likesCount] as? Int ?? 0
                if let _ = likes[uid] {
                    likesCount -= 1
                    likes.removeValue(forKey: uid)
                } else {
                    likesCount += 1
                    likes[uid] = true
                }
                post[PostLikes.likesCount] = likesCount as AnyObject?
                post[PostLikes.likes] = likes as AnyObject?
                
                currentData.value = post
                
                return TransactionResult.success(withValue: currentData)
            }
            return TransactionResult.success(withValue: currentData)
        }) { (error, committed, snapshot) in
            if let error = error {
                print(error.localizedDescription)
            }
            if let dict = snapshot?.value as? [String: Any] {
                let key = snapshot!.key
                let post = Post.transformPostPhotoDict(dict: dict, key: key)
                self.updateLike(post: post)
            }
        }
    }
    
}
