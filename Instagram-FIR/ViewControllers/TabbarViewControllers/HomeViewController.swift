//
//  HomeViewController.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-15.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import UIKit
import SDWebImage

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    var posts = [Post]()
    var users = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableView()
        loadPosts()
    }

    func loadPosts() {
        activityIndicator.startAnimating()
        API.loadPost.observePost { (post) in
            guard let postId = post.uid else { return }
            self.fetchUser(uid: postId, completion: {
                self.posts.append(post)
                self.activityIndicator.stopAnimating()
                self.tableView.reloadData()
            })
        }
    }

    func fetchUser(uid: String, completion: (() -> Void)? = nil) {
        API.user.observeUser(uid: uid) { (user) in
            self.users.append(user)
            completion!()
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Identifier.CommentCellIdentifier {
            let commentVC = segue.destination as! CommentViewController
            let postId = sender as! String
            commentVC.postId = postId
        }
    }
}
