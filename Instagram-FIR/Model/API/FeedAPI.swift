//
//  FeedAPI.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-12-17.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import Foundation
import Firebase

class FeedAPI {
    var refFeed = Database.database().reference().child(AuthConfig.feed)

    func observeFeed(withId id: String, completion: ((PostModel) -> ())? = nil) {
        refFeed.child(id).observe(.childAdded) { (snapshot) in
            let key = snapshot.key
            API.loadPost.observePostWithId(withId: key, completion: { (post) in
                completion!(post)
            })
        }
    }

    func observeFeedRemoved(withId id: String, completion: ((PostModel) -> ())? = nil) {
        refFeed.child(id).observe(.childRemoved, with: {
            snapshot in
            let key = snapshot.key
            API.loadPost.observePostWithId(withId: key, completion: { (post) in
                completion!(post)
            })
        })
    }
}
