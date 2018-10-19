//
//  SignInViewController.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-15.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {

    @IBOutlet weak var noAccountButton: UIButton!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var signInButton: UIButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBackgroundImage("Background", contentMode: .scaleAspectFill)
        self.hideKeyboardWhenTappedAround()
        signInButton.alpha = 0.5
        self.hideKeyboardWhenTappedAround()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        AuthService.autoSignIn {
            self.performSegue(withIdentifier: Identifier.SignInIdentifier, sender: nil)
        }
    }

    @IBAction func signInAlpha(_ sender: Any) {
        if(emailText.text?.isEmpty)! || (passwordText.text?.isEmpty)! {
            signInButton.alpha = 0.5
        } else {
            signInButton.alpha = 1.0
        }
    }
    
    @IBAction func SignIn(_ sender: Any) {
        view.endEditing(true)
        ProgressHUD.show("Waiting...")
        AuthService.signIn(email: emailText.text!, password: passwordText.text!, signedIn: {
            ProgressHUD.showSuccess("Logged in")
            self.performSegue(withIdentifier: Identifier.SignInIdentifier, sender: nil)
        }) { error in
            Alert.actionSheet(title: nil, msg: "\(error!)")
        }
    }
}
