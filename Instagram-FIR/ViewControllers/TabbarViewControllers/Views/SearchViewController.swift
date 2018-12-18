//
//  SearchViewController.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-12-18.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet var tableView: UITableView!

    var users: [UserModel] = []

    var searchBar = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableView()
        configSearchBar()
        doSearch()
    }
    
}
