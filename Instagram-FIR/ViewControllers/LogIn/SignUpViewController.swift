//
//  SignUpViewController.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-15.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var alreadyHaveAccount: UIButton!
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var passwordRepeatText: UITextField!
    @IBOutlet weak var profileUIImage: UIImageView!
    @IBOutlet weak var checkBox1: UIImageView!
    @IBOutlet weak var checkBox2: UIImageView!

    var selectImageFromPicker: UIImage?
    var isPicturePicked = false
    var samePassword = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBackgroundImage(ImageName.signInBackground, contentMode: .scaleAspectFill)
        changeProfileImageOnClick()
        signUpButton.alpha = 0.5
        self.hideKeyboardWhenTappedAround()
    }

    @IBAction func SignUpAlpha(_ sender: UITextField) {
        if (userNameText.text?.isEmpty)! || (emailText.text?.isEmpty)! ||
            (passwordText.text?.isEmpty)! || (passwordRepeatText.text?.isEmpty)!
            || samePassword == false || profileUIImage == nil {
            signUpButton.alpha = 0.5
        } else {
            signUpButton.alpha = 1.0
        }
    }

    @IBAction func checkPassword(_ sender: UITextField) {
        if sender == passwordText {
            if passwordText.count > 5 {
                checkBox1.image = #imageLiteral(resourceName: "box-green")
            } else {
                checkBox1.image = #imageLiteral(resourceName: "box-red")
            }
        } else if sender == passwordRepeatText {
            if passwordRepeatText.count > 5 {
                if passwordText.text == passwordRepeatText.text {
                    samePassword = true
                    checkBox1.image = #imageLiteral(resourceName: "box-green")
                    checkBox2.image = #imageLiteral(resourceName: "box-green")
                } else {
                    checkBox2.image = #imageLiteral(resourceName: "box-red")
                    samePassword = false
                }
            }
        }
    }

    @IBAction func dissmiss_onClick(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    func checkSignUp() {
        if labelsNotEmpty() == true && samePassword == true {
            createUser()
        }
    }

    @IBAction func SignUp(_ sender: UIButton) {
        checkSignUp()
    }

    func createUser() {
        view.endEditing(true)
        ProgressHUD.show("Waiting...")
        if let profileImg = self.selectImageFromPicker {
            if let imageData = profileImg.jpegData(compressionQuality: 0.1) {
                AuthServiceSign.signUp(username: self.userNameText.text!, email: self.emailText.text!, password: self.passwordText.text!, imageData: imageData, signedIn: {
                    ProgressHUD.showSuccess("User created")
                    self.performSegue(withIdentifier: Identifier.SignUpIdentifier, sender: nil)
                }) { (error) in
                    ProgressHUD.showError(error!)
                }
            }
        }
    }
}
