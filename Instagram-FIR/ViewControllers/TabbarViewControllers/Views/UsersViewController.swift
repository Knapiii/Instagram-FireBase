//
//  UsersViewController.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-26.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var users: [User] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUsers()
        registerTableView()
    }

    func fetchUsers() {
        API.user.observeAllUsers { user in
            self.users.append(user)
            self.tableView.reloadData()
        }
    }
}

extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NibName.UsersTableCell, for: indexPath) as! UsersTableViewCell
        let user = users[indexPath.row]
        cell.user = user
        return cell
    }

    func registerTableView() {
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: NibName.UsersTableCell, bundle: nil), forCellReuseIdentifier: NibName.UsersTableCell)
        tableView.tableFooterView = UIView()
        tableView.allowsSelectionDuringEditing = true
    }
}
