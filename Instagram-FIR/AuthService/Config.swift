//
//  Config.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-17.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import Foundation

struct AuthConfig {
    static var FIRUrl = "https://instagram-fir.firebaseio.com/"
    static var StorageUrl = "gs://instagram-fir.appspot.com"
    static var userUrl = "users"
    static var profilePictureUrl = "Profile_image"
    static var postUrl = "posts"
}

struct FIRStrings{
    //Sign
    static var username = "username"
    static var email = "email"
    static var profileImageUrl = "profileImageUrl"
    
    //Post
    static var caption = "caption"
    static var photoUrl = "photoUrl"
    static var videoUrl = "videoUrl"
}

struct Storyboard {
    static var SignInSB = "SignInViewController"
}

struct Identifier {
    static var SignUpIdentifier = "SignUp"
    static var SignInIdentifier = "SignIn"
}

struct NibName {
    static var CameraHead = "CameraHead"
    static var HomeTableCell = "HomeTableViewCell"
}

struct ImageName {
    static var placeHolderPhoto = "placeholder-photo"
    static var signInBackground = "background"
    static var placeholderProfileImage = "placeholderProfileImage"
}
