//
//  AuthServiceUploadComments.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-22.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class UploadPostCommentAPI {

    var commentsRef = Database.database().reference().child(AuthConfig.commentUrl)

    func sendCommentDataToDatabase(comment: String, uploaded: ((String?) -> Void)? = nil, onError: ((String?) -> Void)? = nil) {
        let newCommentId = commentsRef.childByAutoId().key
        let newCommentRef = commentsRef.child(newCommentId)
        guard let currentUser = Auth.auth().currentUser else { return }
        let currentUserId = currentUser.uid
        newCommentRef.setValue([FIRStrings.uid: currentUserId, FIRStrings.commentText: comment]) { (error, _) in
            if error != nil {
                onError!(error!.localizedDescription)
                return
            }
            uploaded!(newCommentId)
        }
    }

    func uploadPostComment(newCommentId: String, postId: String, uploaded: (() -> Void)? = nil, onError: ((String?) -> Void)? = nil) {
        let newRef = Database.database().reference()
        let postCommentRef = newRef.child(AuthConfig.postCommentUrl).child(postId).child(newCommentId)
        postCommentRef.setValue(true, withCompletionBlock: { (error, _) in
            if error != nil {
                onError!(error?.localizedDescription)
                return
            }
        })
    }
}
