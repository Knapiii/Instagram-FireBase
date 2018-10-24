//
//  API.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-24.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import Foundation

class API {
    static var loadUserAPI = LoadUserAPI()
    static var loadPostAPI = LoadPostAPI()
    static var uploadPostAPI = UploadPostAPI()
    static var loadPostCommentAPI = LoadPostCommentAPI()
    static var uploadPostCommentAPI = UploadPostCommentAPI()
}
