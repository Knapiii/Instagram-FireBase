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

class LoadPostCommentAPI {
    
    var commentRef = Database.database().reference().child(AuthConfig.commentUrl)
    var postCommentRef = Database.database().reference().child(AuthConfig.postCommentUrl)
    
    func loadComment(postId: String, loaded: @escaping (Comment) -> Void) {
        
        let postCommentRefId = postCommentRef.child(postId)
        
        postCommentRefId.observe(.childAdded) { snapshot in
            let newRef = self.commentRef.child(snapshot.key)
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
