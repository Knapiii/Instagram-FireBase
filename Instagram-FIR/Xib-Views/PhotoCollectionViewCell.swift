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
    
    var post: Post? {
        didSet {
            fetchPostInformation()
        }
    }
    
    func fetchPostInformation() {
        if let photoUrlString = post?.photoUrl {
            let photoUrl = URL(string: photoUrlString)
            photo.sd_setImage(with: photoUrl)
        }
    }
    
    
}
