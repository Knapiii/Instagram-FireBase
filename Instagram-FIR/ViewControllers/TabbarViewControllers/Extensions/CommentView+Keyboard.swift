//
//  CommentView+CommentField.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-23.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import Foundation
import UIKit

extension CommentViewController {
    
    func commentFollowKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func moveCommentField(notification: Notification, completion: @escaping (CGRect?)->()) {
        let infoKey = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey]
        let keyboardFrame = (infoKey as AnyObject).cgRectValue
        completion(keyboardFrame)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        moveCommentField(notification: notification) { (frame) in
            UIView.animate(withDuration: 0.3) {
                self.commentButtonConstraint.constant = -(frame!.height)
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification){
        UIView.animate(withDuration: 0.3) {
            self.commentButtonConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
    }    
}
