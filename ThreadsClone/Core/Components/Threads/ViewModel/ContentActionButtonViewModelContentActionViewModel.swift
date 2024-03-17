//
//  ContentActionButtonViewModel.swift
//  ThreadsClone
//
//  Created by Stefanus Albert Wilson on 3/4/24.
//

import Foundation

@MainActor
class ContentActionButtonViewModel: ObservableObject {
    @Published var thread: Thread
    
    
    init(thread: Thread) {
        self.thread = thread
        Task {try await checkIfUserLikedThread() }
    }
    
    func likeThread() async throws{
        try await ThreadService.likeThread(thread)
        self.thread.didLike = true
        self.thread.likes += 1
    }
    
    func unlikeThread() async throws {
        try await ThreadService.unlikeThread(thread)
        self.thread.didLike = false
        self.thread.likes = -1
    }
    
    func checkIfUserLikedThread() async throws {
        let didLike = try await ThreadService.checkIfUserLikeThread(thread)
        
        // only execute update when thread has been liked
        if didLike {
            self.thread.didLike = true
        }
    }
    
}
