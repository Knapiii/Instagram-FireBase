//
//  CommentViewController.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-22.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController {

    @IBOutlet weak var writeCommentField: WriteComment!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var commentButtonConstraint: NSLayoutConstraint!
    
    var postId: String!
    var comments = [Comment]()
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        writeCommentField.awakeFromNib()
        registerTableView()
        loadComments()
        commentFollowKeyboard()
        self.hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func loadComments() {
        AuthServiceLoadComment.loadComment(postId: postId) { (comment) in
            self.fetchUser(uid: comment.uid!, completion: {
                self.comments.append(comment)
                self.tableView.reloadData()
                print("POST ID: \(self.postId)")
            })
        }
    }
    
    func fetchUser(uid: String, completion: (() -> Void)? = nil){
        AuthServiceLoadUser.loadUser(uid: uid) { (user) in
            self.users.append(user)
            completion!()
        }
    }
}

