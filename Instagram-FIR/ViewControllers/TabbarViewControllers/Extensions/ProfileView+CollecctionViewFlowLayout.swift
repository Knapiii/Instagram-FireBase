//
//  ProfileView+CollecctionViewFlowLayout.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-25.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import Foundation

extension ProfileViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: collectionView.frame.size.width/3 - 1,
            height: collectionView.frame.size.width/3 - 1
        )
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}
