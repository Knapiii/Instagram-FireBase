//
//  ProfileViewController.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-15.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signOut(_ sender: Any) {
        AuthServiceSign.signOut(currentVC: self)
    }
    
}
