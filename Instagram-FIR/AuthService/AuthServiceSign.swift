//
//  AuthService.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-17.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class AuthServiceSign {
        
    static func signOut(currentVC: UIViewController) {
        do {
            try Auth.auth().signOut()
        } catch let logoutError {
            Alert.actionSheet(title: nil, msg: (logoutError as! String))
        }
        print("Signed out")
        let storyboard = UIStoryboard(name: "SignIn", bundle: nil)
        let signInVC = storyboard.instantiateViewController(withIdentifier: "SignInViewController")
        currentVC.present(signInVC, animated: true, completion: nil)
    }
    
   static func signIn(email: String, password: String, signedIn: (() -> Void)? = nil, onError: ((String?) -> Void)? = nil) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let error = error {
               onError!(error.localizedDescription)
               return
            }
            print("Signed In")
            signedIn!()
        }
    }
    
    static func autoSignIn(signedIn: (() -> Void)? = nil) {
        if Auth.auth().currentUser != nil {
            signedIn!()
        }
    }
   
   static func signUp(username: String, email: String, password: String, imageData: Data, signedIn: (() -> Void)? = nil, onError: ((String?) -> Void)? = nil) {
      Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
         if let error = error {
            onError!(error.localizedDescription)
            return
         }
         guard let uid = user?.uid else { return }
         let storageRef = Storage.storage().reference(forURL: Config.StorageUrl).child(Config.ppUrl).child(uid)
         storageRef.putData(imageData, metadata: nil, completion: { (metaData, error) in
            if error != nil {
               return
            }
            let profileImageUrl = metaData?.downloadURL()?.absoluteString
            self.setUserInformation(profilePicture: profileImageUrl!, username: username,
                                    email: email, uid: uid, signedIn: signedIn)
         })
      }
   }
    
    static func setUserInformation(profilePicture: String, username: String, email: String, uid: String, signedIn: (() -> Void)? = nil) {
      
        let ref = Database.database().reference(fromURL: Config.FIRUrl)
        let profileUsersReference = ref.child(Config.userUrl).child(uid)
            
        let values = [ "username": username,
                       "email": email,
                       "profileImageUrl": profilePicture as Any]
        profileUsersReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
            if let err = err {
                print(err)
                return
            }
            print("User Created")
            signedIn!()
        })
    }
    
}


