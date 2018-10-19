//
//  HomeViewController.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-15.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Currently logged in as: \(Auth.auth().currentUser?.email as Any)")
        // Do any additional setup after loading the view.
    }
}
