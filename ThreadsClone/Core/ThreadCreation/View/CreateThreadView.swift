//
//  CreateThreadView.swift
//  ThreadsClone
//
//  Created by Stefanus Albert Wilson on 2/19/24.
//

import SwiftUI

struct CreateThreadView: View {
    
    @Environment (\.dismiss) var dismiss
    @State private var caption = ""
    @StateObject var viewModel = CreateThreadViewModel()
    
    private var user: User? {
        return UserService.shared.currentUser
    }
    
    var body: some View {
        NavigationStack {
            VStack{
                HStack (alignment: .top) {
                    CircularProfileImageView(user: user, size: .small)
                    
                    VStack (alignment: .leading, spacing: 4){
                        Text(user?.username ?? "")
                            .fontWeight(.semibold)
                        
                        TextField("Start a thread...", text: $caption, axis: .vertical)
                    }
                    .font(.footnote)
                    
                    Spacer()
                    
                    if !caption.isEmpty {
                        Button {
                            caption = ""
                        } label: {
                            Image(systemName: ("xmark"))
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundColor(.gray)
                        }
                    }
                    

                }
                
                Spacer()
            }
            .padding(.horizontal)
            .navigationTitle("New Thread")
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
                        Task {try await viewModel.uploadThread(caption: caption)}
                        dismiss()
                    }
                    .opacity(caption.isEmpty ? 0.5 : 1)
                    .disabled(caption.isEmpty)
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                }
            }
        }
    }
}
