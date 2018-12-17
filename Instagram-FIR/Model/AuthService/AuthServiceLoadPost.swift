import Foundation
import UIKit
import Firebase

class LoadPostAPI {
    static var postRef = Database.database().reference().child(AuthConfig.postUrl)

    static func loadPosts(completion: @escaping (Post) -> Void) {
       self.postRef.child(AuthConfig.postUrl).observe(.childAdded) { (snapshot) in
            if let dict = snapshot.value as? [String: Any] {
                let key = snapshot.key
                let newPost = Post.transformPostPhotoDict(dict: dict, key: key )
                completion(newPost)
            }
        }
    }
}
