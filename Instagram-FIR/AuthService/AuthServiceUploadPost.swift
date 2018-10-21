//
//  AuthServiceUpload.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-18.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class AuthServiceUploadPost {
    
    static func uploadPhoto(caption: String, imageData: Data, uploaded: (() -> Void)? = nil, onError: ((String?) -> Void)? = nil) {
        
        let photoString = UUID().uuidString
        let storageRef = Storage.storage().reference(forURL: AuthConfig.StorageUrl).child(AuthConfig.postUrl).child(photoString)
        storageRef.putData(imageData, metadata: nil) { (metadata, error) in
            if error != nil {
                onError!(error!.localizedDescription)
                return
            }
            let photoUrl = metadata?.downloadURL()?.absoluteString
            self.sendPostDataToDatabase(photoUrl: photoUrl!, caption: caption, uploaded: {
                uploaded!()
            })
        }
    }
    
    static func sendPostDataToDatabase(photoUrl: String, caption: String, uploaded: (() -> Void)? = nil, onError: ((String?) -> Void)? = nil) {
        let ref = Database.database().reference(fromURL: AuthConfig.FIRUrl)
        let postsReference = ref.child(AuthConfig.postUrl)
        let newPostId = postsReference.childByAutoId().key
        let newPostReference = postsReference.child(newPostId)
        guard let currentUser = Auth.auth().currentUser else {
            return
        }
        let currentUserId = currentUser.uid
        newPostReference.setValue([FIRStrings.uid: currentUserId,
                                   FIRStrings.photoUrl: photoUrl,
                                   FIRStrings.caption: caption],
                                  withCompletionBlock: {
            (error, ref) in
            if error != nil {
                return
            }
            uploaded!()
        })
    }
}
