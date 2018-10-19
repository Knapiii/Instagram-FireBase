//
//  ShareViewController.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-18.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import UIKit
import Firebase

class ShareViewController: UIViewController {

    @IBOutlet weak var cameraHeader: CameraHead!
    var selectImageFromPicker: UIImage?
    @IBOutlet weak var shareButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cameraHeader.awakeFromNib()
        changeProfileImageOnClick()
        self.hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handlePhoto()
    }
        
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cameraButton(_ sender: Any) {
        openCamera()
    }
    
    @IBAction func shareButton_TouchUp(_ sender: Any) {
        sharePost()
    }
    
    func handlePhoto() {
        if selectImageFromPicker != nil {
            shareButton.setTitleColor(UIColor.buttonEnabled, for: UIControl.State.normal)
        } else {
            shareButton.setTitleColor(UIColor.buttonDisabled, for: UIControl.State.normal)
        }
    }
    
    func sharePost() {
        let photo = selectImageFromPicker
        let caption = cameraHeader.caption.text!
        ProgressHUD.show("Waiting...")
        if let profileImg = photo {
            if let imageData = profileImg.jpegData(compressionQuality: 0.1){
                AuthServiceUploadPost.uploadPhoto(caption: caption, imageData: imageData, uploaded: {
                    ProgressHUD.showSuccess("Succes")
                    self.resetPost()
                    self.dismiss(animated: true, completion: nil)
                }) { (error) in
                    ProgressHUD.showError(error)
                }
            }
        } else {
            ProgressHUD.showError("Image can't be empty")
        }
    }
    
    func resetPost() {
        self.cameraHeader.caption.text = ""
        self.selectImageFromPicker = UIImage(named: ImageName.placeHolderPhoto)
        self.selectImageFromPicker = nil
    }

}
