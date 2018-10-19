
import Foundation
import UIKit
import Firebase

class AuthServiceLoadPost {
    
   static func loadPosts(completion: @escaping (Post?) -> Void) {
        Database.database().reference().child(AuthConfig.postUrl).observe(.childAdded) { (snapshot) in
            if let dict = snapshot.value as? [String: Any] {
                let newPost = Post.transformPostPhotoDict(dict: dict)
                completion(newPost)
            }
        }
    }
}


