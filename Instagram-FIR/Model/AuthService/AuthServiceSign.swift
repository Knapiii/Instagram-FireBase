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


   static func signIn(email: String, password: String, signedIn: (() -> Void)? = nil, onError: ((String?) -> Void)? = nil) {
      Auth.auth().signIn(withEmail: email, password: password) { (_, error) in
         if let error = error {
            onError!(error.localizedDescription)
            return
         }
         signedIn!()
      }
   }

   static func signOut(currentVC: UIViewController) {
      do {
         try Auth.auth().signOut()
      } catch let logoutError {
         ProgressHUD.showError(logoutError.localizedDescription)
      }
      let storyboard = UIStoryboard(name: "SignIn", bundle: nil)
      let signInVC = storyboard.instantiateViewController(withIdentifier: "SignInViewController")
      currentVC.present(signInVC, animated: true, completion: nil)
   }

   static func autoSignIn(signedIn: (() -> Void)? = nil) {
      if Auth.auth().currentUser != nil {
         signedIn!()
      }
   }
   static func signUp(username: String, email: String, password: String, imageData: Data, signedIn: (() -> Void)? = nil, onError: ((String?) -> Void)? = nil) {
      Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
         if error != nil {
            onError!(error!.localizedDescription)
            return
         }
         let uid = user?.uid
         let storageRef = Storage.storage().reference(forURL: AuthConfig.storageUrl).child(AuthConfig.profilePictureUrl).child(uid!)

         storageRef.putData(imageData, metadata: nil, completion: { (metadata, error) in
            if error != nil {
               return
            }
            let profileImageUrl = metadata?.downloadURL()?.absoluteString
            self.setUserInfomation(profileImageUrl: profileImageUrl!, username: username, email: email, uid: uid!, signedIn: signedIn)
         })
      })
   }

   static func setUserInfomation(profileImageUrl: String, username: String, email: String, uid: String, signedIn: (() -> Void)? = nil) {
      let ref = Database.database().reference()
      let usersReference = ref.child(AuthConfig.userUrl)
      let newUserReference = usersReference.child(uid)
      newUserReference.setValue([FIRStrings.username: username, FIRStrings.usernameLowerCase: username.lowercased(), FIRStrings.email: email, FIRStrings.profileImageUrl: profileImageUrl])
      signedIn!()
   }

}
