//
//  PhotoCollectionViewCell.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-25.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var photo: UIImageView!

    var post: PostModel? {
        didSet {
            fetchPostInformation()
        }
    }

    func fetchPostInformation() {
        SdSetImage.fetchPostImage(image: photo, post: post!)
    }
}
