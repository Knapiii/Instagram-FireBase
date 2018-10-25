//
//  AuthServiceLoadUser.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-21.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class LoadUserAPI {
    
    var refUsers = Database.database().reference().child(AuthConfig.userUrl)
    
    func observeUser(uid: String, completion: @escaping (User) -> Void) {
        refUsers.child(uid).observe(.value, with: {
            (snapshot) in
            if let dict = snapshot.value as? [String: Any] {
                let user = User.transformUserDict(dict: dict)
                completion(user)
            }
        }, withCancel: nil)
    }
    
    func observeCurrentUser(completion: @escaping (User) -> ()) {
        guard let currentUser = Auth.auth().currentUser?.uid else { return }
        refUsers.child(currentUser).observe(.value, with: {
            (snapshot) in
            if let dict = snapshot.value as? [String: Any] {
                let user = User.transformUserDict(dict: dict)
                completion(user)
            }
        }, withCancel: nil)
    }
    
    var refCurrentUser: DatabaseReference? {
        guard let currentUser = Auth.auth().currentUser else { return nil}
        return refUsers.child(currentUser.uid)
    }

}

