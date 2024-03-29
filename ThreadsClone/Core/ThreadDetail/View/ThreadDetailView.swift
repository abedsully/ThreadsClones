//
//  ThreadDetailView.swift
//  ThreadsClone
//
//  Created by Stefanus Albert Wilson on 3/20/24.
//

import SwiftUI

struct ThreadDetailView: View {
    let thread: Thread
    @StateObject var viewModel: ThreadDetailViewModel
    
    
    init (thread: Thread){
        self.thread = thread
        self._viewModel = StateObject(wrappedValue: ThreadDetailViewModel(thread: thread))
    }
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    CircularProfileImageView(user: thread.user, size: .small)
                    
                    Text(thread.user?.username ?? "")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Text(thread.timestamp.timestampString())
                        .font(.caption)
                        .foregroundColor(Color(.systemGray3))
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "ellipsis")
                            .foregroundColor(Color(.darkGray))
                    }
                }
                
                VStack (alignment: .leading, spacing: 12){
                    Text(thread.caption)
                        .font(.subheadline)
                    ContentActionButtonView(thread: thread)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Divider()
                    .padding(.vertical)
                
                
                
                LazyVStack {
                    ForEach(viewModel.replies) { reply in
                        ThreadReplyCell(reply: reply)
                    }
                }
            }
        }
        .padding()
        .navigationTitle("Thread")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ThreadDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ThreadDetailView(thread: dev.thread)
    }
}
