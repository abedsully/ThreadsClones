//
//  LoginViewModel.swift
//  ThreadsClone
//
//  Created by Stefanus Albert Wilson on 2/22/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    @MainActor
    func login() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
