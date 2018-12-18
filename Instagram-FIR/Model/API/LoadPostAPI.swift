import Foundation
import UIKit
import Firebase

class LoadPostAPI {

    var refPost = Database.database().reference().child(AuthConfig.postUrl)

    func observePost(completion: @escaping (PostModel) -> Void) {
        refPost.observe(.childAdded) { (snapshot) in
            if let dict = snapshot.value as? [String: Any] {
                let key = snapshot.key
                let newPost = PostModel.transformPostToDict(dict: dict, key: key )
                completion(newPost)
            }
        }
    }

    func observePostWithId(withId id: String, completion: @escaping (PostModel) -> Void) {
        refPost.child(id).observeSingleEvent(of: .value) { snapshot in
            if let dict = snapshot.value as? [String: Any] {
                let key = snapshot.key
                let post = PostModel.transformPostToDict(dict: dict, key: key )
                completion(post)
            }
        }
    }

}
