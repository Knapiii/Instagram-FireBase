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
}
