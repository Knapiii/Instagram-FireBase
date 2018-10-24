//
//  AuthServiceLoadComment.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-23.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class AuthServiceLoadComment {
    
    static func loadComment(postId: String, loaded: @escaping (Comment) -> Void) {
        
        let ref = Database.database().reference()
        let postCommentRef = ref.child(AuthConfig.postCommentUrl).child(postId)
        postCommentRef.observe(.childAdded) { snapshot in
            let newRef = ref.child(AuthConfig.commentUrl).child(snapshot.key)
            newRef.observe(.value, with: { snapshotComment in
                let value = snapshotComment.value
                if let dict = value as? [String: Any] {
                    let comment = Comment.transforCommentDict(dict: dict)
                    loaded(comment)
                }
            }, withCancel: nil)
        }
    }

    
}
