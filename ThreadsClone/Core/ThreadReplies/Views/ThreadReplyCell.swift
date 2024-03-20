//
//  ThreadReplyCell.swift
//  ThreadsClone
//
//  Created by Stefanus Albert Wilson on 3/20/24.
//

import SwiftUI

struct ThreadReplyCell: View {
    let reply: ThreadReply
    
    private var user: User? {
        return reply.replyUser
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                CircularProfileImageView(user: user, size: .small)
                
                VStack (alignment: .leading, spacing: 4){
                    
                    HStack {
                        Text(user?.username ?? "")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text(reply.timestamp.timestampString())
                            .font(.caption)
                            .foregroundStyle(Color(.systemGray3))
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(Color(.darkGray))
                        }
                    }
                    
                    
                    Text(reply.replyText)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                }
            }
            Divider()
        }
        .padding()
    }
}
