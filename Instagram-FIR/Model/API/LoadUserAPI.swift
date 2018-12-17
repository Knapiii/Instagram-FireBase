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

    var refCurrentUser: DatabaseReference? {
        guard let currentUser = Auth.auth().currentUser else { return nil}
        return refUsers.child(currentUser.uid)
    }

    func observeUser(uid: String, completion: @escaping (User) -> Void) {
        refUsers.child(uid).observe(.value, with: {
            (snapshot) in
            if let dict = snapshot.value as? [String: Any] {
                let user = User.transformUserToDict(dict: dict)
                completion(user)
            }
        }, withCancel: nil)
    }

    func observeCurrentUser(completion: @escaping (User) -> Void) {
        guard let currentUser = Auth.auth().currentUser?.uid else { return }
        refUsers.child(currentUser).observe(.value, with: {
            (snapshot) in
            if let dict = snapshot.value as? [String: Any] {
                let user = User.transformUserToDict(dict: dict)
                completion(user)
            }
        }, withCancel: nil)
    }

    func observeAllUsers(completion: @escaping (User) -> Void) {
        refUsers.observe(.childAdded) { snapshot in
            if let dict = snapshot.value as? [String: Any] {
                let user = User.transformUserToDict(dict: dict)
                completion(user)
            }
        }
    }

}
