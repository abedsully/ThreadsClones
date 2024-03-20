//
//  ThreadDetailViewModel.swift
//  ThreadsClone
//
//  Created by Stefanus Albert Wilson on 3/20/24.
//

import Foundation

@MainActor
class ThreadDetailViewModel: ObservableObject {
    @Published var replies =  [ThreadReply]()
    
    
    private let thread: Thread
    
    
    init(thread: Thread) {
        self.thread = thread
        Task {try await fetchThreadReplies() }
    }
    
    @MainActor
    private func fetchThreadReplies() async throws{
        self.replies = try await ThreadReplyService.fetchThreadReplies(forThread: thread)
        try await fetchUserDataForReplies()
    }
    
//    for fetching in reply view
    private func fetchUserDataForReplies() async throws{
        for i in 0 ..< replies.count {
            let reply = replies[i]
            
            async let user = try await UserService.fetchUser(withUid: reply.threadReplyOwnerUid)
            
            self.replies[i].replyUser = try await user
            
        }
    }
}
