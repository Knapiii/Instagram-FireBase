//
//  UsersViewController.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-26.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import UIKit

class SearchUsersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var users: [UserModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUsers()
        registerTableView()
    }

    func fetchUsers() {
        API.user.observeAllUsers { user in
            self.isFollowing(userId: user.id!, completed: { (value) in
                user.isFollowing = value
                self.users.append(user)
                self.tableView.reloadData()
            })
        }
    }

    func isFollowing(userId: String, completed: ((Bool) -> ())? = nil) {
        API.Follow.isFollowing(userId: userId, completed: completed)
    }
}
