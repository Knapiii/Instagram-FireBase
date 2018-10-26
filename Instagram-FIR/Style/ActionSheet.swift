//
//  ActionSheet.swift
//  ShapeUp
//
//  Created by Kristoffer Knape on 2018-10-03.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import Foundation
import UIKit

class Alert{
    
    static func actionSheet(title: String?, msg: String?){
        let actionSheet = UIAlertController(title: title ?? nil, message: msg ?? nil, preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        actionSheet.addAction(cancel)
        UIApplication.topViewController()?.present(actionSheet, animated: true, completion: nil)
        
    }
    
    static func actionAlert(title: String?, msg: String?){
        let alert = UIAlertController(title: title ?? nil, message: msg ?? nil,
            preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(cancel)
        UIApplication.topViewController()?.present(alert, animated: true, completion: nil)
    }
}
