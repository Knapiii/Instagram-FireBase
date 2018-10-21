//
//  Post+DictPost.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-19.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import Foundation

extension Post {
    static func transformPostPhotoDict(dict: [String: Any]) -> Post{
        let post = Post()
        
        post.caption = dict[FIRStrings.caption] as? String
        post.photoUrl = dict[FIRStrings.photoUrl] as? String
        post.uid = dict[FIRStrings.uid] as? String
        return post
    }
    
    static func transformPostVideoDic(dict: [String: Any]) -> Post{
        let post = Post()
        
        post.caption = dict[FIRStrings.caption] as? String
        post.videoUrl = dict[FIRStrings.videoUrl] as? String
        post.uid = dict[FIRStrings.uid] as? String
        return post
    }
    
}
