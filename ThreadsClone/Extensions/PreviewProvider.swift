//
//  PreviewProvider.swift
//  ThreadsClone
//
//  Created by Stefanus Albert Wilson on 2/22/24.
//

import Foundation
import SwiftUI
import Firebase

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullname: "Neymar Junior", email: "neymar@gmail.com", username: "neymarjr")
    
    lazy var thread = Thread(ownerUid: "123", caption: "This is a test thread", timestamp: Timestamp(), likes: 37, replyCount: 5, user: user)
    
    let reply = ThreadReply(replyId: NSUUID().uuidString, threadID: NSUUID().uuidString, replyText: "test", threadReplyOwnerUid: NSUUID().uuidString, threadOwnerUid: NSUUID().uuidString, timestamp: Timestamp())
}


