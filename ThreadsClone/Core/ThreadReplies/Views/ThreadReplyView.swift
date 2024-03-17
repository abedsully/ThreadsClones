//
//  ThreadReplyView.swift
//  ThreadsClone
//
//  Created by Stefanus Albert Wilson on 3/5/24.
//

import SwiftUI

struct ThreadReplyView: View {
    let thread: Thread
    @Environment (\.dismiss) var dismiss
    @State private var replyText = ""
    @State private var threadViewHeight: CGFloat = 24
    
    
    private var currentUser: User?{
        UserService.shared.currentUser
    }
    
    func setThraadHeight(){
        let imageDimension: CGFloat = ProfileImageSize.small.dimension
        let padding: CGFloat = 16
        let width = UIScreen.main.bounds.width - imageDimension - padding
        let font = UIFont.systemFont(ofSize: 16)
        
        let captionSize = thread.caption.heightWithConstrainedWidth(width, font: font)
        
        threadViewHeight = captionSize + imageDimension
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Divider()
                
                VStack (alignment: .leading, spacing: 12) {
                    HStack(alignment: .top) {
                        VStack {
                            CircularProfileImageView(user: thread.user, size: .small)
                            
                            Rectangle()
                                .frame(width: 2, height: 50)
                                .foregroundColor(Color(.systemGray4))
                        }
                        
                        VStack (alignment: .leading, spacing: 4){
                            Text(thread.user?.username ?? "")
                                .fontWeight(.semibold)
                            
                            Text(thread.caption)
                                .multilineTextAlignment(.leading)
                        }
                        .font(.footnote)
                        
                        Spacer()
                    }
                    
                    HStack (alignment: .top){
                        CircularProfileImageView(user: currentUser, size: .small)
                        
                        VStack (alignment: .leading, spacing: 4){
                            Text(currentUser?.username ?? "")
                            
                            TextField("Add Your Reply...", text: $replyText)
                                .multilineTextAlignment(.leading)
                        }
                        .font(.footnote)
                    }
                }
                .padding()
                
                Spacer()
            }
            .onAppear {setThraadHeight()}
            .navigationTitle("Reply")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button ("Cancel"){
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button ("Post") {
                        Task {
                            dismiss()
                        }
                    }
                    .opacity(replyText.isEmpty ? 0.5 : 1)
                    .disabled(replyText.isEmpty)
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                }
            }
        }
    }
}

struct ThreadReplyView_Previews: PreviewProvider {
    static var previews: some View {
        ThreadReplyView(thread: dev.thread)
    }
}

