//
//  CommentViewController.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-22.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var userProfilePicture: UIImageView!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var commentButtonConstraint: NSLayoutConstraint!
    
    var postId: String!
    var comments = [Comment]()
    var users = [User]()
    
    var loadPostAPI = LoadPostAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableView()
        loadComments()
        writeCommentInit()
        title = Titles.Comment
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    @IBAction func sendComment_TouchUp(_ sender: Any) {
        sendNewComment()
    }
    
    func fetchUser(uid: String, completion: (() -> Void)? = nil){
        API.loadUserAPI.loadUsers(uid: uid) { (user) in
            self.users.append(user)
            completion!()
        }
    }

    func loadComments() {
        API.loadPostCommentAPI.loadComment(postId: postId) { (comment) in
            self.fetchUser(uid: comment.uid!, completion: {
                self.comments.append(comment)
                self.tableView.reloadData()
            })
        }
    }

}

