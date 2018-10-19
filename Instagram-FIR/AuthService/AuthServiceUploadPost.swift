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
    
    static func uploadPhoto(text: String, imageData: Data, uploaded: (() -> Void)? = nil, onError: ((String?) -> Void)? = nil) {
        
        let photoString = UUID().uuidString
        let storageRef = Storage.storage().reference(forURL: AuthConfig.StorageUrl).child(AuthConfig.uploadPhotoUrl).child(photoString)
        storageRef.putData(imageData, metadata: nil) { (metadata, error) in
            if error != nil {
                onError!(error!.localizedDescription)
                return
            }
            let photoUrl = metadata?.downloadURL()?.absoluteString
            self.sendPostDataToDatabase(photoUrl: photoUrl!, text: text, uploaded: {
                uploaded!()
            })
        }
    }
    
    static func sendPostDataToDatabase(photoUrl: String, text: String, uploaded: (() -> Void)? = nil, onError: ((String?) -> Void)? = nil) {
        let ref = Database.database().reference(fromURL: AuthConfig.FIRUrl)
        let postsReference = ref.child(AuthConfig.uploadPhotoUrl)
        let newPostId = postsReference.childByAutoId().key
        let newPostReference = postsReference.child(newPostId)
        newPostReference.setValue(["photoUrl": photoUrl, "caption": text], withCompletionBlock: {
            (error, ref) in
            if error != nil {
                return
            }
            uploaded!()
        })
    }
}


