//
//  Camera+Picker.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-17.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import Foundation

extension ShareViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITabBarDelegate, UITabBarControllerDelegate {
    
    @objc func openCamera() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let editedImage = info[.editedImage] as? UIImage {
            selectImageFromPicker = editedImage
        } else if let originalImage = info[.originalImage] as? UIImage {
            selectImageFromPicker = originalImage
        }
        
        if let selectedImage = selectImageFromPicker{
            cameraHeader.placeHolderImage.image = selectedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func changeProfileImageOnClick(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ShareViewController.openCamera))
        cameraHeader.placeHolderImage.addGestureRecognizer(tapGesture)
        cameraHeader.placeHolderImage.isUserInteractionEnabled = true
    }
    
}


