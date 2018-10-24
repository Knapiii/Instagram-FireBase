
import Foundation
import UIKit
import Firebase

class AuthServiceLoadPost {
    
    static func loadPosts(completion: @escaping (Post) -> Void) {
        Database.database().reference().child(AuthConfig.postUrl).observe(.childAdded) { (snapshot) in
            if let dict = snapshot.value as? [String: Any] {
                let key = snapshot.key
                let newPost = Post.transformPostPhotoDict(dict: dict, key: key )
                completion(newPost)
            }
        }
    }
}
