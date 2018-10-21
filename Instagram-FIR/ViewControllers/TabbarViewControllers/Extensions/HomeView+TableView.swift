//
//  HomeView+TableView.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-20.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import Foundation
import Firebase

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NibName.HomeTableCell, for: indexPath) as! HomeTableViewCell
        let post = posts[indexPath.row]
        cell.caption!.text = post.caption
        cell.post = post
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: false)
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
