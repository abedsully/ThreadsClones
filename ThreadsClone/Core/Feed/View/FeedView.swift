//
//  FeedView.swift
//  ThreadsClone
//
//  Created by Stefanus Albert Wilson on 2/19/24.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(viewModel.threads) { thread in
                        NavigationLink(value: thread){
                            ThreadCell(thread: thread)
                        }
                    }
                }
            }
            .refreshable {
                Task {try await viewModel.fetchThreads()}
            }
            .navigationDestination(for: Thread.self, destination: { thread in
                ThreadDetailView(thread: thread)
            })
            .navigationTitle("Threads")
            .navigationBarTitleDisplayMode(.inline)
        }
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "arrow.counterclockwise")
                        .foregroundColor(.black)
                }
            }
        }
        
    }
}

#Preview {
    NavigationStack {
        FeedView()
    }
}
