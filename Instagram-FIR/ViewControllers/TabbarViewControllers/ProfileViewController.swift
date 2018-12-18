//
//  ProfileViewController.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-15.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var collectionView: UICollectionView!

    var user: UserModel!
    var posts: [PostModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        fetchUser()
        fetchMyPosts()
    }

    func fetchUser() {
        API.user.observeCurrentUser { (user) in
            self.user = user
            self.navigationBar.title = self.user.username
            self.collectionView.reloadData()
        }
    }

    func fetchMyPosts() {
        API.MyPost.loadMyPosts { snapshot in
            API.loadPost.observePostWithId(withId: snapshot.key, completion: { post in
                self.posts.append(post)
                self.collectionView.reloadData()
            })
        }
    }

    @IBAction func signOut(_ sender: Any) {
        AuthServiceSign.signOut(currentVC: self)
    }

}
