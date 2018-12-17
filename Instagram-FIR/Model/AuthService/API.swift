//
//  API.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-24.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import Foundation

class API {
    static var user = LoadUserAPI()
    static var loadPost = LoadPostAPI()
    static var UploadPost = UploadPostAPI()
    static var LoadPostComment = LoadPostCommentAPI()
    static var UploadPostComment = UploadPostCommentAPI()
    static var PostLikes = PostLikesAPI()
    static var MyPost = UserPostAPI()
}
