//
//  SearchDiscover+TableView.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-12-18.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import Foundation


extension SearchViewController: UITableViewDataSource {
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
