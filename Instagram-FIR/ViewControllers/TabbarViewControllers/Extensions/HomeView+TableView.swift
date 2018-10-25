//
//  HomeView+TableView.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-20.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import Foundation

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NibName.HomeTableCell, for: indexPath) as! HomeTableViewCell
        let post = posts[indexPath.row]
        let user = users[indexPath.row]
        cell.caption!.text = post.caption
        cell.post = post
        cell.user = user
        cell.homeViewController = self
        return cell
    }
        
    func registerTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 390
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: NibName.HomeTableCell, bundle: nil), forCellReuseIdentifier: NibName.HomeTableCell)
        tableView.tableFooterView = UIView()
        tableView.allowsSelectionDuringEditing = true
    }
    
    
}
