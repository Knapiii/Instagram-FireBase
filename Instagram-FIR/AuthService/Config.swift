//
//  Config.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-17.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import Foundation

struct AuthConfig {
    static var FIRUrl = "https://instagram-fir.firebaseio.com"
    static var StorageUrl = "gs://instagram-fir.appspot.com"
    static var userUrl = "users"
    static var profilePictureUrl = "profile_image"
    static var postUrl = "posts"
    static var commentUrl = "comments"
    static var postCommentUrl = "post-comment"
    static var likesUrl = "likes"
    static var myPostsUrl = "myPosts"
}

struct FIRStrings{
    static var uid = "uid"

    //Sign
    static var username = "username"
    static var email = "email"
    static var profileImageUrl = "profileImageUrl"
    
    //Post
    static var caption = "caption"
    static var photoUrl = "photoUrl"
    static var videoUrl = "videoUrl"
    
    //Comments
    static var commentText = "commentText"
}

struct PostLikes {
    static var likes = "likes"
    static var likesCount = "likesCount"
}

struct Storyboard {
    static var SignInSB = "SignInViewController"
}

struct Identifier {
    static var SignUpIdentifier = "SignUp"
    static var SignInIdentifier = "SignIn"
    static var CommentIdentifier = "CommentTableViewCell"
    static var PhotoCellIdentifier = "PhotoCollectionViewCell"
    static var ProfileHeaderCollectionIdentifier = "HeaderProfileCollectionReusableView"
}

struct NibName {
    static var CameraHead = "CameraHead"
    static var WriteComment = "WriteComment"
    static var HomeTableCell = "HomeTableViewCell"
    static var CommentTableCell = "CommentTableViewCell"
}

struct ImageName {
    static var placeHolderPhoto = "placeholder-photo"
    static var signInBackground = "background"
    static var placeholderProfileImage = "placeholderProfileImage"
    static var like = "like"
    static var likeSelected = "likeSelected"
}

struct Titles {
    static var Comment = "Comment"
    static var Home = "Home"
//    static var Profile: String! {
//        AuthServiceLoadUser.loadCurrentUser { (user) in
//            let userId = user.username
//            return userId
//        }
//    }
}
