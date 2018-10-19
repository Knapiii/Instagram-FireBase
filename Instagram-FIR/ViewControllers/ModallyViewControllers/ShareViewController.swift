//
//  ShareViewController.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-18.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {

    @IBOutlet weak var cameraHeader: CameraHead!
    var selectImageFromPicker: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        cameraHeader.awakeFromNib()

    }

    func setupBackButton() {
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
    }
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cameraButton(_ sender: Any) {
        openCamera()
    }
}
