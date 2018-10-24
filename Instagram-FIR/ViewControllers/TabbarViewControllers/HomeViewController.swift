//
//  HomeViewController.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-15.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var posts = [Post]()
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        API.loadUserAPI.loadCurrentUser { (user) in
            print(user.username!)
        }
        registerTableView()
        loadPosts()
    }
    
    func loadPosts() {
        activityIndicator.startAnimating()
        API.loadPostAPI.loadPosts { (post) in
            guard let postId = post.uid else { return }
            self.fetchUser(uid: postId, completion: {
                print("inne i fetch user")
                self.posts.append(post)
                self.activityIndicator.stopAnimating()
                self.tableView.reloadData()
            })
        }
    }
    
    func fetchUser(uid: String, completion: (() -> Void)? = nil){
        API.loadUserAPI.loadUsers(uid: uid) { (user) in
            self.users.append(user)
            completion!()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Identifier.CommentIdentifier {
            let commentVC = segue.destination as! CommentViewController
            let postId = sender as! String
            commentVC.postId = postId
        }
    }
}
