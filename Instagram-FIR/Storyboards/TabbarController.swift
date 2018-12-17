//
//  OpenCameraTab.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-17.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import UIKit

class OpenCameraTab: UITabBarController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var selectImageFromPicker: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self

        // Do any additional setup after loading the view.
    }

}

extension OpenCameraTab: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        guard let index = viewControllers?.index(of: viewController) else {
            return false
        }
        if index == 2 {
            openCamera()
        }
        return true
    }

    func openCamera() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        print(info)

        if let editedImage = info[.editedImage] as? UIImage {
            selectImageFromPicker = editedImage
        } else if let originalImage = info[.originalImage] as? UIImage {
            selectImageFromPicker = originalImage
        }

        if let selectedImage = selectImageFromPicker {
            //Om man väljer foto, skicka vidare denna till camera.storyboard
            //profileUIImage.image = selectedImage
        }

        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true) {
            let storyboard = UIStoryboard(name: "TabbarController", bundle: nil)
            let goToHome = storyboard.instantiateViewController(withIdentifier: "TabbarController")
            self.present(goToHome, animated: true, completion: nil)
        }

    }
}
