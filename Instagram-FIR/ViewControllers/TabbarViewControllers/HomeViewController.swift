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
    @IBOutlet weak var tableViewCell: HomeTableViewCell!
    
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Currently logged in as: \(Auth.auth().currentUser?.email as Any)")
        registerTableView()
        loadPost()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func loadPost() {
        AuthServiceLoadPost.loadPosts { (post) in
            self.posts.append(post)
            print(self.posts)
            self.tableView.reloadData()
        }
    }
}
