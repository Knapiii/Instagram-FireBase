
import Foundation
import UIKit
import Firebase

class LoadPostAPI {
    
    var refPost = Database.database().reference().child(AuthConfig.postUrl)
    
    func loadPosts(completion: @escaping (Post) -> Void) {
        refPost.observe(.childAdded) { (snapshot) in
            if let dict = snapshot.value as? [String: Any] {
                let key = snapshot.key
                let newPost = Post.transformPostPhotoDict(dict: dict, key: key )
                completion(newPost)
            }
        }
    }
}
