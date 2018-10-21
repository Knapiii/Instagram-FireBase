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

class AuthServiceLoadUser {
    
    static func loadUser(uid: String, completion: @escaping (User) -> Void) {
        Database.database().reference().child(AuthConfig.userUrl).child(uid).observe(.value, with: {
            (snapshot) in
            if let dict = snapshot.value as? [String: Any] {
                let user = User.transformUserDict(dict: dict)
                completion(user)
            }
        }, withCancel: nil)
    }
    
}
