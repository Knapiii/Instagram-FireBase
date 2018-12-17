//
//  Config.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-17.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import Foundation

struct AuthConfig {
    static let FIRUrl = "https://instagram-fir.firebaseio.com"
    static let StorageUrl = "gs://instagram-fir.appspot.com"
    static let userUrl = "users"
    static let profilePictureUrl = "profile_image"
    static let postUrl = "posts"
    static let commentUrl = "comments"
    static let postCommentUrl = "post-comment"
    static let likesUrl = "likes"
    static let myPostsUrl = "myPosts"
}

struct FIRStrings {
    static let uid = "uid"

    //Sign
    static let username = "username"
    static let email = "email"
    static let profileImageUrl = "profileImageUrl"

    //Post
    static let caption = "caption"
    static let photoUrl = "photoUrl"
    static let videoUrl = "videoUrl"

    //Comments
    static let commentText = "commentText"
}

struct PostLikes {
    static let likes = "likes"
    static let likesCount = "likesCount"
}

struct Storyboard {
    static let SignInSB = "SignInViewController"
}

struct Identifier {
    static let SignUpIdentifier = "SignUp"
    static let SignInIdentifier = "SignIn"
    static let CommentCellIdentifier = "CommentTableViewCell"
    static let PhotoCellIdentifier = "PhotoCollectionViewCell"
    static let ProfileHeaderCollectionIdentifier = "HeaderProfileCollectionReusableView"
    static let UsersCellIdentifier = "UsersTableViewCell"
}

struct NibName {
    static let CameraHead = "CameraHead"
    static let WriteComment = "WriteComment"
    static let HomeTableCell = "HomeTableViewCell"
    static let CommentTableCell = "CommentTableViewCell"
    static let UsersTableCell = "UsersTableViewCell"
}

struct ImageName {
    static let placeHolderPhoto = "placeholder-photo"
    static let signInBackground = "background"
    static let placeholderProfileImage = "placeholderProfileImage"
    static let like = "like"
    static let likeSelected = "likeSelected"
}

struct Titles {
    static let Comment = "Comment"
    static let Home = "Home"
}
