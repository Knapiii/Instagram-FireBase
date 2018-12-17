//
//  LikesAPI.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-24.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import Foundation
import Firebase

class PostLikesAPI {

    func observeLikes(postId: String, completion: ((Post) -> Void)? = nil) {
        API.loadPost.refPost.child(postId).observe(.value) { snapshot in
            if let dict = snapshot.value as? [String: Any] {
                let key = snapshot.key
                let post = Post.transformPostToDict(dict: dict, key: key)
                completion!(post)
            }
        }
    }

    func observeLikeCount(postId: String, compilation: ((Int) -> Void)? = nil) {
        API.loadPost.refPost.child(postId).observe(.childChanged) { snapshot in
            if let value = snapshot.value as? Int {
                compilation!(value)
            }
        }
    }

    func inrementLikes(postId: String, completion: ((Post?) -> Void)? = nil, onError: ((String?) -> Void)? = nil) {
        let postRef = API.loadPost.refPost.child(postId)
        postRef.runTransactionBlock({ (currentData: MutableData) -> TransactionResult in
            if var post = currentData.value as? [String: AnyObject], let uid = Auth.auth().currentUser?.uid {
                var likes: Dictionary<String, Bool>
                likes = post[PostLikes.likes] as? [String: Bool] ?? [:]
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
        }) { (error, _, snapshot) in
            if let error = error {
                onError!(error.localizedDescription)
            }
            if let dict = snapshot?.value as? [String: Any] {
                let key = snapshot!.key
                let post = Post.transformPostToDict(dict: dict, key: key)
                completion!(post)
            }
        }
    }
}
