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
    static var ppUrl = "Profile_image"
    static var uploadPhotoUrl = "posts"
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
}

struct ImageNeme {
    static var placeHolderPhoto = "placeholder-photo"
    static var signInBackground = "background"
    static var placeholderProfileImage = "placeholderProfileImage"
}
