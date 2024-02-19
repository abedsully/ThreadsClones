//
//  User.swift
//  ThreadsClone
//
//  Created by Stefanus Albert Wilson on 2/22/24.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
}
