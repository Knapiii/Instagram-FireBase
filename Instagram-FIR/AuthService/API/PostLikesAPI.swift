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
    
    func observeLikes(postId: String, compilation: ((Post) -> ())? = nil) {
        API.LoadPost.refPost.child(postId).observe(.value) { snapshot in
            if let dict = snapshot.value as? [String: Any] {
                let key = snapshot.key
                let post = Post.transformPostPhotoDict(dict: dict, key: key)
                compilation!(post)
            }
        }
    }
    
    func observeLikeCount(postId: String, compilation: ((Int) -> ())? = nil) {
        API.LoadPost.refPost.child(postId).observe(.childChanged) { snapshot in
            if let value = snapshot.value as? Int {
                compilation!(value)
            }
        }
    }
}
