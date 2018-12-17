//
//  UITextFielsd+Count.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-16.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {

    var count: Int {
        return self.text?.count ?? 0
    }
}
