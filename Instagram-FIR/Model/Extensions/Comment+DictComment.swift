//
//  Comment+DictComment.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-23.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import Foundation

extension Comment {
    static func transforCommentDict(dict: [String: Any]) -> Comment {
        let comment = Comment()

        comment.commentText = dict[FIRStrings.commentText] as? String
        comment.uid = dict[FIRStrings.uid] as? String
        return comment
    }

}
