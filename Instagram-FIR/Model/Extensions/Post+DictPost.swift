//
//  Post+DictPost.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-19.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import Foundation
import Firebase

extension Post {
    
    static func transformPostPhotoDict(dict: [String: Any], key: String) -> Post{
        let post = Post()
        post.id = key
        post.caption = dict[FIRStrings.caption] as? String
        post.photoUrl = dict[FIRStrings.photoUrl] as? String
        post.uid = dict[FIRStrings.uid] as? String
        post.likeCount = dict[PostLikes.likesCount] as? Int
        post.likes = dict[PostLikes.likes] as? Dictionary<String, Any>
        if let currentUserId = Auth.auth().currentUser?.uid {
            if post.likes != nil {
                post.isLiked = post.likes![currentUserId] != nil
            }
        }
        return post
    }
    
    static func transformPostVideoDic(dict: [String: Any]) -> Post{
        let post = Post()
        
        post.caption = dict[FIRStrings.caption] as? String
        post.videoUrl = dict[FIRStrings.videoUrl] as? String
        post.uid = dict[FIRStrings.uid] as? String
        post.likeCount = dict[PostLikes.likesCount] as? Int
        post.likes = dict[PostLikes.likes] as? Dictionary<String, Any>
        if let currentUserId = Auth.auth().currentUser?.uid {
            if post.likes != nil {
                post.isLiked = post.likes![currentUserId] != nil
            }
        }
        return post
    }
    
}
