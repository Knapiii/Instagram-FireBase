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

//    var refCurrentUser: DatabaseReference? {
//        guard let currentUser = Auth.auth().currentUser else { return nil}
//        return refUsers.child(currentUser.uid)
//    }

    func observeUser(uid: String, completion: @escaping (UserModel) -> Void) {
        refUsers.child(uid).observe(.value, with: {
            (snapshot) in
            if let dict = snapshot.value as? [String: Any] {
                let user = UserModel.transformUserToDict(dict: dict, key: snapshot.key)
                completion(user)
            }
        }, withCancel: nil)
    }

    func observeCurrentUser(completion: @escaping (UserModel) -> Void) {
        guard let currentUser = Auth.auth().currentUser?.uid else { return }
        refUsers.child(currentUser).observe(.value, with: {
            (snapshot) in
            if let dict = snapshot.value as? [String: Any] {
                let user = UserModel.transformUserToDict(dict: dict, key: snapshot.key)
                completion(user)
            }
        }, withCancel: nil)
    }

    func observeAllUsers(completion: @escaping (UserModel) -> Void) {
        refUsers.observe(.childAdded) { snapshot in
            if let dict = snapshot.value as? [String: Any] {
                let user = UserModel.transformUserToDict(dict: dict, key: snapshot.key)
                if user.id! != API.user.currentUser?.uid {
                    completion(user)
                }
            }
        }
    }

    func queryUser(withText text: String, completion: @escaping (UserModel) -> Void) {
        refUsers.queryOrdered(byChild: FIRStrings.usernameLowerCase).queryStarting(atValue: text).queryEnding(atValue: text+"\u{f8ff}").queryLimited(toLast: 10).observeSingleEvent(of: .value) { (snapshot) in
            snapshot.children.forEach({ (s) in
                let child = s as! DataSnapshot
                if let dict = child.value as? [String: Any] {
                    let user = UserModel.transformUserToDict(dict: dict, key: snapshot.key)
                    completion(user)
                }
            })
        }
    }

    var currentUser: User? {
        if let currentUser = Auth.auth().currentUser {
            return currentUser
        }
        return nil
    }

    var refCurrentUser: DatabaseReference? {
        guard let currentUser = Auth.auth().currentUser else {
            return nil
        }
        return refUsers.child(currentUser.uid)
    }

}
