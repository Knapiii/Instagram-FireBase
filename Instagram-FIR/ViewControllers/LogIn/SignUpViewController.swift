//
//  SignUpViewController.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-15.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

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

    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        self.setBackgroundImage("Background", contentMode: .scaleAspectFill)
        changeProfileImageOnClick()
        signUpButton.alpha = 0.5
        self.hideKeyboardWhenTappedAround()
    }
    
    func labelsNotEmpty() -> Bool {
        if (userNameText.text?.isEmpty)! {
            Alert.actionSheet(title: nil, msg: "Fill in user name")
            return false
        } else if (emailText.text?.isEmpty)! {
            Alert.actionSheet(title: nil, msg: "Fill in email")
            return false
        } else if (passwordText.text?.isEmpty)!{
            Alert.actionSheet(title: nil, msg: "Fill in password")
            return false
        } else if isPicturePicked == false {
            Alert.actionSheet(title: nil, msg: "Take a profile picture")
            return false
        } else if samePassword == false {
            Alert.actionSheet(title: nil, msg: "Not the same password")
            return Bool()
        } else {
            return true
        }
     }
    
    @IBAction func SignUpAlpha(_ sender: UITextField) {
        if (userNameText.text?.isEmpty)! || (emailText.text?.isEmpty)! ||
            (passwordText.text?.isEmpty)! || (passwordRepeatText.text?.isEmpty)!
            || samePassword == false {
            signUpButton.alpha = 0.5
        } else {
            signUpButton.alpha = 1.0
        }
    }

    @IBAction func checkPassword(_ sender: UITextField) {
        if sender == passwordText {
            if passwordText.count > 5{
                checkBox1.image = #imageLiteral(resourceName: "box-green")
            } else {
                checkBox1.image = #imageLiteral(resourceName: "box-red")
            }
        } else if sender == passwordRepeatText {
            if passwordRepeatText.count > 5 {
                if passwordText.text == passwordRepeatText.text{
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
        if labelsNotEmpty() == true && samePassword == true{
            createUser()
        }
    }
    
    @IBAction func SignUp(_ sender: Any) {
        checkSignUp()
    }
    
    func createUser(){
        let username = self.userNameText.text!
        let email = self.emailText.text!
        let password = self.passwordText.text!
        view.endEditing(true)
        ProgressHUD.show("Waiting...")
        if let profileImg = self.selectImageFromPicker{
            if let imageData = profileImg.jpegData(compressionQuality: 0.1){
                AuthService.signUp(username: username, email: email, password: password, imageData: imageData, signedIn: {
                    ProgressHUD.showSuccess("User created")
                    self.performSegue(withIdentifier: Identifier.SignUpIdentifier, sender: nil)
                }) { (error) in
                    Alert.actionSheet(title: nil, msg: "\(error!)")
                }
            }
        }
    }
}
