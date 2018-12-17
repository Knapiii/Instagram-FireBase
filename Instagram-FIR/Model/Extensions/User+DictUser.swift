//
//  User+DictUser.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-21.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import Foundation

extension User {
    static func transformUserToDict(dict: [String: Any]) -> User {
        let user = User()

        user.username = dict[FIRStrings.username] as? String
        user.email = dict[FIRStrings.email] as? String
        user.profileImageUrl = dict[FIRStrings.profileImageUrl] as? String
        return user
    }
}
