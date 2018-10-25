//
//  ProfileView+CollectionViewDataSource.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-25.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import Foundation

extension ProfileViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier.PhotoCellIdentifier, for: indexPath) as! PhotoCollectionViewCell
        let post = posts[indexPath.row]
        cell.post = post
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerViewCell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Identifier.ProfileHeaderCollectionIdentifier, for: indexPath) as! ProfileHeaderCollectionReusableView
        if let user = self.user {
            headerViewCell.user = user
            headerViewCell.amountOfPostsLabel.text = "\(posts.count)"
        }
        return headerViewCell
    }
    
}
