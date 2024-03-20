//
//  ThreadReplyViewModel.swift
//  ThreadsClone
//
//  Created by Stefanus Albert Wilson on 3/19/24.
//

import Foundation
import Firebase

class ThreadReplyViewModel: ObservableObject {
    
    func uploadThreadReply(replyText: String, thread: Thread) async throws {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        let reply = ThreadReply(threadID: thread.id, replyText: replyText, threadReplyOwnerUid: uid, threadOwnerUid: thread.ownerUid, timestamp: Timestamp())
        
        
        try await ThreadReplyService.uploadThreadReply(reply, toThread: thread)
    }
}
