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
    
    func writeCommentInit() {
        handleTextField()
        setUserProfilePicture()
        followKeyboard()
    }
    
    func sendNewComment() {
        API.UploadPostComment.sendCommentDataToDatabase(comment: commentTextField.text!, uploaded: {
            commentId in
            API.UploadPostComment.uploadPostComment(newCommentId: commentId!, postId: self.postId, uploaded: {
                self.emptyText()
            }, onError: { error in
                ProgressHUD.showError(error)
            })
        }) { error in
            ProgressHUD.showError(error)
        }
    }

    func handleTextField() {
        commentTextField.addTarget(self, action: #selector(self.textFieldDidChange), for: UIControl.Event.editingChanged)
    }
    
    @objc func textFieldDidChange() {
        if let commentText = commentTextField.text, !commentText.isEmpty {
            sendButton.setTitleColor(UIColor.buttonEnabled, for: .normal)
            sendButton.isEnabled = true
            return
        } else {
            sendButton.setTitleColor(UIColor.buttonDisabled, for: .normal)
            sendButton.isEnabled = false
        }
    }
    
    func setUserProfilePicture() {
        API.User.observeCurrentUser { (user) in
            let user = user
            if let photoUrlString = user.profileImageUrl{
                let photoUrl = URL(string: photoUrlString)
                self.userProfilePicture.sd_setImage(with: photoUrl)
                AppStyle.roundedCornersImageView(image: self.userProfilePicture)
            }
        }
    }
    
    func emptyText() {
        self.commentTextField.text = ""
        self.sendButton.isEnabled = false
        self.sendButton.setTitleColor(UIColor.buttonDisabled, for: .normal)
        self.commentTextField.resignFirstResponder()
    }
    
    func followKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func moveCommentField(notification: Notification, completion: @escaping (CGRect?)->()) {
        let infoKey = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey]
        let keyboardFrame = (infoKey as AnyObject).cgRectValue
        completion(keyboardFrame)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        print("SHOW")
        moveCommentField(notification: notification) { (frame) in
            UIView.animate(withDuration: 0.3) {
                print(frame!.height)
                self.commentButtonConstraint.constant = frame!.height
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification){
        print("Hide")
        UIView.animate(withDuration: 0.3) {
            self.commentButtonConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
    }

}
