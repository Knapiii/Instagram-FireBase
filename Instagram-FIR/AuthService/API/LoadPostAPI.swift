
import Foundation
import UIKit
import Firebase

class LoadPostAPI {
    
    var refPost = Database.database().reference().child(AuthConfig.postUrl)
    
    func observePost(completion: @escaping (Post) -> Void) {
        refPost.observe(.childAdded) { (snapshot) in
            if let dict = snapshot.value as? [String: Any] {
                let key = snapshot.key
                let newPost = Post.transformPostPhotoDict(dict: dict, key: key )
                completion(newPost)
            }
        }
    }
    
    func observePost(withId id: String, completion: @escaping (Post) -> Void) {
        refPost.child(id).observeSingleEvent(of: .value) { snapshot in
            if let dict = snapshot.value as? [String: Any] {
                let key = snapshot.key
                let post = Post.transformPostPhotoDict(dict: dict, key: key )
                completion(post)
            }
        }
    }
    
    func inrementLikes(forRef ref: DatabaseReference, completion: ((Post?) -> Void)? = nil, onError: ((String?) -> Void)? = nil) {
        ref.runTransactionBlock({ (currentData: MutableData) -> TransactionResult in
            if var post = currentData.value as? [String : AnyObject], let uid = Auth.auth().currentUser?.uid{
                var likes: Dictionary<String, Bool>
                likes = post[PostLikes.likes] as? [String : Bool] ?? [:]
                var likesCount = post[PostLikes.likesCount] as? Int ?? 0
                if let _ = likes[uid] {
                    likesCount -= 1
                    likes.removeValue(forKey: uid)
                } else {
                    likesCount += 1
                    likes[uid] = true
                }
                post[PostLikes.likesCount] = likesCount as AnyObject?
                post[PostLikes.likes] = likes as AnyObject?
                
                currentData.value = post
                
                return TransactionResult.success(withValue: currentData)
            }
            return TransactionResult.success(withValue: currentData)
        }) { (error, committed, snapshot) in
            if let error = error {
                onError!(error.localizedDescription)
            }
            if let dict = snapshot?.value as? [String: Any] {
                let key = snapshot!.key
                let post = Post.transformPostPhotoDict(dict: dict, key: key)
                completion!(post)
            }
        }
    }
}
