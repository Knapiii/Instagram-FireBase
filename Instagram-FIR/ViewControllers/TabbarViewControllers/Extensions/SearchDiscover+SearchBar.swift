//
//  SearchDiscover+SearchBar.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-12-18.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import Foundation

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        doSearch()
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        doSearch()
    }

    func doSearch() {
        if let searchText = searchBar.text?.lowercased() {
            self.users.removeAll()
            self.tableView.reloadData()
            API.user.queryUser(withText: searchText) { (user) in
                self.isFollowing(userId: user.id!, completed: { (value) in
                    user.isFollowing = value
                    self.users.append(user)
                    self.tableView.reloadData()
                    print(self.users.count)
                })
            }
        }
    }

    func isFollowing(userId: String, completed: ((Bool) -> ())? = nil) {
        API.Follow.isFollowing(userId: userId, completed: completed)
    }

    func configSearchBar() {
        searchBar.delegate = self
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Search"
        searchBar.frame.size.width = view.frame.size.width - 60
        let searchItem = UIBarButtonItem(customView: searchBar)
        self.navigationItem.rightBarButtonItem = searchItem
    }

}
