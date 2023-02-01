//
//  User.swift
//  GithubViewer
//
//  Created by Kaue Ludovico on 01/02/23.
//

import Foundation

struct User: Codable {
    var login: String
    var avatarUrl: String
    var reposUrl: String
    var name: String
    var publicUrl: String
}
