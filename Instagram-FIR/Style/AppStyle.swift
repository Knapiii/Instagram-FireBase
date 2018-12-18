//
//  AppStyle.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-16.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import Foundation

import UIKit

class AppStyle {
    static let inAppButtonColor = UIColor.inAppButtonColor
    static let signInButtonColor = UIColor.signInButtonColor
    static let buttonEnabled = UIColor.buttonEnabled
    static let buttonDisabled = UIColor.buttonDisabled

    static func roundedCornersImageView(image: UIImageView) {
        image.layer.cornerRadius = image.frame.size.width/2
        image.clipsToBounds = true
    }

    static func unFollowUser(button: UIButton){
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 226/255, green: 228/255, blue: 232/255, alpha: 1).cgColor
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.backgroundColor = UIColor(red: 38/255, green: 214/255, blue: 0/255, alpha: 0.8)
        button.setTitleColor(UIColor.white, for: .normal)
        //38  214  0
    }

    static func followUser(button: UIButton){
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 226/255, green: 228/255, blue: 232/255, alpha: 1).cgColor
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.backgroundColor = UIColor(red: 69/255, green: 142/255, blue: 255/255, alpha: 1)
        button.setTitleColor(UIColor.white, for: .normal)
    }
}
