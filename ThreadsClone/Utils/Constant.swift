//
//  Constant.swift
//  ThreadsClone
//
//  Created by Stefanus Albert Wilson on 3/5/24.
//

import Firebase

struct FirestoreConstants {
    private static let Root = Firestore.firestore()
    
    static let UserCollection = Root.collection("users")
    static let ThreadsCollection = Root.collection("threads")
    
    static let Followersollection = Root.collection("followers")
    static let FollowingCollection = Root.collection("following")
    
    static let RepliesCollection = Root.collection("replies")
    static let ActivityCollection = Root.collection("activity")
}
