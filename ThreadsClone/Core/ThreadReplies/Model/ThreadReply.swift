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
    
    
    var id: String? {
        return replyId ?? NSUUID().uuidString
    }
}
