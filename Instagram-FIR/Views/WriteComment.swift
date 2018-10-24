//
//  WriteCommentUIView.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-22.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import Foundation
import UIKit
import Firebase

@IBDesignable
class WriteComment: UIView {

    @IBOutlet weak var userProfilePicture: UIImageView!
    @IBOutlet var writeCommentUIView: UIView!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    var post = Post()
    var postId: CommentViewController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commitInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commitInit()
    }
    
    private func commitInit() {
        let bundle = Bundle(for: WriteComment.self)
        bundle.loadNibNamed(NibName.WriteComment, owner: self, options: nil)
        addSubview(writeCommentUIView)
        writeCommentUIView.frame = self.bounds
        writeCommentUIView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        setUserProfilePicture()
        handleTextField()
    }
    
    func setUserProfilePicture() {
        AuthServiceLoadUser.loadCurrentUser { (user) in
            let user = user
            if let photoUrlString = user.profileImageUrl{
                let photoUrl = URL(string: photoUrlString)
                self.userProfilePicture.sd_setImage(with: photoUrl)
            }
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
    
    @IBAction func sendComment_TouchUp(_ sender: Any) {
        sendNewComment()
    }
    
    func sendNewComment() {
        AuthServiceUploadComment.sendCommentDataToDatabase(comment: commentTextField.text!, uploaded: {
            commentId in
            AuthServiceUploadComment.uploadPostComment(newCommentId: commentId!, postId: "DENNA-SKA-ÄNDRAS", uploaded: nil, onError: { error in
                ProgressHUD.showError(error)
            })
            self.emptyText()
            self.commentTextField.resignFirstResponder()
        }) { error in
            ProgressHUD.showError(error)
        }
    }
    
    func emptyText() {
        self.commentTextField.text = ""
        self.sendButton.isEnabled = false
        self.sendButton.setTitleColor(UIColor.buttonDisabled, for: .normal)
    }
    
}
