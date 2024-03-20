//
//  ThreadReply.swift
//  ThreadsClone
//
//  Created by Stefanus Albert Wilson on 3/9/24.
//

import Firebase
import FirebaseFirestoreSwift

struct ThreadReply: Identifiable, Codable {
    @DocumentID var replyId: String?
    let threadID: String
    let replyText: String
    let threadReplyOwnerUid: String
    let threadOwnerUid: String
    let timestamp: Timestamp
    
    var thread: Thread?
    var replyUser: User?
    
    
    
    var id: String? {
        return replyId ?? NSUUID().uuidString
    }
}
